// Copyright 2009, Andrew Corrigan, acorriga@gmu.edu
// This code is from the AIAA-2009-4001 paper

#include <cmath>
#include <fstream>
#include <iostream>
#include <omp.h>
#include <malloc.h>

#ifdef GEM_FORGE
#include "gem5/m5ops.h"
#endif

struct double3 {
  double x, y, z;
};

/*
 * Options
 *
 */
#define GAMMA 1.4
//#define iterations 2000

#define NDIM 3
#define NNB 4

#define RK 3 // 3rd order RK
#define ff_mach 1.2
#define deg_angle_of_attack 0.0

/*
 * not options
 */
#define VAR_DENSITY 0
#define VAR_MOMENTUM 1
#define VAR_DENSITY_ENERGY (VAR_MOMENTUM + NDIM)
#define NVAR (VAR_DENSITY_ENERGY + 1)

/*
 * Generic functions
 */
template <typename T> T *alloc(int N) { return new T[N]; }
template <typename T> void dealloc(T *array) { delete[] array; }

template <typename T> void copy(T *dst, T *src, int N) {
#ifdef GEM_FORGE
  m5_work_begin(3, 0);
#endif
#pragma omp parallel for firstprivate(dst, src, N) schedule(static)
  for (int i = 0; i < N; i++) {
    auto v = src[i];
    dst[i] = v;
  }
#ifdef GEM_FORGE
  m5_work_end(3, 0);
#endif
}

void dump(double *variables, int nel, int nelr) {

  {
    std::ofstream file("density");
    file << nel << " " << nelr << std::endl;
    for (int i = 0; i < nel; i++)
      file << variables[i * NVAR + VAR_DENSITY] << std::endl;
  }

  {
    std::ofstream file("momentum");
    file << nel << " " << nelr << std::endl;
    for (int i = 0; i < nel; i++) {
      for (int j = 0; j != NDIM; j++)
        file << variables[i * NVAR + (VAR_MOMENTUM + j)] << " ";
      file << std::endl;
    }
  }

  {
    std::ofstream file("density_energy");
    file << nel << " " << nelr << std::endl;
    for (int i = 0; i < nel; i++)
      file << variables[i * NVAR + VAR_DENSITY_ENERGY] << std::endl;
  }
}

/*
 * Element-based Cell-centered FVM solver functions
 */
double ff_variable[NVAR];
double3 ff_flux_contribution_momentum_x;
double3 ff_flux_contribution_momentum_y;
double3 ff_flux_contribution_momentum_z;
double3 ff_flux_contribution_density_energy;

void initialize_variables(int nelr, double *variables) {
#pragma omp parallel for default(shared) schedule(static)
  for (int i = 0; i < nelr; i++) {
    for (int j = 0; j < NVAR; j++)
      variables[i * NVAR + j] = ff_variable[j];
  }
}

inline void compute_flux_contribution(double &density, double3 &momentum,
                                      double &density_energy, double &pressure,
                                      double3 &velocity, double3 &fc_momentum_x,
                                      double3 &fc_momentum_y,
                                      double3 &fc_momentum_z,
                                      double3 &fc_density_energy) {
  fc_momentum_x.x = velocity.x * momentum.x + pressure;
  fc_momentum_x.y = velocity.x * momentum.y;
  fc_momentum_x.z = velocity.x * momentum.z;

  fc_momentum_y.x = fc_momentum_x.y;
  fc_momentum_y.y = velocity.y * momentum.y + pressure;
  fc_momentum_y.z = velocity.y * momentum.z;

  fc_momentum_z.x = fc_momentum_x.z;
  fc_momentum_z.y = fc_momentum_y.z;
  fc_momentum_z.z = velocity.z * momentum.z + pressure;

  double de_p = density_energy + pressure;
  fc_density_energy.x = velocity.x * de_p;
  fc_density_energy.y = velocity.y * de_p;
  fc_density_energy.z = velocity.z * de_p;
}

inline void compute_velocity(double &density, double3 &momentum,
                             double3 &velocity) {
  velocity.x = momentum.x / density;
  velocity.y = momentum.y / density;
  velocity.z = momentum.z / density;
}

inline double compute_speed_sqd(double3 &velocity) {
  return velocity.x * velocity.x + velocity.y * velocity.y +
         velocity.z * velocity.z;
}

inline double compute_pressure(double &density, double &density_energy,
                               double &speed_sqd) {
  return (double(GAMMA) - double(1.0)) *
         (density_energy - double(0.5) * density * speed_sqd);
}

inline double compute_speed_of_sound(double &density, double &pressure) {
  return std::sqrt(double(GAMMA) * pressure / density);
}

void compute_step_factor(uint64_t nelr, double *variables, double *areas,
                         double *step_factors) {
#ifdef GEM_FORGE
  m5_work_begin(0, 0);
#endif
#pragma omp parallel for firstprivate(nelr, variables, areas, step_factors)    \
    schedule(static)
  for (uint64_t i = 0; i < nelr; i++) {

    double3 momentum;
    double density = variables[NVAR * i + VAR_DENSITY];
    momentum.x = variables[NVAR * i + (VAR_MOMENTUM + 0)];
    momentum.y = variables[NVAR * i + (VAR_MOMENTUM + 1)];
    momentum.z = variables[NVAR * i + (VAR_MOMENTUM + 2)];
    double density_energy = variables[NVAR * i + VAR_DENSITY_ENERGY];

    double3 velocity;
    compute_velocity(density, momentum, velocity);
    double speed_sqd = compute_speed_sqd(velocity);
    double pressure = compute_pressure(density, density_energy, speed_sqd);
    double speed_of_sound = compute_speed_of_sound(density, pressure);

    // dt = double(0.5) * std::sqrt(areas[i]) /  (||v|| + c).... but when we do
    // time stepping, this later would need to be divided by the area, so we
    // just do it all at once
    double area = areas[i];
    step_factors[i] = double(0.5) / (std::sqrt(area) *
                                     (std::sqrt(speed_sqd) + speed_of_sound));
  }
#ifdef GEM_FORGE
  m5_work_end(0, 0);
#endif
}

void compute_flux(uint64_t nelr, int *elements_surrounding_elements,
                  double *normals, double *variables, double *fluxes) {
  const double smoothing_coefficient = double(0.2f);

#ifdef GEM_FORGE
  m5_work_begin(1, 0);
#endif
#pragma omp parallel for firstprivate(                                         \
    nelr, elements_surrounding_elements, normals, variables, fluxes,           \
    smoothing_coefficient, ff_variable, ff_flux_contribution_momentum_x,       \
    ff_flux_contribution_momentum_y, ff_flux_contribution_momentum_z,          \
    ff_flux_contribution_density_energy) default(none) schedule(static)
  for (uint64_t i = 0; i < nelr; i++) {
    double factor;

    double density_i = variables[NVAR * i + VAR_DENSITY];
    double3 momentum_i;
    momentum_i.x = variables[NVAR * i + (VAR_MOMENTUM + 0)];
    momentum_i.y = variables[NVAR * i + (VAR_MOMENTUM + 1)];
    momentum_i.z = variables[NVAR * i + (VAR_MOMENTUM + 2)];

    double density_energy_i = variables[NVAR * i + VAR_DENSITY_ENERGY];

    double3 velocity_i;
    compute_velocity(density_i, momentum_i, velocity_i);
    double speed_sqd_i = compute_speed_sqd(velocity_i);
    double speed_i = std::sqrt(speed_sqd_i);
    double pressure_i =
        compute_pressure(density_i, density_energy_i, speed_sqd_i);
    double speed_of_sound_i = compute_speed_of_sound(density_i, pressure_i);
    double3 flux_contribution_i_momentum_x, flux_contribution_i_momentum_y,
        flux_contribution_i_momentum_z;
    double3 flux_contribution_i_density_energy;
    compute_flux_contribution(
        density_i, momentum_i, density_energy_i, pressure_i, velocity_i,
        flux_contribution_i_momentum_x, flux_contribution_i_momentum_y,
        flux_contribution_i_momentum_z, flux_contribution_i_density_energy);

    double flux_i_density = double(0.0);
    double3 flux_i_momentum;
    flux_i_momentum.x = double(0.0);
    flux_i_momentum.y = double(0.0);
    flux_i_momentum.z = double(0.0);
    double flux_i_density_energy = double(0.0);

    double3 velocity_nb;
    double density_nb, density_energy_nb;
    double3 momentum_nb;
    double3 flux_contribution_nb_momentum_x, flux_contribution_nb_momentum_y,
        flux_contribution_nb_momentum_z;
    double3 flux_contribution_nb_density_energy;
    double speed_sqd_nb, speed_of_sound_nb, pressure_nb;

    for (uint64_t j = 0; j < NNB; j++) {
      int64_t nb = elements_surrounding_elements[i * NNB + j];
      double3 normal;
      normal.x = normals[(i * NNB + j) * NDIM + 0];
      normal.y = normals[(i * NNB + j) * NDIM + 1];
      normal.z = normals[(i * NNB + j) * NDIM + 2];
      double normal_len = std::sqrt(normal.x * normal.x + normal.y * normal.y +
                                    normal.z * normal.z);

      if (nb >= 0) // a legitimate neighbor
      {
        density_nb = variables[nb * NVAR + VAR_DENSITY];
        momentum_nb.x = variables[nb * NVAR + (VAR_MOMENTUM + 0)];
        momentum_nb.y = variables[nb * NVAR + (VAR_MOMENTUM + 1)];
        momentum_nb.z = variables[nb * NVAR + (VAR_MOMENTUM + 2)];
        density_energy_nb = variables[nb * NVAR + VAR_DENSITY_ENERGY];
        compute_velocity(density_nb, momentum_nb, velocity_nb);
        speed_sqd_nb = compute_speed_sqd(velocity_nb);
        pressure_nb =
            compute_pressure(density_nb, density_energy_nb, speed_sqd_nb);
        speed_of_sound_nb = compute_speed_of_sound(density_nb, pressure_nb);
        compute_flux_contribution(
            density_nb, momentum_nb, density_energy_nb, pressure_nb,
            velocity_nb, flux_contribution_nb_momentum_x,
            flux_contribution_nb_momentum_y, flux_contribution_nb_momentum_z,
            flux_contribution_nb_density_energy);

        // artificial viscosity
        factor = -normal_len * smoothing_coefficient * double(0.5) *
                 (speed_i + std::sqrt(speed_sqd_nb) + speed_of_sound_i +
                  speed_of_sound_nb);
        flux_i_density += factor * (density_i - density_nb);
        flux_i_density_energy +=
            factor * (density_energy_i - density_energy_nb);
        flux_i_momentum.x += factor * (momentum_i.x - momentum_nb.x);
        flux_i_momentum.y += factor * (momentum_i.y - momentum_nb.y);
        flux_i_momentum.z += factor * (momentum_i.z - momentum_nb.z);

        // accumulate cell-centered fluxes
        factor = double(0.5) * normal.x;
        flux_i_density += factor * (momentum_nb.x + momentum_i.x);
        flux_i_density_energy +=
            factor * (flux_contribution_nb_density_energy.x +
                      flux_contribution_i_density_energy.x);
        flux_i_momentum.x += factor * (flux_contribution_nb_momentum_x.x +
                                       flux_contribution_i_momentum_x.x);
        flux_i_momentum.y += factor * (flux_contribution_nb_momentum_y.x +
                                       flux_contribution_i_momentum_y.x);
        flux_i_momentum.z += factor * (flux_contribution_nb_momentum_z.x +
                                       flux_contribution_i_momentum_z.x);

        factor = double(0.5) * normal.y;
        flux_i_density += factor * (momentum_nb.y + momentum_i.y);
        flux_i_density_energy +=
            factor * (flux_contribution_nb_density_energy.y +
                      flux_contribution_i_density_energy.y);
        flux_i_momentum.x += factor * (flux_contribution_nb_momentum_x.y +
                                       flux_contribution_i_momentum_x.y);
        flux_i_momentum.y += factor * (flux_contribution_nb_momentum_y.y +
                                       flux_contribution_i_momentum_y.y);
        flux_i_momentum.z += factor * (flux_contribution_nb_momentum_z.y +
                                       flux_contribution_i_momentum_z.y);

        factor = double(0.5) * normal.z;
        flux_i_density += factor * (momentum_nb.z + momentum_i.z);
        flux_i_density_energy +=
            factor * (flux_contribution_nb_density_energy.z +
                      flux_contribution_i_density_energy.z);
        flux_i_momentum.x += factor * (flux_contribution_nb_momentum_x.z +
                                       flux_contribution_i_momentum_x.z);
        flux_i_momentum.y += factor * (flux_contribution_nb_momentum_y.z +
                                       flux_contribution_i_momentum_y.z);
        flux_i_momentum.z += factor * (flux_contribution_nb_momentum_z.z +
                                       flux_contribution_i_momentum_z.z);
      } else if (nb == -1) // a wing boundary
      {
        flux_i_momentum.x += normal.x * pressure_i;
        flux_i_momentum.y += normal.y * pressure_i;
        flux_i_momentum.z += normal.z * pressure_i;
      } else if (nb == -2) // a far field boundary
      {
        factor = double(0.5) * normal.x;
        flux_i_density +=
            factor * (ff_variable[VAR_MOMENTUM + 0] + momentum_i.x);
        flux_i_density_energy +=
            factor * (ff_flux_contribution_density_energy.x +
                      flux_contribution_i_density_energy.x);
        flux_i_momentum.x += factor * (ff_flux_contribution_momentum_x.x +
                                       flux_contribution_i_momentum_x.x);
        flux_i_momentum.y += factor * (ff_flux_contribution_momentum_y.x +
                                       flux_contribution_i_momentum_y.x);
        flux_i_momentum.z += factor * (ff_flux_contribution_momentum_z.x +
                                       flux_contribution_i_momentum_z.x);

        factor = double(0.5) * normal.y;
        flux_i_density +=
            factor * (ff_variable[VAR_MOMENTUM + 1] + momentum_i.y);
        flux_i_density_energy +=
            factor * (ff_flux_contribution_density_energy.y +
                      flux_contribution_i_density_energy.y);
        flux_i_momentum.x += factor * (ff_flux_contribution_momentum_x.y +
                                       flux_contribution_i_momentum_x.y);
        flux_i_momentum.y += factor * (ff_flux_contribution_momentum_y.y +
                                       flux_contribution_i_momentum_y.y);
        flux_i_momentum.z += factor * (ff_flux_contribution_momentum_z.y +
                                       flux_contribution_i_momentum_z.y);

        factor = double(0.5) * normal.z;
        flux_i_density +=
            factor * (ff_variable[VAR_MOMENTUM + 2] + momentum_i.z);
        flux_i_density_energy +=
            factor * (ff_flux_contribution_density_energy.z +
                      flux_contribution_i_density_energy.z);
        flux_i_momentum.x += factor * (ff_flux_contribution_momentum_x.z +
                                       flux_contribution_i_momentum_x.z);
        flux_i_momentum.y += factor * (ff_flux_contribution_momentum_y.z +
                                       flux_contribution_i_momentum_y.z);
        flux_i_momentum.z += factor * (ff_flux_contribution_momentum_z.z +
                                       flux_contribution_i_momentum_z.z);
      }
    }

    fluxes[i * NVAR + VAR_DENSITY] = flux_i_density;
    fluxes[i * NVAR + (VAR_MOMENTUM + 0)] = flux_i_momentum.x;
    fluxes[i * NVAR + (VAR_MOMENTUM + 1)] = flux_i_momentum.y;
    fluxes[i * NVAR + (VAR_MOMENTUM + 2)] = flux_i_momentum.z;
    fluxes[i * NVAR + VAR_DENSITY_ENERGY] = flux_i_density_energy;
  }
#ifdef GEM_FORGE
  m5_work_end(1, 0);
#endif
}
void time_step(uint64_t j, uint64_t nelr, double *old_variables,
               double *variables, double *step_factors, double *fluxes) {
#ifdef GEM_FORGE
  m5_work_begin(2, 0);
#endif
#pragma omp parallel for firstprivate(j, nelr, old_variables, variables,       \
                                      step_factors, fluxes) default(none)      \
    schedule(static)
  for (uint64_t i = 0; i < nelr; i++) {
    double factor = step_factors[i] / double(RK + 1 - j);


    uint64_t density_idx = NVAR * i + VAR_DENSITY;
    uint64_t density_energy_idx = NVAR * i + VAR_DENSITY_ENERGY;
    uint64_t momentum_x_idx = NVAR * i + (VAR_MOMENTUM + 0);
    uint64_t momentum_y_idx = NVAR * i + (VAR_MOMENTUM + 1);
    uint64_t momentum_z_idx = NVAR * i + (VAR_MOMENTUM + 2);

    double old_density = old_variables[density_idx];
    double old_density_energy = old_variables[density_energy_idx];
    double old_momentum_x = old_variables[momentum_x_idx];
    double old_momentum_y = old_variables[momentum_y_idx];
    double old_momentum_z = old_variables[momentum_z_idx];

    double flux_density = fluxes[density_idx];
    double flux_density_energy = fluxes[density_energy_idx];
    double flux_momentum_x = fluxes[momentum_x_idx];
    double flux_momentum_y = fluxes[momentum_y_idx];
    double flux_momentum_z = fluxes[momentum_z_idx];

    variables[density_idx] = old_density + factor * flux_density;
    variables[density_energy_idx] =
        old_density_energy + factor * flux_density_energy;
    variables[momentum_x_idx] = old_momentum_x + factor * flux_momentum_x;
    variables[momentum_y_idx] = old_momentum_y + factor * flux_momentum_y;
    variables[momentum_z_idx] = old_momentum_z + factor * flux_momentum_z;
  }
#ifdef GEM_FORGE
  m5_work_end(2, 0);
#endif
}
/*
 * Main function
 */
int main(int argc, char **argv) {
  if (argc < 4) {
    std::cout << "<data file> <num of threads> <iterations>" << std::endl;
    return 0;
  }
  const char *data_file_name = argv[1];
  int num_threads = atoi(argv[2]);
  int iterations = atoi(argv[3]);

  // set far field conditions
  {
    const double angle_of_attack =
        double(3.1415926535897931 / 180.0) * double(deg_angle_of_attack);

    ff_variable[VAR_DENSITY] = double(1.4);

    double ff_pressure = double(1.0);
    double ff_speed_of_sound =
        sqrt(GAMMA * ff_pressure / ff_variable[VAR_DENSITY]);
    double ff_speed = double(ff_mach) * ff_speed_of_sound;

    double3 ff_velocity;
    ff_velocity.x = ff_speed * double(cos((double)angle_of_attack));
    ff_velocity.y = ff_speed * double(sin((double)angle_of_attack));
    ff_velocity.z = 0.0;

    ff_variable[VAR_MOMENTUM + 0] = ff_variable[VAR_DENSITY] * ff_velocity.x;
    ff_variable[VAR_MOMENTUM + 1] = ff_variable[VAR_DENSITY] * ff_velocity.y;
    ff_variable[VAR_MOMENTUM + 2] = ff_variable[VAR_DENSITY] * ff_velocity.z;

    ff_variable[VAR_DENSITY_ENERGY] =
        ff_variable[VAR_DENSITY] * (double(0.5) * (ff_speed * ff_speed)) +
        (ff_pressure / double(GAMMA - 1.0));

    double3 ff_momentum;
    ff_momentum.x = *(ff_variable + VAR_MOMENTUM + 0);
    ff_momentum.y = *(ff_variable + VAR_MOMENTUM + 1);
    ff_momentum.z = *(ff_variable + VAR_MOMENTUM + 2);
    compute_flux_contribution(
        ff_variable[VAR_DENSITY], ff_momentum, ff_variable[VAR_DENSITY_ENERGY],
        ff_pressure, ff_velocity, ff_flux_contribution_momentum_x,
        ff_flux_contribution_momentum_y, ff_flux_contribution_momentum_z,
        ff_flux_contribution_density_energy);
  }
  int nel;
  int nelr;

  // read in domain geometry
  double *areas;
  int *elements_surrounding_elements;
  double *normals;
  {

    auto infile = fopen(data_file_name, "rb");
    fread(&nel, sizeof(nel), 1, infile);
    printf("Read in nel = %d, numthreads = %d.\n", nel, num_threads);

    // Round nel up to num_threads
    nelr = num_threads * ((nel / num_threads) + std::min(1, nel % num_threads));

    areas = new double[nelr];
    elements_surrounding_elements = new int[nelr * NNB];
    normals = new double[NDIM * NNB * nelr];

    // read in data
    fread(areas, sizeof(areas[0]), nel, infile);
    fread(elements_surrounding_elements,
          sizeof(elements_surrounding_elements[0]), nel * NNB, infile);
    fread(normals, sizeof(normals[0]), NDIM * NNB * nel, infile);
    fclose(infile);

    // fill in remaining data
    int last = nel - 1;
    for (int i = nel; i < nelr; i++) {
      areas[i] = areas[last];
      for (int j = 0; j < NNB; j++) {
        // duplicate the last element
        elements_surrounding_elements[i * NNB + j] =
            elements_surrounding_elements[last * NNB + j];
        for (int k = 0; k < NDIM; k++)
          normals[(i * NNB + j) * NDIM + k] =
              normals[(last * NNB + j) * NDIM + k];
      }
    }
  }

  // Create arrays and set initial conditions
  double *variables = alloc<double>(nelr * NVAR);
  double *old_variables = alloc<double>(nelr * NVAR);
  double *fluxes = alloc<double>(nelr * NVAR);
  double *step_factors = alloc<double>(nelr);

  // Setting the number of threads.
  omp_set_dynamic(0);
  omp_set_num_threads(num_threads);
  omp_set_schedule(omp_sched_static, 0);
#ifdef GEM_FORGE
  // mallopt(M_ARENA_MAX, GEM_FORGE_MALLOC_ARENA_MAX);
#endif

  initialize_variables(nelr, variables);

  // these need to be computed the first time in order to compute time step
  std::cout << "Starting..." << std::endl;
  double start = omp_get_wtime();

#ifdef GEM_FORGE
  m5_detail_sim_start();
#endif

  // Begin iterations
  for (int i = 0; i < iterations; i++) {
    copy<double>(old_variables, variables, nelr * NVAR);

    // for the first iteration we compute the time step
    compute_step_factor(nelr, variables, areas, step_factors);

    for (int j = 0; j < RK; j++) {
      compute_flux(nelr, elements_surrounding_elements, normals, variables,
                   fluxes);
      time_step(j, nelr, old_variables, variables, step_factors, fluxes);
    }
  }

#ifdef GEM_FORGE
  m5_detail_sim_end();
  exit(0);
#endif

  double end = omp_get_wtime();
  std::cout << (end - start) / iterations << " seconds per iteration"
            << std::endl;

  std::cout << "Saving solution..." << std::endl;
  dump(variables, nel, nelr);
  std::cout << "Saved solution..." << std::endl;

  std::cout << "Cleaning up..." << std::endl;
  dealloc<double>(areas);
  dealloc<int>(elements_surrounding_elements);
  dealloc<double>(normals);

  dealloc<double>(variables);
  dealloc<double>(old_variables);
  dealloc<double>(fluxes);
  dealloc<double>(step_factors);

  std::cout << "Done..." << std::endl;

  return 0;
}
