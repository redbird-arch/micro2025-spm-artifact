#ifdef GEM_FORGE
#include "gem5/m5ops.h"
#endif

#include <malloc.h>
#include <math.h>
#include <omp.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>
#include <string.h>
#include <time.h>
#include <assert.h>

#include "immintrin.h"

typedef float Value;

#define WARM_CACHE
// #define COUNTER_TEST
#define PREFETCH_DISTANCE 2

__attribute__((noinline)) Value foo_sisd(Value *X, Value *W, Value *Y, int Nb, int Cb, int Kb, int bn, int bk, int bc, int threads) {
  printf("Executing SISD Instruction Set.\n");
  int N = Nb * bn;
  int C = Cb * bc;
  int K = Kb * bk;

  #ifdef COUNTER_TEST
    int g_y_counter = 0;
    int g_x_counter = 0;
    int g_w_counter = 0;
  #endif

  // printf("bn = %d, bk = %d, bc = %d\n", bn, bk, bc);

  # pragma omp parallel num_threads(threads)
  {
  int Nb_start;
  int Nb_size;
  int Kb_start;
  int Kb_size;
  const int tid = omp_get_thread_num();
  if (threads == 16) {
    // Nb_start = (Nb / 8) * (tid % 8);
    // Nb_size = (Nb / 8);
    // Kb_start = (Kb / 2) * (tid / 8);
    // Kb_size = (Kb / 2);
    // Nb_start = (Nb / 1) * (tid / 1);
    // Nb_size = (Nb / 1);
    Nb_start = 0;
    Nb_size = Nb;
    Kb_start = (Kb / 16) * (tid % 16);
    Kb_size = (Kb / 16);
    printf("tid = %d; Nb_start = %d; Nb_size = %d; Kb_start = %d; Kb_size = %d\n", tid, Nb_start, Nb_size, Kb_start, Kb_size);
  }
  // printf("tid = %d; Nb_start = %d; Nb_size = %d; Kb_start = %d; Kb_size = %d\n", tid, Nb_start, Nb_size, Kb_start, Kb_size);
  for (uint64_t n = Nb_start; n < Nb_start + Nb_size; ++n) { //maximum 8 threads with N of 256 and 32 of bn
    // int tid = omp_get_thread_num();

    #ifdef COUNTER_TEST
      int y_counter = 0;
      int x_counter = 0;
      int w_counter = 0;
    #endif

    for (uint64_t k = Kb_start; k < Kb_start + Kb_size; ++k) { //maximum 128 threads with K of 1024 and 8 of bn
      uint64_t y_idx_start = K * bn * n + bn * bk * k;
      Value y_value_0 = *(Y + y_idx_start);
      Value y_value_1 = *(Y + y_idx_start + 8);
      Value y_value_2 = *(Y + y_idx_start + 16);
      Value y_value_3 = *(Y + y_idx_start + 24);
      Value y_value_4 = *(Y + y_idx_start + 32);
      Value y_value_5 = *(Y + y_idx_start + 40);
      Value y_value_6 = *(Y + y_idx_start + 48);
      Value y_value_7 = *(Y + y_idx_start + 56);

      // __m128 x_value;
      // __m128 w_value[bk];
      for (uint64_t c = 0; c < Cb; ++c) {
        uint64_t x_idx_start = C * bn * n + bn * bc * c;
        uint64_t w_idx_start = K * bc * c + bk * bc * k;
        Value x_value_0_0;
        Value x_value_0_1;
        Value x_value_0_2;
        Value x_value_0_3;
        Value x_value_0_4;
        Value x_value_0_5;
        Value x_value_0_6;
        Value x_value_0_7;
        Value x_value_1_0;
        Value x_value_1_1;
        Value x_value_1_2;
        Value x_value_1_3;
        Value x_value_1_4;
        Value x_value_1_5;
        Value x_value_1_6;
        Value x_value_1_7;
        Value w_value_0;
        Value w_value_1;

        w_value_0 = *(W + w_idx_start);
        w_value_1 = *(W + w_idx_start + 8);

        x_value_0_0 = *(X + x_idx_start);
        y_value_0 += x_value_0_0 * w_value_0;
        x_value_0_1 = *(X + x_idx_start + 8);
        y_value_1 += x_value_0_1 * w_value_0;
        x_value_0_2 = *(X + x_idx_start + 16);
        y_value_2 += x_value_0_2 * w_value_0;
        x_value_0_3 = *(X + x_idx_start + 24);
        y_value_3 += x_value_0_3 * w_value_0;
        x_value_0_4 = *(X + x_idx_start + 32);
        y_value_4 += x_value_0_4 * w_value_0;
        x_value_0_5 = *(X + x_idx_start + 40);
        y_value_5 += x_value_0_5 * w_value_0;
        x_value_0_6 = *(X + x_idx_start + 48);
        y_value_6 += x_value_0_6 * w_value_0;
        x_value_0_7 = *(X + x_idx_start + 56);
        y_value_7 += x_value_0_7 * w_value_0;

        w_value_0 = *(W + w_idx_start + 16);

        x_value_1_0 = *(X + x_idx_start + 1);
        y_value_0 += x_value_1_0 * w_value_1;
        x_value_1_1 = *(X + x_idx_start + 9);
        y_value_1 += x_value_1_1 * w_value_1;
        x_value_1_2 = *(X + x_idx_start + 17);
        y_value_2 += x_value_1_2 * w_value_1;
        x_value_1_3 = *(X + x_idx_start + 25);
        y_value_3 += x_value_1_3 * w_value_1;
        x_value_1_4 = *(X + x_idx_start + 33);
        y_value_4 += x_value_1_4 * w_value_1;
        x_value_1_5 = *(X + x_idx_start + 41);
        y_value_5 += x_value_1_5 * w_value_1;
        x_value_1_6 = *(X + x_idx_start + 49);
        y_value_6 += x_value_1_6 * w_value_1;
        x_value_1_7 = *(X + x_idx_start + 57);
        y_value_7 += x_value_1_7 * w_value_1;

        w_value_1 = *(W + w_idx_start + 24);

        x_value_0_0 = *(X + x_idx_start + 2);
        y_value_0 += x_value_0_0 * w_value_0;
        x_value_0_1 = *(X + x_idx_start + 10);
        y_value_1 += x_value_0_1 * w_value_0;
        x_value_0_2 = *(X + x_idx_start + 18);
        y_value_2 += x_value_0_2 * w_value_0;
        x_value_0_3 = *(X + x_idx_start + 26);
        y_value_3 += x_value_0_3 * w_value_0;
        x_value_0_4 = *(X + x_idx_start + 34);
        y_value_4 += x_value_0_4 * w_value_0;
        x_value_0_5 = *(X + x_idx_start + 42);
        y_value_5 += x_value_0_5 * w_value_0;
        x_value_0_6 = *(X + x_idx_start + 50);
        y_value_6 += x_value_0_6 * w_value_0;
        x_value_0_7 = *(X + x_idx_start + 58);
        y_value_7 += x_value_0_7 * w_value_0;

        w_value_0 = *(W + w_idx_start + 32);

        x_value_1_0 = *(X + x_idx_start + 3);
        y_value_0 += x_value_1_0 * w_value_1;
        x_value_1_1 = *(X + x_idx_start + 11);
        y_value_1 += x_value_1_1 * w_value_1;
        x_value_1_2 = *(X + x_idx_start + 19);
        y_value_2 += x_value_1_2 * w_value_1;
        x_value_1_3 = *(X + x_idx_start + 27);
        y_value_3 += x_value_1_3 * w_value_1;
        x_value_1_4 = *(X + x_idx_start + 35);
        y_value_4 += x_value_1_4 * w_value_1;
        x_value_1_5 = *(X + x_idx_start + 43);
        y_value_5 += x_value_1_5 * w_value_1;
        x_value_1_6 = *(X + x_idx_start + 51);
        y_value_6 += x_value_1_6 * w_value_1;
        x_value_1_7 = *(X + x_idx_start + 59);
        y_value_7 += x_value_1_7 * w_value_1;

        w_value_1 = *(W + w_idx_start + 40);

        x_value_0_0 = *(X + x_idx_start + 4);
        y_value_0 += x_value_0_0 * w_value_0;
        x_value_0_1 = *(X + x_idx_start + 12);
        y_value_1 += x_value_0_1 * w_value_0;
        x_value_0_2 = *(X + x_idx_start + 20);
        y_value_2 += x_value_0_2 * w_value_0;
        x_value_0_3 = *(X + x_idx_start + 28);
        y_value_3 += x_value_0_3 * w_value_0;
        x_value_0_4 = *(X + x_idx_start + 36);
        y_value_4 += x_value_0_4 * w_value_0;
        x_value_0_5 = *(X + x_idx_start + 44);
        y_value_5 += x_value_0_5 * w_value_0;
        x_value_0_6 = *(X + x_idx_start + 52);
        y_value_6 += x_value_0_6 * w_value_0;
        x_value_0_7 = *(X + x_idx_start + 60);
        y_value_7 += x_value_0_7 * w_value_0;

        w_value_0 = *(W + w_idx_start + 48);

        x_value_1_0 = *(X + x_idx_start + 5);
        y_value_0 += x_value_1_0 * w_value_1;
        x_value_1_1 = *(X + x_idx_start + 13);
        y_value_1 += x_value_1_1 * w_value_1;
        x_value_1_2 = *(X + x_idx_start + 21);
        y_value_2 += x_value_1_2 * w_value_1;
        x_value_1_3 = *(X + x_idx_start + 29);
        y_value_3 += x_value_1_3 * w_value_1;
        x_value_1_4 = *(X + x_idx_start + 37);
        y_value_4 += x_value_1_4 * w_value_1;
        x_value_1_5 = *(X + x_idx_start + 45);
        y_value_5 += x_value_1_5 * w_value_1;
        x_value_1_6 = *(X + x_idx_start + 53);
        y_value_6 += x_value_1_6 * w_value_1;
        x_value_1_7 = *(X + x_idx_start + 61);
        y_value_7 += x_value_1_7 * w_value_1;

        w_value_1 = *(W + w_idx_start + 56);

        x_value_0_0 = *(X + x_idx_start + 6);
        y_value_0 += x_value_0_0 * w_value_0;
        x_value_0_1 = *(X + x_idx_start + 14);
        y_value_1 += x_value_0_1 * w_value_0;
        x_value_0_2 = *(X + x_idx_start + 22);
        y_value_2 += x_value_0_2 * w_value_0;
        x_value_0_3 = *(X + x_idx_start + 30);
        y_value_3 += x_value_0_3 * w_value_0;
        x_value_0_4 = *(X + x_idx_start + 38);
        y_value_4 += x_value_0_4 * w_value_0;
        x_value_0_5 = *(X + x_idx_start + 46);
        y_value_5 += x_value_0_5 * w_value_0;
        x_value_0_6 = *(X + x_idx_start + 54);
        y_value_6 += x_value_0_6 * w_value_0;
        x_value_0_7 = *(X + x_idx_start + 62);
        y_value_7 += x_value_0_7 * w_value_0;

        x_value_1_0 = *(X + x_idx_start + 7);
        y_value_0 += x_value_1_0 * w_value_1;
        x_value_1_1 = *(X + x_idx_start + 15);
        y_value_1 += x_value_1_1 * w_value_1;
        x_value_1_2 = *(X + x_idx_start + 23);
        y_value_2 += x_value_1_2 * w_value_1;
        x_value_1_3 = *(X + x_idx_start + 31);
        y_value_3 += x_value_1_3 * w_value_1;
        x_value_1_4 = *(X + x_idx_start + 39);
        y_value_4 += x_value_1_4 * w_value_1;
        x_value_1_5 = *(X + x_idx_start + 47);
        y_value_5 += x_value_1_5 * w_value_1;
        x_value_1_6 = *(X + x_idx_start + 55);
        y_value_6 += x_value_1_6 * w_value_1;
        x_value_1_7 = *(X + x_idx_start + 63);
        y_value_7 += x_value_1_7 * w_value_1;
      }
      // printf("y_value_0 = %d\n", y_value_0);
      *(Y + y_idx_start     ) =  y_value_0;
      *(Y + y_idx_start + 8 ) =  y_value_1;
      *(Y + y_idx_start + 16) =  y_value_2;
      *(Y + y_idx_start + 24) =  y_value_3;
      *(Y + y_idx_start + 32) =  y_value_4;
      *(Y + y_idx_start + 40) =  y_value_5;
      *(Y + y_idx_start + 48) =  y_value_6;
      *(Y + y_idx_start + 56) =  y_value_7;
    }
    #ifdef COUNTER_TEST
      printf("tid = %d; y loads = %d; x loads = %d; w loads = %d\n", tid, y_counter * 4, w_counter, x_counter * 4);
    #endif

  }
  // printf("Finish foo\n");

  #ifdef COUNTER_TEST
    printf("y loads = %d; x loads = %d; w loads = %d\n", g_y_counter * 4, g_w_counter, g_x_counter * 4);
  #endif

  // printf("Nb = %d; Kb = %d; Cb = %d\n", Nb, Kb, Cb);
  }
  return 0.0f;
}

__attribute__((noinline)) Value foo_128(Value *X, Value *W, Value *Y, int Nb, int Cb, int Kb, int bn, int bk, int bc, int threads) {
  printf("Executing SSE Instruction Set.\n");
  int N = Nb * bn;
  int C = Cb * bc;
  int K = Kb * bk;

  #ifdef COUNTER_TEST
    int g_y_counter = 0;
    int g_x_counter = 0;
    int g_w_counter = 0;
  #endif

  // printf("bn = %d, bk = %d, bc = %d\n", bn, bk, bc);

  # pragma omp parallel num_threads(threads)
  {
  int Nb_start;
  int Nb_size;
  int Kb_start;
  int Kb_size;
  const int tid = omp_get_thread_num();
  // if (threads == 16) {
    Nb_start = 0;
    Nb_size = Nb;
    Kb_start = (Kb / threads) * (tid % threads);
    Kb_size = (Kb / threads);
    // Nb_start = (Nb / 2) * (tid / 8);
    // Nb_size = (Nb / 2);
    // Kb_start = (Kb / 8) * (tid % 8);
    // Kb_size = (Kb / 8);
    printf("tid = %d; Nb_start = %d; Nb_size = %d; Kb_start = %d; Kb_size = %d\n", tid, Nb_start, Nb_size, Kb_start, Kb_size);
  // }
  __m128 y_value_0;
  __m128 y_value_1;
  __m128 y_value_2;
  __m128 y_value_3;
  __m128 y_value_4;
  __m128 y_value_5;

  __m128 x_value_0;
  __m128 x_value_1;
  __m128 x_value_2;
  __m128 w_value;
  // for (uint64_t n = Nb_start; n < Nb_start + Nb_size; ++n) { //maximum 8 threads with N of 256 and 32 of bn
  for (uint64_t k = Kb_start; k < Kb_start + Kb_size; ++k) { //maximum 128 threads with K of 1024 and 8 of bn
    #pragma omp barrier // used for PushMulticast Barrier
    #ifdef COUNTER_TEST
      int y_counter = 0;
      int x_counter = 0;
      int w_counter = 0;
    #endif

    // for (uint64_t k = Kb_start; k < Kb_start + Kb_size; ++k) { //maximum 128 threads with K of 1024 and 8 of bn
    for (uint64_t n = Nb_start; n < Nb_start + Nb_size; ++n) { //maximum 8 threads with N of 256 and 32 of bn
      for (uint64_t c = 0; c < Cb; ++c) {

        // prefetch begin
          uint64_t cur_x_idx = C * bn * n + bn * bc * c;
          uint64_t next_x_idx = cur_x_idx + (64 * PREFETCH_DISTANCE);

          if ((next_x_idx + 64) < (N * C)) {
            // next 8 * 8 block of input
            _mm_prefetch(X + next_x_idx +  0, _MM_HINT_T0);
            _mm_prefetch(X + next_x_idx + 16, _MM_HINT_T0);
            _mm_prefetch(X + next_x_idx + 32, _MM_HINT_T0);
            _mm_prefetch(X + next_x_idx + 48, _MM_HINT_T0);
          }
        // prefetch end

        // #pragma clang loop unroll(disable) interleave(disable)
        for (uint64_t i = 0; i < 2; ++i) {
          uint64_t y_idx_start = K * bn * n + bn * bk * k + i * 24; // 24 values per 3 * 8 block

          y_value_0 = _mm_load_ps(Y + y_idx_start     );
          y_value_1 = _mm_load_ps(Y + y_idx_start + 4 );
          y_value_2 = _mm_load_ps(Y + y_idx_start + 8 );
          y_value_3 = _mm_load_ps(Y + y_idx_start + 12);
          y_value_4 = _mm_load_ps(Y + y_idx_start + 16);
          y_value_5 = _mm_load_ps(Y + y_idx_start + 20);

          // #pragma clang loop unroll(disable) interleave(disable)
          for (uint64_t n_c = 0; n_c < 8; ++n_c) {
            uint64_t x_idx_start = C * bn * n + bn * bc * c + i * 24 + n_c; // Turn to next column
            uint64_t w_idx_start = K * bc * c + bk * bc * k + n_c * 8; // 8 values per row in input

            x_value_0 = _mm_load_ps1(X + x_idx_start     );
            x_value_1 = _mm_load_ps1(X + x_idx_start + 8 );
            x_value_2 = _mm_load_ps1(X + x_idx_start + 16);

            w_value = _mm_load_ps(W + w_idx_start);
            w_value = _mm_mul_ps(w_value, x_value_0);
            y_value_0 = _mm_add_ps(w_value, y_value_0);

            w_value = _mm_load_ps(W + w_idx_start);
            w_value = _mm_mul_ps(w_value, x_value_1);
            y_value_2 = _mm_add_ps(w_value, y_value_2);

            w_value = _mm_load_ps(W + w_idx_start);
            w_value = _mm_mul_ps(w_value, x_value_2);
            y_value_4 = _mm_add_ps(w_value, y_value_4);

            w_value = _mm_load_ps(W + w_idx_start + 4);
            
            x_value_0 = _mm_mul_ps(w_value, x_value_0);
            y_value_1 = _mm_add_ps(x_value_0, y_value_1);
            
            x_value_1 = _mm_mul_ps(w_value, x_value_1);
            y_value_3 = _mm_add_ps(x_value_1, y_value_3);

            x_value_2 = _mm_mul_ps(w_value, x_value_2);
            y_value_5 = _mm_add_ps(x_value_2, y_value_5);
          }
          _mm_store_ps(Y + y_idx_start     ,  y_value_0);
          _mm_store_ps(Y + y_idx_start + 4 ,  y_value_1);
          _mm_store_ps(Y + y_idx_start + 8 ,  y_value_2);
          _mm_store_ps(Y + y_idx_start + 12,  y_value_3);
          _mm_store_ps(Y + y_idx_start + 16,  y_value_4);
          _mm_store_ps(Y + y_idx_start + 20,  y_value_5);
        }
        uint64_t y_idx_start = K * bn * n + bn * bk * k + 48; // 24 values per 3 * 8 block, 48 values are finished

        y_value_0 = _mm_load_ps(Y + y_idx_start     );
        y_value_1 = _mm_load_ps(Y + y_idx_start + 4 );
        y_value_2 = _mm_load_ps(Y + y_idx_start + 8 );
        y_value_3 = _mm_load_ps(Y + y_idx_start + 12);
        for (uint64_t n_c = 0; n_c < 8; ++n_c) {
          uint64_t x_idx_start = C * bn * n + bn * bc * c + 48 + n_c; // 48 values are finished, turn to next column
          uint64_t w_idx_start = K * bc * c + bk * bc * k + n_c * 8; // 8 values per row in input

          x_value_0 = _mm_load_ps1(X + x_idx_start     );
          x_value_1 = _mm_load_ps1(X + x_idx_start + 8 );

          w_value = _mm_load_ps(W + w_idx_start);
          w_value = _mm_mul_ps(w_value, x_value_0);
          y_value_0 = _mm_add_ps(w_value, y_value_0);

          w_value = _mm_load_ps(W + w_idx_start);
          w_value = _mm_mul_ps(w_value, x_value_1);
          y_value_2 = _mm_add_ps(w_value, y_value_2);

          w_value = _mm_load_ps(W + w_idx_start + 4);
          
          x_value_0 = _mm_mul_ps(w_value, x_value_0);
          y_value_1 = _mm_add_ps(x_value_0, y_value_1);
          
          x_value_1 = _mm_mul_ps(w_value, x_value_1);
          y_value_3 = _mm_add_ps(x_value_1, y_value_3);
        }
        _mm_store_ps(Y + y_idx_start     ,  y_value_0);
        _mm_store_ps(Y + y_idx_start + 4 ,  y_value_1);
        _mm_store_ps(Y + y_idx_start + 8 ,  y_value_2);
        _mm_store_ps(Y + y_idx_start + 12,  y_value_3);
      }
    }
    #ifdef COUNTER_TEST
      printf("tid = %d; y loads = %d; x loads = %d; w loads = %d\n", tid, y_counter * 4, w_counter, x_counter * 4);
    #endif

  }

  #ifdef COUNTER_TEST
    printf("y loads = %d; x loads = %d; w loads = %d\n", g_y_counter * 4, g_w_counter, g_x_counter * 4);
  #endif
  }
  return 0.0f;
}

__attribute__((noinline)) Value foo_256(Value *X, Value *W, Value *Y, int Nb, int Cb, int Kb, int bn, int bk, int bc, int threads) {
  // printf("Executing AVX256 Instruction Set.\n");
  // // printf("Nb = %d; Kb = %d\n", Nb, Kb);
  // int N = Nb * bn;
  // int C = Cb * bc;
  // int K = Kb * bk;

  // // int Nb_start;
  // // int Nb_size;
  // // int Kb_start;
  // // int Kb_size;

  // #ifdef COUNTER_TEST
  //   int g_y_counter = 0;
  //   int g_x_counter = 0;
  //   int g_w_counter = 0;
  // #endif

  // // printf("1\n");
  // // __m256
  // # pragma omp parallel num_threads(threads)
  // {
  //   int Nb_start;
  //   int Nb_size;
  //   int Kb_start;
  //   int Kb_size;
  //   const int tid = omp_get_thread_num();
  // // printf("threads = %d\n", threads);
  // if (threads == 16) {
  //   Nb_start = 0;
  //   Nb_size = Nb;
  //   Kb_start = (Kb / 16) * (tid % 16);
  //   Kb_size = (Kb / 16);
  // }
  //   printf("tid = %d; Nb_start = %d; Nb_size = %d; Kb_start = %d; Kb_size = %d\n", tid, Nb_start, Nb_size, Kb_start, Kb_size);
  // for (uint64_t n = Nb_start; n < Nb_start + Nb_size; ++n) { //maximum 8 threads with N of 256 and 32 of bn
  //   // int tid = omp_get_thread_num();

  //   #ifdef COUNTER_TEST
  //     int y_counter = 0;
  //     int x_counter = 0;
  //     int w_counter = 0;
  //   #endif

  //   for (uint64_t k = Kb_start; k < Kb_start + Kb_size; ++k) { //maximum 128 threads with K of 1024 and 8 of bn
  // // for (uint64_t k = 0; k < Kb; ++k) { //maximum 128 threads with K of 1024 and 8 of bn
  // //   for (uint64_t n = 0; n < Nb; ++n) { //maximum 8 threads with N of 256 and 32 of bn
  //     uint64_t y_idx_start = K * bn * n + bn * bk * k;
  //     printf("start _mm256_load_ps\n");
  //     __m256 y_value_0 = _mm256_load_ps(Y + y_idx_start);
  //     __m256 y_value_1 = _mm256_load_ps(Y + y_idx_start + 8);
  //     __m256 y_value_2 = _mm256_load_ps(Y + y_idx_start + 16);
  //     __m256 y_value_3 = _mm256_load_ps(Y + y_idx_start + 24);
  //     __m256 y_value_4 = _mm256_load_ps(Y + y_idx_start + 32);
  //     __m256 y_value_5 = _mm256_load_ps(Y + y_idx_start + 40);
  //     __m256 y_value_6 = _mm256_load_ps(Y + y_idx_start + 48);
  //     __m256 y_value_7 = _mm256_load_ps(Y + y_idx_start + 56);
  //     printf("end _mm256_load_ps\n");

  //     __m256 y_value_0_temp;
  //     __m256 y_value_1_temp;
  //     __m256 y_value_2_temp;
  //     __m256 y_value_3_temp;
  //     __m256 y_value_4_temp;
  //     __m256 y_value_5_temp;
  //     __m256 y_value_6_temp;
  //     __m256 y_value_7_temp;

  //     // __m256 x_value;
  //     // __m256 w_value[bk];
  //     for (uint64_t c = 0; c < Cb; ++c) {
  //       uint64_t x_idx_start = C * bn * n + bn * bc * c;
  //       uint64_t w_idx_start = K * bc * c + bk * bc * k;
  //       __m256 x_value_0_0;
  //       __m256 x_value_0_1;
  //       __m256 x_value_0_2;
  //       __m256 x_value_0_3;
  //       __m256 x_value_0_4;
  //       __m256 x_value_0_5;
  //       __m256 x_value_0_6;
  //       __m256 x_value_0_7;
  //       __m256 x_value_1_0;
  //       __m256 x_value_1_1;
  //       __m256 x_value_1_2;
  //       __m256 x_value_1_3;
  //       __m256 x_value_1_4;
  //       __m256 x_value_1_5;
  //       __m256 x_value_1_6;
  //       __m256 x_value_1_7;
  //       __m256 w_value_0;
  //       __m256 w_value_1;

  //       w_value_0 = _mm256_load_ps(W + w_idx_start);
  //       w_value_1 = _mm256_load_ps(W + w_idx_start + 8);

  //       printf("Execute set1 ps\n");
  //       x_value_0_0 = _mm256_set1_ps(*(X + x_idx_start));
  //       printf("Finish set1 ps\n");
  //       y_value_0_temp = _mm256_mul_ps(x_value_0_0, w_value_0);
  //       y_value_0 = _mm256_add_ps(y_value_0_temp, y_value_0);
  //       x_value_0_1 = _mm256_set1_ps(*(X + x_idx_start +8));
  //       y_value_1_temp = _mm256_mul_ps(x_value_0_1, w_value_0); y_value_1 = _mm256_add_ps(y_value_1_temp, y_value_1);
  //       x_value_0_2 = _mm256_set1_ps(*(X + x_idx_start +16));
  //       y_value_2_temp = _mm256_mul_ps(x_value_0_2, w_value_0); y_value_2 = _mm256_add_ps(y_value_2_temp, y_value_2);
  //       x_value_0_3 = _mm256_set1_ps(*(X + x_idx_start +24));
  //       y_value_3_temp = _mm256_mul_ps(x_value_0_3, w_value_0); y_value_3 = _mm256_add_ps(y_value_3_temp, y_value_3);
  //       x_value_0_4 = _mm256_set1_ps(*(X + x_idx_start +32));
  //       y_value_4_temp = _mm256_mul_ps(x_value_0_4, w_value_0); y_value_4 = _mm256_add_ps(y_value_4_temp, y_value_4);
  //       x_value_0_5 = _mm256_set1_ps(*(X + x_idx_start +40));
  //       y_value_5_temp = _mm256_mul_ps(x_value_0_5, w_value_0); y_value_5 = _mm256_add_ps(y_value_5_temp, y_value_5);
  //       x_value_0_6 = _mm256_set1_ps(*(X + x_idx_start +48));
  //       y_value_6_temp = _mm256_mul_ps(x_value_0_6, w_value_0); y_value_6 = _mm256_add_ps(y_value_6_temp, y_value_6);
  //       x_value_0_7 = _mm256_set1_ps(*(X + x_idx_start +56));
  //       y_value_7_temp = _mm256_mul_ps(x_value_0_7, w_value_0); y_value_7 = _mm256_add_ps(y_value_7_temp, y_value_7);

  //       w_value_0 = _mm256_load_ps(W + w_idx_start + 16);

  //       x_value_1_0 = _mm256_set1_ps(*(X + x_idx_start +1));
  //       y_value_0_temp = _mm256_mul_ps(x_value_1_0, w_value_1); y_value_0 = _mm256_add_ps(y_value_0_temp, y_value_0);
  //       x_value_1_1 = _mm256_set1_ps(*(X + x_idx_start +9));
  //       y_value_1_temp = _mm256_mul_ps(x_value_1_1, w_value_1); y_value_1 = _mm256_add_ps(y_value_1_temp, y_value_1);
  //       x_value_1_2 = _mm256_set1_ps(*(X + x_idx_start +17));
  //       y_value_2_temp = _mm256_mul_ps(x_value_1_2, w_value_1); y_value_2 = _mm256_add_ps(y_value_2_temp, y_value_2);
  //       x_value_1_3 = _mm256_set1_ps(*(X + x_idx_start +25));
  //       y_value_3_temp = _mm256_mul_ps(x_value_1_3, w_value_1); y_value_3 = _mm256_add_ps(y_value_3_temp, y_value_3);
  //       x_value_1_4 = _mm256_set1_ps(*(X + x_idx_start +33));
  //       y_value_4_temp = _mm256_mul_ps(x_value_1_4, w_value_1); y_value_4 = _mm256_add_ps(y_value_4_temp, y_value_4);
  //       x_value_1_5 = _mm256_set1_ps(*(X + x_idx_start +41));
  //       y_value_5_temp = _mm256_mul_ps(x_value_1_5, w_value_1); y_value_5 = _mm256_add_ps(y_value_5_temp, y_value_5);
  //       x_value_1_6 = _mm256_set1_ps(*(X + x_idx_start +49));
  //       y_value_6_temp = _mm256_mul_ps(x_value_1_6, w_value_1); y_value_6 = _mm256_add_ps(y_value_6_temp, y_value_6);
  //       x_value_1_7 = _mm256_set1_ps(*(X + x_idx_start +57));
  //       y_value_7_temp = _mm256_mul_ps(x_value_1_7, w_value_1); y_value_7 = _mm256_add_ps(y_value_7_temp, y_value_7);

  //       w_value_1 = _mm256_load_ps(W + w_idx_start + 24);

  //       x_value_0_0 = _mm256_set1_ps(*(X + x_idx_start +2));
  //       y_value_0_temp = _mm256_mul_ps(x_value_0_0, w_value_0); y_value_0 = _mm256_add_ps(y_value_0_temp, y_value_0);
  //       x_value_0_1 = _mm256_set1_ps(*(X + x_idx_start +10));
  //       y_value_1_temp = _mm256_mul_ps(x_value_0_1, w_value_0); y_value_1 = _mm256_add_ps(y_value_1_temp, y_value_1);
  //       x_value_0_2 = _mm256_set1_ps(*(X + x_idx_start +18));
  //       y_value_2_temp = _mm256_mul_ps(x_value_0_2, w_value_0); y_value_2 = _mm256_add_ps(y_value_2_temp, y_value_2);
  //       x_value_0_3 = _mm256_set1_ps(*(X + x_idx_start +26));
  //       y_value_3_temp = _mm256_mul_ps(x_value_0_3, w_value_0); y_value_3 = _mm256_add_ps(y_value_3_temp, y_value_3);
  //       x_value_0_4 = _mm256_set1_ps(*(X + x_idx_start +34));
  //       y_value_4_temp = _mm256_mul_ps(x_value_0_4, w_value_0); y_value_4 = _mm256_add_ps(y_value_4_temp, y_value_4);
  //       x_value_0_5 = _mm256_set1_ps(*(X + x_idx_start +42));
  //       y_value_5_temp = _mm256_mul_ps(x_value_0_5, w_value_0); y_value_5 = _mm256_add_ps(y_value_5_temp, y_value_5);
  //       x_value_0_6 = _mm256_set1_ps(*(X + x_idx_start +50));
  //       y_value_6_temp = _mm256_mul_ps(x_value_0_6, w_value_0); y_value_6 = _mm256_add_ps(y_value_6_temp, y_value_6);
  //       x_value_0_7 = _mm256_set1_ps(*(X + x_idx_start +58));
  //       y_value_7_temp = _mm256_mul_ps(x_value_0_7, w_value_0); y_value_7 = _mm256_add_ps(y_value_7_temp, y_value_7);

  //       w_value_0 = _mm256_load_ps(W + w_idx_start + 32);

  //       x_value_1_0 = _mm256_set1_ps(*(X + x_idx_start +3));
  //       y_value_0_temp = _mm256_mul_ps(x_value_1_0, w_value_1); y_value_0 = _mm256_add_ps(y_value_0_temp, y_value_0);
  //       x_value_1_1 = _mm256_set1_ps(*(X + x_idx_start +11));
  //       y_value_1_temp = _mm256_mul_ps(x_value_1_1, w_value_1); y_value_1 = _mm256_add_ps(y_value_1_temp, y_value_1);
  //       x_value_1_2 = _mm256_set1_ps(*(X + x_idx_start +19));
  //       y_value_2_temp = _mm256_mul_ps(x_value_1_2, w_value_1); y_value_2 = _mm256_add_ps(y_value_2_temp, y_value_2);
  //       x_value_1_3 = _mm256_set1_ps(*(X + x_idx_start +27));
  //       y_value_3_temp = _mm256_mul_ps(x_value_1_3, w_value_1); y_value_3 = _mm256_add_ps(y_value_3_temp, y_value_3);
  //       x_value_1_4 = _mm256_set1_ps(*(X + x_idx_start +35));
  //       y_value_4_temp = _mm256_mul_ps(x_value_1_4, w_value_1); y_value_4 = _mm256_add_ps(y_value_4_temp, y_value_4);
  //       x_value_1_5 = _mm256_set1_ps(*(X + x_idx_start +43));
  //       y_value_5_temp = _mm256_mul_ps(x_value_1_5, w_value_1); y_value_5 = _mm256_add_ps(y_value_5_temp, y_value_5);
  //       x_value_1_6 = _mm256_set1_ps(*(X + x_idx_start +51));
  //       y_value_6_temp = _mm256_mul_ps(x_value_1_6, w_value_1); y_value_6 = _mm256_add_ps(y_value_6_temp, y_value_6);
  //       x_value_1_7 = _mm256_set1_ps(*(X + x_idx_start +59));
  //       y_value_7_temp = _mm256_mul_ps(x_value_1_7, w_value_1); y_value_7 = _mm256_add_ps(y_value_7_temp, y_value_7);

  //       w_value_1 = _mm256_load_ps(W + w_idx_start + 40);

  //       x_value_0_0 = _mm256_set1_ps(*(X + x_idx_start +4));
  //       y_value_0_temp = _mm256_mul_ps(x_value_0_0, w_value_0); y_value_0 = _mm256_add_ps(y_value_0_temp, y_value_0);
  //       x_value_0_1 = _mm256_set1_ps(*(X + x_idx_start +12));
  //       y_value_1_temp = _mm256_mul_ps(x_value_0_1, w_value_0); y_value_1 = _mm256_add_ps(y_value_1_temp, y_value_1);
  //       x_value_0_2 = _mm256_set1_ps(*(X + x_idx_start +20));
  //       y_value_2_temp = _mm256_mul_ps(x_value_0_2, w_value_0); y_value_2 = _mm256_add_ps(y_value_2_temp, y_value_2);
  //       x_value_0_3 = _mm256_set1_ps(*(X + x_idx_start +28));
  //       y_value_3_temp = _mm256_mul_ps(x_value_0_3, w_value_0); y_value_3 = _mm256_add_ps(y_value_3_temp, y_value_3);
  //       x_value_0_4 = _mm256_set1_ps(*(X + x_idx_start +36));
  //       y_value_4_temp = _mm256_mul_ps(x_value_0_4, w_value_0); y_value_4 = _mm256_add_ps(y_value_4_temp, y_value_4);
  //       x_value_0_5 = _mm256_set1_ps(*(X + x_idx_start +44));
  //       y_value_5_temp = _mm256_mul_ps(x_value_0_5, w_value_0); y_value_5 = _mm256_add_ps(y_value_5_temp, y_value_5);
  //       x_value_0_6 = _mm256_set1_ps(*(X + x_idx_start +52));
  //       y_value_6_temp = _mm256_mul_ps(x_value_0_6, w_value_0); y_value_6 = _mm256_add_ps(y_value_6_temp, y_value_6);
  //       x_value_0_7 = _mm256_set1_ps(*(X + x_idx_start +60));
  //       y_value_7_temp = _mm256_mul_ps(x_value_0_7, w_value_0); y_value_7 = _mm256_add_ps(y_value_7_temp, y_value_7);

  //       w_value_0 = _mm256_load_ps(W + w_idx_start + 48);

  //       x_value_1_0 = _mm256_set1_ps(*(X + x_idx_start +5));
  //       y_value_0_temp = _mm256_mul_ps(x_value_1_0, w_value_1); y_value_0 = _mm256_add_ps(y_value_0_temp, y_value_0);
  //       x_value_1_1 = _mm256_set1_ps(*(X + x_idx_start +13));
  //       y_value_1_temp = _mm256_mul_ps(x_value_1_1, w_value_1); y_value_1 = _mm256_add_ps(y_value_1_temp, y_value_1);
  //       x_value_1_2 = _mm256_set1_ps(*(X + x_idx_start +21));
  //       y_value_2_temp = _mm256_mul_ps(x_value_1_2, w_value_1); y_value_2 = _mm256_add_ps(y_value_2_temp, y_value_2);
  //       x_value_1_3 = _mm256_set1_ps(*(X + x_idx_start +29));
  //       y_value_3_temp = _mm256_mul_ps(x_value_1_3, w_value_1); y_value_3 = _mm256_add_ps(y_value_3_temp, y_value_3);
  //       x_value_1_4 = _mm256_set1_ps(*(X + x_idx_start +37));
  //       y_value_4_temp = _mm256_mul_ps(x_value_1_4, w_value_1); y_value_4 = _mm256_add_ps(y_value_4_temp, y_value_4);
  //       x_value_1_5 = _mm256_set1_ps(*(X + x_idx_start +45));
  //       y_value_5_temp = _mm256_mul_ps(x_value_1_5, w_value_1); y_value_5 = _mm256_add_ps(y_value_5_temp, y_value_5);
  //       x_value_1_6 = _mm256_set1_ps(*(X + x_idx_start +53));
  //       y_value_6_temp = _mm256_mul_ps(x_value_1_6, w_value_1); y_value_6 = _mm256_add_ps(y_value_6_temp, y_value_6);
  //       x_value_1_7 = _mm256_set1_ps(*(X + x_idx_start +61));
  //       y_value_7_temp = _mm256_mul_ps(x_value_1_7, w_value_1); y_value_7 = _mm256_add_ps(y_value_7_temp, y_value_7);

  //       w_value_1 = _mm256_load_ps(W + w_idx_start + 56);

  //       x_value_0_0 = _mm256_set1_ps(*(X + x_idx_start +6));
  //       y_value_0_temp = _mm256_mul_ps(x_value_0_0, w_value_0); y_value_0 = _mm256_add_ps(y_value_0_temp, y_value_0);
  //       x_value_0_1 = _mm256_set1_ps(*(X + x_idx_start +14));
  //       y_value_1_temp = _mm256_mul_ps(x_value_0_1, w_value_0); y_value_1 = _mm256_add_ps(y_value_1_temp, y_value_1);
  //       x_value_0_2 = _mm256_set1_ps(*(X + x_idx_start +22));
  //       y_value_2_temp = _mm256_mul_ps(x_value_0_2, w_value_0); y_value_2 = _mm256_add_ps(y_value_2_temp, y_value_2);
  //       x_value_0_3 = _mm256_set1_ps(*(X + x_idx_start +30));
  //       y_value_3_temp = _mm256_mul_ps(x_value_0_3, w_value_0); y_value_3 = _mm256_add_ps(y_value_3_temp, y_value_3);
  //       x_value_0_4 = _mm256_set1_ps(*(X + x_idx_start +38));
  //       y_value_4_temp = _mm256_mul_ps(x_value_0_4, w_value_0); y_value_4 = _mm256_add_ps(y_value_4_temp, y_value_4);
  //       x_value_0_5 = _mm256_set1_ps(*(X + x_idx_start +46));
  //       y_value_5_temp = _mm256_mul_ps(x_value_0_5, w_value_0); y_value_5 = _mm256_add_ps(y_value_5_temp, y_value_5);
  //       x_value_0_6 = _mm256_set1_ps(*(X + x_idx_start +54));
  //       y_value_6_temp = _mm256_mul_ps(x_value_0_6, w_value_0); y_value_6 = _mm256_add_ps(y_value_6_temp, y_value_6);
  //       x_value_0_7 = _mm256_set1_ps(*(X + x_idx_start +62));
  //       y_value_7_temp = _mm256_mul_ps(x_value_0_7, w_value_0); y_value_7 = _mm256_add_ps(y_value_7_temp, y_value_7);

  //       x_value_1_0 = _mm256_set1_ps(*(X + x_idx_start +7));
  //       y_value_0_temp = _mm256_mul_ps(x_value_1_0, w_value_1); y_value_0 = _mm256_add_ps(y_value_0_temp, y_value_0);
  //       x_value_1_1 = _mm256_set1_ps(*(X + x_idx_start +15));
  //       y_value_1_temp = _mm256_mul_ps(x_value_1_1, w_value_1); y_value_1 = _mm256_add_ps(y_value_1_temp, y_value_1);
  //       x_value_1_2 = _mm256_set1_ps(*(X + x_idx_start +23));
  //       y_value_2_temp = _mm256_mul_ps(x_value_1_2, w_value_1); y_value_2 = _mm256_add_ps(y_value_2_temp, y_value_2);
  //       x_value_1_3 = _mm256_set1_ps(*(X + x_idx_start +31));
  //       y_value_3_temp = _mm256_mul_ps(x_value_1_3, w_value_1); y_value_3 = _mm256_add_ps(y_value_3_temp, y_value_3);
  //       x_value_1_4 = _mm256_set1_ps(*(X + x_idx_start +39));
  //       y_value_4_temp = _mm256_mul_ps(x_value_1_4, w_value_1); y_value_4 = _mm256_add_ps(y_value_4_temp, y_value_4);
  //       x_value_1_5 = _mm256_set1_ps(*(X + x_idx_start +47));
  //       y_value_5_temp = _mm256_mul_ps(x_value_1_5, w_value_1); y_value_5 = _mm256_add_ps(y_value_5_temp, y_value_5);
  //       x_value_1_6 = _mm256_set1_ps(*(X + x_idx_start +55));
  //       y_value_6_temp = _mm256_mul_ps(x_value_1_6, w_value_1); y_value_6 = _mm256_add_ps(y_value_6_temp, y_value_6);
  //       x_value_1_7 = _mm256_set1_ps(*(X + x_idx_start +63));
  //       y_value_7_temp = _mm256_mul_ps(x_value_1_7, w_value_1); y_value_7 = _mm256_add_ps(y_value_7_temp, y_value_7);
  //     }
  //     // printf("y_value_0 = %d\n", y_value_0);
  //     _mm256_store_ps(Y + y_idx_start     ,  y_value_0);
  //     _mm256_store_ps(Y + y_idx_start + 8 ,  y_value_1);
  //     _mm256_store_ps(Y + y_idx_start + 16,  y_value_2);
  //     _mm256_store_ps(Y + y_idx_start + 24,  y_value_3);
  //     _mm256_store_ps(Y + y_idx_start + 32,  y_value_4);
  //     _mm256_store_ps(Y + y_idx_start + 40,  y_value_5);
  //     _mm256_store_ps(Y + y_idx_start + 48,  y_value_6);
  //     _mm256_store_ps(Y + y_idx_start + 56,  y_value_7);
  //   }

  //   #ifdef COUNTER_TEST
  //     printf("tid = %d; y loads = %d; x loads = %d; w loads = %d\n", tid, y_counter * 16, w_counter, x_counter * 16);
  //   #endif

  // }
  // printf("Finish foo\n");

  // #ifdef COUNTER_TEST
  //   printf("y loads = %d; x loads = %d; w loads = %d\n", g_y_counter * 16, g_w_counter, g_x_counter * 16);
  // #endif
  // }

  // // printf("Nb = %d; Kb = %d; Cb = %d\n", Nb, Kb, Cb);
  return 0.0f;
}

__attribute__((noinline)) Value foo_512(Value *X, Value *W, Value *Y, int Nb, int Cb, int Kb, int bn, int bk, int bc, int threads) {
  printf("Executing AVX512 Instruction Set.\n");
  int N = Nb * bn;
  int C = Cb * bc;
  int K = Kb * bk;

  #ifdef COUNTER_TEST
    int g_y_counter = 0;
    int g_x_counter = 0;
    int g_w_counter = 0;
  #endif

  # pragma omp parallel num_threads(threads)
  {
    int Nb_start;
    int Nb_size;
    int Kb_start;
    int Kb_size;
    const int tid = omp_get_thread_num();

    // Synchronization at the very beginning
    // #pragma omp barrier

    // Share input
    Nb_start = 0;
    Nb_size = Nb;
    Kb_start = (Kb / threads) * (tid % threads);
    Kb_size = (Kb / threads);


  __m512 y_value_0;
  __m512 y_value_1;
  __m512 y_value_2;
  __m512 y_value_3;
  __m512 y_value_4;
  __m512 y_value_5;
  __m512 y_value_6;
  __m512 y_value_7;
  __m512 y_value_8;
  __m512 y_value_9;
  __m512 y_value_10;
  __m512 y_value_11;
  __m512 y_value_12;
  __m512 y_value_13;
  __m512 y_value_14;
  __m512 y_value_15;

  __m512 x_value_0_0;
  __m512 x_value_0_1;
  __m512 x_value_0_2;
  __m512 x_value_0_3;
  __m512 x_value_0_4;
  __m512 x_value_0_5;
  __m512 x_value_0_6;
  __m512 x_value_0_7;
  __m512 x_value_1_0;
  __m512 x_value_1_1;
  __m512 x_value_1_2;
  __m512 x_value_1_3;
  __m512 x_value_1_4;
  __m512 x_value_1_5;
  __m512 x_value_1_6;
  __m512 x_value_1_7;
  __m512 w_value_0;
  __m512 w_value_1;
  printf("tid = %d; Nb_start = %d; Nb_size = %d; Kb_start = %d; Kb_size = %d\n", tid, Nb_start, Nb_size, Kb_start, Kb_size);

  // for (uint64_t n = Nb_start; n < Nb_start + Nb_size; ++n) { //maximum 8 threads with N of 256 and 32 of bn
  for (uint64_t k = Kb_start; k < Kb_start + Kb_size; ++k) { //maximum 128 threads with K of 1024 and 8 of bn
    // Synchromize per 256 * 1024 values
    // #pragma omp barrier // used for PushMulticast Barrier
    #ifdef COUNTER_TEST
      int y_counter = 0;
      int x_counter = 0;
      int w_counter = 0;
    #endif

    // for (uint64_t k = Kb_start; k < Kb_start + Kb_size; ++k) { //maximum 128 threads with K of 1024 and 8 of bn
    for (uint64_t n = Nb_start; n < Nb_start + Nb_size; ++n) { //maximum 8 threads with N of 256 and 32 of bn
      uint64_t y_idx_start = K * bn * n + bn * bk * k;

      y_value_0  = _mm512_load_ps(Y + y_idx_start      );
      y_value_1  = _mm512_load_ps(Y + y_idx_start +  16);
      y_value_2  = _mm512_load_ps(Y + y_idx_start +  32);
      y_value_3  = _mm512_load_ps(Y + y_idx_start +  48);
      y_value_4  = _mm512_load_ps(Y + y_idx_start +  64);
      y_value_5  = _mm512_load_ps(Y + y_idx_start +  80);
      y_value_6  = _mm512_load_ps(Y + y_idx_start +  96);
      y_value_7  = _mm512_load_ps(Y + y_idx_start + 112);
      y_value_8  = _mm512_load_ps(Y + y_idx_start + 128);
      y_value_9  = _mm512_load_ps(Y + y_idx_start + 144);
      y_value_10 = _mm512_load_ps(Y + y_idx_start + 160);
      y_value_11 = _mm512_load_ps(Y + y_idx_start + 176);
      y_value_12 = _mm512_load_ps(Y + y_idx_start + 192);
      y_value_13 = _mm512_load_ps(Y + y_idx_start + 208);
      y_value_14 = _mm512_load_ps(Y + y_idx_start + 224);
      y_value_15 = _mm512_load_ps(Y + y_idx_start + 240);

      // Synchromize per 16 * 1024 values
      // if ((n % 16) == 0){
        // #pragma omp barrier
      // }
      
      for (uint64_t c = 0; c < Cb; ++c) {
        // Synchromize per 16 * 16 values
        // #pragma omp barrier

        // prefetch begin
        #ifdef Prefetch16Core
          uint64_t cur_x_idx = C * bn * n + bn * bc * c;
          uint64_t next_x_idx = cur_x_idx + (256 * 2);

          if (next_x_idx < (N * C)) {
            // next 16 * 16 block of input
            _mm_prefetch(X + next_x_idx +   0, _MM_HINT_T0);
            _mm_prefetch(X + next_x_idx +  16, _MM_HINT_T0);
            _mm_prefetch(X + next_x_idx +  32, _MM_HINT_T0);
            _mm_prefetch(X + next_x_idx +  48, _MM_HINT_T0);
            _mm_prefetch(X + next_x_idx +  64, _MM_HINT_T0);
            _mm_prefetch(X + next_x_idx +  80, _MM_HINT_T0);
            _mm_prefetch(X + next_x_idx +  96, _MM_HINT_T0);
            _mm_prefetch(X + next_x_idx + 112, _MM_HINT_T0);
            _mm_prefetch(X + next_x_idx + 128, _MM_HINT_T0);
            _mm_prefetch(X + next_x_idx + 144, _MM_HINT_T0);
            _mm_prefetch(X + next_x_idx + 160, _MM_HINT_T0);
            _mm_prefetch(X + next_x_idx + 176, _MM_HINT_T0);
            _mm_prefetch(X + next_x_idx + 192, _MM_HINT_T0);
            _mm_prefetch(X + next_x_idx + 208, _MM_HINT_T0);
            _mm_prefetch(X + next_x_idx + 224, _MM_HINT_T0);
            _mm_prefetch(X + next_x_idx + 240, _MM_HINT_T0);
          }
        #endif
        #ifdef Prefetch64Core
          uint64_t cur_x_idx = C * bn * n + bn * bc * c;
          uint64_t next_x_idx = cur_x_idx + (256 * 4);

          if (next_x_idx < (N * C)) {
            // next 16 * 16 block of input
            _mm_prefetch(X + next_x_idx +   0, _MM_HINT_T0);
            _mm_prefetch(X + next_x_idx +  16, _MM_HINT_T0);
            _mm_prefetch(X + next_x_idx +  32, _MM_HINT_T0);
            _mm_prefetch(X + next_x_idx +  48, _MM_HINT_T0);
            _mm_prefetch(X + next_x_idx +  64, _MM_HINT_T0);
            _mm_prefetch(X + next_x_idx +  80, _MM_HINT_T0);
            _mm_prefetch(X + next_x_idx +  96, _MM_HINT_T0);
            _mm_prefetch(X + next_x_idx + 112, _MM_HINT_T0);
            _mm_prefetch(X + next_x_idx + 128, _MM_HINT_T0);
            _mm_prefetch(X + next_x_idx + 144, _MM_HINT_T0);
            _mm_prefetch(X + next_x_idx + 160, _MM_HINT_T0);
            _mm_prefetch(X + next_x_idx + 176, _MM_HINT_T0);
            _mm_prefetch(X + next_x_idx + 192, _MM_HINT_T0);
            _mm_prefetch(X + next_x_idx + 208, _MM_HINT_T0);
            _mm_prefetch(X + next_x_idx + 224, _MM_HINT_T0);
            _mm_prefetch(X + next_x_idx + 240, _MM_HINT_T0);
          }
        #endif
        // prefetch end

        uint64_t x_idx_start = C * bn * n + bn * bc * c;
        uint64_t w_idx_start = K * bc * c + bk * bc * k;

        w_value_0 = _mm512_load_ps(W + w_idx_start      );
        w_value_1 = _mm512_load_ps(W + w_idx_start +  16);

        y_value_0  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start      )), w_value_0, y_value_0 );
        y_value_1  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start +  16)), w_value_0, y_value_1 );
        y_value_2  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start +  32)), w_value_0, y_value_2 );
        y_value_3  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start +  48)), w_value_0, y_value_3 );
        y_value_4  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start +  64)), w_value_0, y_value_4 );
        y_value_5  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start +  80)), w_value_0, y_value_5 );
        y_value_6  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start +  96)), w_value_0, y_value_6 );
        y_value_7  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 112)), w_value_0, y_value_7 );
        y_value_8  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 128)), w_value_0, y_value_8 );
        y_value_9  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 144)), w_value_0, y_value_9 );
        y_value_10 = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 160)), w_value_0, y_value_10);
        y_value_11 = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 176)), w_value_0, y_value_11);
        y_value_12 = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 192)), w_value_0, y_value_12);
        y_value_13 = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 208)), w_value_0, y_value_13);
        y_value_14 = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 224)), w_value_0, y_value_14);
        y_value_15 = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 240)), w_value_0, y_value_15);

        w_value_0 = _mm512_load_ps(W + w_idx_start +  32);

        x_idx_start = x_idx_start + 1;
        y_value_0  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start      )), w_value_1, y_value_0 );
        y_value_1  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start +  16)), w_value_1, y_value_1 );
        y_value_2  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start +  32)), w_value_1, y_value_2 );
        y_value_3  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start +  48)), w_value_1, y_value_3 );
        y_value_4  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start +  64)), w_value_1, y_value_4 );
        y_value_5  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start +  80)), w_value_1, y_value_5 );
        y_value_6  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start +  96)), w_value_1, y_value_6 );
        y_value_7  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 112)), w_value_1, y_value_7 );
        y_value_8  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 128)), w_value_1, y_value_8 );
        y_value_9  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 144)), w_value_1, y_value_9 );
        y_value_10 = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 160)), w_value_1, y_value_10);
        y_value_11 = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 176)), w_value_1, y_value_11);
        y_value_12 = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 192)), w_value_1, y_value_12);
        y_value_13 = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 208)), w_value_1, y_value_13);
        y_value_14 = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 224)), w_value_1, y_value_14);
        y_value_15 = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 240)), w_value_1, y_value_15);

        w_value_1 = _mm512_load_ps(W + w_idx_start +  48);

        x_idx_start = x_idx_start + 1;
        y_value_0  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start      )), w_value_0, y_value_0 );
        y_value_1  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start +  16)), w_value_0, y_value_1 );
        y_value_2  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start +  32)), w_value_0, y_value_2 );
        y_value_3  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start +  48)), w_value_0, y_value_3 );
        y_value_4  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start +  64)), w_value_0, y_value_4 );
        y_value_5  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start +  80)), w_value_0, y_value_5 );
        y_value_6  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start +  96)), w_value_0, y_value_6 );
        y_value_7  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 112)), w_value_0, y_value_7 );
        y_value_8  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 128)), w_value_0, y_value_8 );
        y_value_9  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 144)), w_value_0, y_value_9 );
        y_value_10 = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 160)), w_value_0, y_value_10);
        y_value_11 = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 176)), w_value_0, y_value_11);
        y_value_12 = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 192)), w_value_0, y_value_12);
        y_value_13 = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 208)), w_value_0, y_value_13);
        y_value_14 = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 224)), w_value_0, y_value_14);
        y_value_15 = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 240)), w_value_0, y_value_15);

        w_value_0 = _mm512_load_ps(W + w_idx_start +  64);

        x_idx_start = x_idx_start + 1;
        y_value_0  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start      )), w_value_1, y_value_0 );
        y_value_1  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start +  16)), w_value_1, y_value_1 );
        y_value_2  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start +  32)), w_value_1, y_value_2 );
        y_value_3  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start +  48)), w_value_1, y_value_3 );
        y_value_4  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start +  64)), w_value_1, y_value_4 );
        y_value_5  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start +  80)), w_value_1, y_value_5 );
        y_value_6  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start +  96)), w_value_1, y_value_6 );
        y_value_7  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 112)), w_value_1, y_value_7 );
        y_value_8  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 128)), w_value_1, y_value_8 );
        y_value_9  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 144)), w_value_1, y_value_9 );
        y_value_10 = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 160)), w_value_1, y_value_10);
        y_value_11 = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 176)), w_value_1, y_value_11);
        y_value_12 = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 192)), w_value_1, y_value_12);
        y_value_13 = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 208)), w_value_1, y_value_13);
        y_value_14 = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 224)), w_value_1, y_value_14);
        y_value_15 = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 240)), w_value_1, y_value_15);

        w_value_1 = _mm512_load_ps(W + w_idx_start +  80);

        x_idx_start = x_idx_start + 1;
        y_value_0  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start      )), w_value_0, y_value_0 );
        y_value_1  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start +  16)), w_value_0, y_value_1 );
        y_value_2  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start +  32)), w_value_0, y_value_2 );
        y_value_3  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start +  48)), w_value_0, y_value_3 );
        y_value_4  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start +  64)), w_value_0, y_value_4 );
        y_value_5  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start +  80)), w_value_0, y_value_5 );
        y_value_6  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start +  96)), w_value_0, y_value_6 );
        y_value_7  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 112)), w_value_0, y_value_7 );
        y_value_8  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 128)), w_value_0, y_value_8 );
        y_value_9  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 144)), w_value_0, y_value_9 );
        y_value_10 = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 160)), w_value_0, y_value_10);
        y_value_11 = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 176)), w_value_0, y_value_11);
        y_value_12 = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 192)), w_value_0, y_value_12);
        y_value_13 = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 208)), w_value_0, y_value_13);
        y_value_14 = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 224)), w_value_0, y_value_14);
        y_value_15 = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 240)), w_value_0, y_value_15);

        w_value_0 = _mm512_load_ps(W + w_idx_start +  96);

        x_idx_start = x_idx_start + 1;
        y_value_0  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start      )), w_value_1, y_value_0 );
        y_value_1  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start +  16)), w_value_1, y_value_1 );
        y_value_2  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start +  32)), w_value_1, y_value_2 );
        y_value_3  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start +  48)), w_value_1, y_value_3 );
        y_value_4  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start +  64)), w_value_1, y_value_4 );
        y_value_5  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start +  80)), w_value_1, y_value_5 );
        y_value_6  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start +  96)), w_value_1, y_value_6 );
        y_value_7  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 112)), w_value_1, y_value_7 );
        y_value_8  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 128)), w_value_1, y_value_8 );
        y_value_9  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 144)), w_value_1, y_value_9 );
        y_value_10 = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 160)), w_value_1, y_value_10);
        y_value_11 = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 176)), w_value_1, y_value_11);
        y_value_12 = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 192)), w_value_1, y_value_12);
        y_value_13 = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 208)), w_value_1, y_value_13);
        y_value_14 = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 224)), w_value_1, y_value_14);
        y_value_15 = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 240)), w_value_1, y_value_15);

        w_value_1 = _mm512_load_ps(W + w_idx_start + 112);

        x_idx_start = x_idx_start + 1;
        y_value_0  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start      )), w_value_0, y_value_0 );
        y_value_1  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start +  16)), w_value_0, y_value_1 );
        y_value_2  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start +  32)), w_value_0, y_value_2 );
        y_value_3  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start +  48)), w_value_0, y_value_3 );
        y_value_4  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start +  64)), w_value_0, y_value_4 );
        y_value_5  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start +  80)), w_value_0, y_value_5 );
        y_value_6  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start +  96)), w_value_0, y_value_6 );
        y_value_7  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 112)), w_value_0, y_value_7 );
        y_value_8  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 128)), w_value_0, y_value_8 );
        y_value_9  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 144)), w_value_0, y_value_9 );
        y_value_10 = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 160)), w_value_0, y_value_10);
        y_value_11 = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 176)), w_value_0, y_value_11);
        y_value_12 = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 192)), w_value_0, y_value_12);
        y_value_13 = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 208)), w_value_0, y_value_13);
        y_value_14 = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 224)), w_value_0, y_value_14);
        y_value_15 = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 240)), w_value_0, y_value_15);

        w_value_0 = _mm512_load_ps(W + w_idx_start + 128);

        x_idx_start = x_idx_start + 1;
        y_value_0  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start      )), w_value_1, y_value_0 );
        y_value_1  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start +  16)), w_value_1, y_value_1 );
        y_value_2  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start +  32)), w_value_1, y_value_2 );
        y_value_3  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start +  48)), w_value_1, y_value_3 );
        y_value_4  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start +  64)), w_value_1, y_value_4 );
        y_value_5  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start +  80)), w_value_1, y_value_5 );
        y_value_6  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start +  96)), w_value_1, y_value_6 );
        y_value_7  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 112)), w_value_1, y_value_7 );
        y_value_8  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 128)), w_value_1, y_value_8 );
        y_value_9  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 144)), w_value_1, y_value_9 );
        y_value_10 = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 160)), w_value_1, y_value_10);
        y_value_11 = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 176)), w_value_1, y_value_11);
        y_value_12 = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 192)), w_value_1, y_value_12);
        y_value_13 = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 208)), w_value_1, y_value_13);
        y_value_14 = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 224)), w_value_1, y_value_14);
        y_value_15 = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 240)), w_value_1, y_value_15);

        w_value_1 = _mm512_load_ps(W + w_idx_start + 144);

        x_idx_start = x_idx_start + 1;
        y_value_0  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start      )), w_value_0, y_value_0 );
        y_value_1  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start +  16)), w_value_0, y_value_1 );
        y_value_2  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start +  32)), w_value_0, y_value_2 );
        y_value_3  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start +  48)), w_value_0, y_value_3 );
        y_value_4  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start +  64)), w_value_0, y_value_4 );
        y_value_5  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start +  80)), w_value_0, y_value_5 );
        y_value_6  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start +  96)), w_value_0, y_value_6 );
        y_value_7  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 112)), w_value_0, y_value_7 );
        y_value_8  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 128)), w_value_0, y_value_8 );
        y_value_9  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 144)), w_value_0, y_value_9 );
        y_value_10 = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 160)), w_value_0, y_value_10);
        y_value_11 = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 176)), w_value_0, y_value_11);
        y_value_12 = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 192)), w_value_0, y_value_12);
        y_value_13 = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 208)), w_value_0, y_value_13);
        y_value_14 = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 224)), w_value_0, y_value_14);
        y_value_15 = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 240)), w_value_0, y_value_15);

        w_value_0 = _mm512_load_ps(W + w_idx_start + 160);

        x_idx_start = x_idx_start + 1;
        y_value_0  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start      )), w_value_1, y_value_0 );
        y_value_1  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start +  16)), w_value_1, y_value_1 );
        y_value_2  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start +  32)), w_value_1, y_value_2 );
        y_value_3  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start +  48)), w_value_1, y_value_3 );
        y_value_4  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start +  64)), w_value_1, y_value_4 );
        y_value_5  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start +  80)), w_value_1, y_value_5 );
        y_value_6  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start +  96)), w_value_1, y_value_6 );
        y_value_7  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 112)), w_value_1, y_value_7 );
        y_value_8  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 128)), w_value_1, y_value_8 );
        y_value_9  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 144)), w_value_1, y_value_9 );
        y_value_10 = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 160)), w_value_1, y_value_10);
        y_value_11 = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 176)), w_value_1, y_value_11);
        y_value_12 = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 192)), w_value_1, y_value_12);
        y_value_13 = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 208)), w_value_1, y_value_13);
        y_value_14 = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 224)), w_value_1, y_value_14);
        y_value_15 = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 240)), w_value_1, y_value_15);

        w_value_1 = _mm512_load_ps(W + w_idx_start + 176);

        x_idx_start = x_idx_start + 1;
        y_value_0  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start      )), w_value_0, y_value_0 );
        y_value_1  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start +  16)), w_value_0, y_value_1 );
        y_value_2  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start +  32)), w_value_0, y_value_2 );
        y_value_3  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start +  48)), w_value_0, y_value_3 );
        y_value_4  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start +  64)), w_value_0, y_value_4 );
        y_value_5  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start +  80)), w_value_0, y_value_5 );
        y_value_6  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start +  96)), w_value_0, y_value_6 );
        y_value_7  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 112)), w_value_0, y_value_7 );
        y_value_8  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 128)), w_value_0, y_value_8 );
        y_value_9  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 144)), w_value_0, y_value_9 );
        y_value_10 = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 160)), w_value_0, y_value_10);
        y_value_11 = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 176)), w_value_0, y_value_11);
        y_value_12 = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 192)), w_value_0, y_value_12);
        y_value_13 = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 208)), w_value_0, y_value_13);
        y_value_14 = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 224)), w_value_0, y_value_14);
        y_value_15 = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 240)), w_value_0, y_value_15);

        w_value_0 = _mm512_load_ps(W + w_idx_start + 192);

        x_idx_start = x_idx_start + 1;
        y_value_0  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start      )), w_value_1, y_value_0 );
        y_value_1  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start +  16)), w_value_1, y_value_1 );
        y_value_2  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start +  32)), w_value_1, y_value_2 );
        y_value_3  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start +  48)), w_value_1, y_value_3 );
        y_value_4  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start +  64)), w_value_1, y_value_4 );
        y_value_5  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start +  80)), w_value_1, y_value_5 );
        y_value_6  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start +  96)), w_value_1, y_value_6 );
        y_value_7  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 112)), w_value_1, y_value_7 );
        y_value_8  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 128)), w_value_1, y_value_8 );
        y_value_9  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 144)), w_value_1, y_value_9 );
        y_value_10 = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 160)), w_value_1, y_value_10);
        y_value_11 = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 176)), w_value_1, y_value_11);
        y_value_12 = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 192)), w_value_1, y_value_12);
        y_value_13 = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 208)), w_value_1, y_value_13);
        y_value_14 = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 224)), w_value_1, y_value_14);
        y_value_15 = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 240)), w_value_1, y_value_15);

        w_value_1 = _mm512_load_ps(W + w_idx_start + 208);

        x_idx_start = x_idx_start + 1;
        y_value_0  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start      )), w_value_0, y_value_0 );
        y_value_1  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start +  16)), w_value_0, y_value_1 );
        y_value_2  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start +  32)), w_value_0, y_value_2 );
        y_value_3  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start +  48)), w_value_0, y_value_3 );
        y_value_4  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start +  64)), w_value_0, y_value_4 );
        y_value_5  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start +  80)), w_value_0, y_value_5 );
        y_value_6  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start +  96)), w_value_0, y_value_6 );
        y_value_7  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 112)), w_value_0, y_value_7 );
        y_value_8  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 128)), w_value_0, y_value_8 );
        y_value_9  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 144)), w_value_0, y_value_9 );
        y_value_10 = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 160)), w_value_0, y_value_10);
        y_value_11 = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 176)), w_value_0, y_value_11);
        y_value_12 = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 192)), w_value_0, y_value_12);
        y_value_13 = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 208)), w_value_0, y_value_13);
        y_value_14 = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 224)), w_value_0, y_value_14);
        y_value_15 = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 240)), w_value_0, y_value_15);

        w_value_0 = _mm512_load_ps(W + w_idx_start + 224);

        x_idx_start = x_idx_start + 1;
        y_value_0  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start      )), w_value_1, y_value_0 );
        y_value_1  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start +  16)), w_value_1, y_value_1 );
        y_value_2  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start +  32)), w_value_1, y_value_2 );
        y_value_3  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start +  48)), w_value_1, y_value_3 );
        y_value_4  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start +  64)), w_value_1, y_value_4 );
        y_value_5  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start +  80)), w_value_1, y_value_5 );
        y_value_6  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start +  96)), w_value_1, y_value_6 );
        y_value_7  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 112)), w_value_1, y_value_7 );
        y_value_8  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 128)), w_value_1, y_value_8 );
        y_value_9  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 144)), w_value_1, y_value_9 );
        y_value_10 = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 160)), w_value_1, y_value_10);
        y_value_11 = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 176)), w_value_1, y_value_11);
        y_value_12 = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 192)), w_value_1, y_value_12);
        y_value_13 = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 208)), w_value_1, y_value_13);
        y_value_14 = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 224)), w_value_1, y_value_14);
        y_value_15 = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 240)), w_value_1, y_value_15);

        w_value_1 = _mm512_load_ps(W + w_idx_start + 240);

        x_idx_start = x_idx_start + 1;
        y_value_0  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start      )), w_value_0, y_value_0 );
        y_value_1  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start +  16)), w_value_0, y_value_1 );
        y_value_2  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start +  32)), w_value_0, y_value_2 );
        y_value_3  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start +  48)), w_value_0, y_value_3 );
        y_value_4  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start +  64)), w_value_0, y_value_4 );
        y_value_5  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start +  80)), w_value_0, y_value_5 );
        y_value_6  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start +  96)), w_value_0, y_value_6 );
        y_value_7  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 112)), w_value_0, y_value_7 );
        y_value_8  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 128)), w_value_0, y_value_8 );
        y_value_9  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 144)), w_value_0, y_value_9 );
        y_value_10 = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 160)), w_value_0, y_value_10);
        y_value_11 = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 176)), w_value_0, y_value_11);
        y_value_12 = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 192)), w_value_0, y_value_12);
        y_value_13 = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 208)), w_value_0, y_value_13);
        y_value_14 = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 224)), w_value_0, y_value_14);
        y_value_15 = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 240)), w_value_0, y_value_15);

        x_idx_start = x_idx_start + 1;
        y_value_0  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start      )), w_value_1, y_value_0 );
        y_value_1  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start +  16)), w_value_1, y_value_1 );
        y_value_2  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start +  32)), w_value_1, y_value_2 );
        y_value_3  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start +  48)), w_value_1, y_value_3 );
        y_value_4  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start +  64)), w_value_1, y_value_4 );
        y_value_5  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start +  80)), w_value_1, y_value_5 );
        y_value_6  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start +  96)), w_value_1, y_value_6 );
        y_value_7  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 112)), w_value_1, y_value_7 );
        y_value_8  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 128)), w_value_1, y_value_8 );
        y_value_9  = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 144)), w_value_1, y_value_9 );
        y_value_10 = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 160)), w_value_1, y_value_10);
        y_value_11 = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 176)), w_value_1, y_value_11);
        y_value_12 = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 192)), w_value_1, y_value_12);
        y_value_13 = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 208)), w_value_1, y_value_13);
        y_value_14 = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 224)), w_value_1, y_value_14);
        y_value_15 = _mm512_fmadd_ps(_mm512_set1_ps(*(X + x_idx_start + 240)), w_value_1, y_value_15);
      }
      // printf("y_value_0 = %d\n", y_value_0);
      _mm512_store_ps(Y + y_idx_start      ,  y_value_0 );
      _mm512_store_ps(Y + y_idx_start +  16,  y_value_1 );
      _mm512_store_ps(Y + y_idx_start +  32,  y_value_2 );
      _mm512_store_ps(Y + y_idx_start +  48,  y_value_3 );
      _mm512_store_ps(Y + y_idx_start +  64,  y_value_4 );
      _mm512_store_ps(Y + y_idx_start +  80,  y_value_5 );
      _mm512_store_ps(Y + y_idx_start +  96,  y_value_6 );
      _mm512_store_ps(Y + y_idx_start + 112,  y_value_7 );
      _mm512_store_ps(Y + y_idx_start + 128,  y_value_8 );
      _mm512_store_ps(Y + y_idx_start + 144,  y_value_9 );
      _mm512_store_ps(Y + y_idx_start + 160,  y_value_10);
      _mm512_store_ps(Y + y_idx_start + 176,  y_value_11);
      _mm512_store_ps(Y + y_idx_start + 192,  y_value_12);
      _mm512_store_ps(Y + y_idx_start + 208,  y_value_13);
      _mm512_store_ps(Y + y_idx_start + 224,  y_value_14);
      _mm512_store_ps(Y + y_idx_start + 240,  y_value_15);
    }

    #ifdef COUNTER_TEST
      printf("tid = %d; y loads = %d; x loads = %d; w loads = %d\n", tid, y_counter * 16, w_counter, x_counter * 16);
    #endif

  }
  // printf("Finish foo\n");

  #ifdef COUNTER_TEST
    printf("y loads = %d; x loads = %d; w loads = %d\n", g_y_counter * 16, g_w_counter, g_x_counter * 16);
  #endif
  }
  return 0.0f;
}

#define CACHE_BLOCK_SIZE 64

int main(int argc, char *argv[]) {
  int i, j;

  if ( argc != 10 ) {
    printf("Need Input Parameters!!\n");
    return -1;
  }

  int numThreads = 1;
  int iters = 10;       /* repetitions of benchmark */
  int MB = 32;          /* mini-batch size, "N" */
  int bn = 64;
  int bk = 64;
  int bc = 64;
  int C = 1024;
  int K = 1024;
  int vector_elements = 16;

  i = 1;
  printf("argc = %d!!\n", argc);
  if (argc > i) numThreads      = atoi(argv[i++]);
  if (argc > i) iters           = atoi(argv[i++]);
  if (argc > i) MB              = atoi(argv[i++]);
  if (argc > i) bn              = atoi(argv[i++]);
  if (argc > i) bk              = atoi(argv[i++]);
  if (argc > i) bc              = atoi(argv[i++]);
  if (argc > i) C               = atoi(argv[i++]);
  if (argc > i) K               = atoi(argv[i++]);
  if (argc > i) vector_elements = atoi(argv[i++]);

  omp_set_dynamic(0);
  omp_set_num_threads(numThreads);
  omp_set_schedule(omp_sched_static, 0);

  size_t sizeX = MB * C * sizeof(Value);
  size_t sizeW = C * K * sizeof(Value);
  size_t sizeY = MB * K * sizeof(Value);

  int Nb = MB / bn;
  int Cb = C / bc;
  int Kb = K / bk;

  int size_x = MB * C;
  int size_w = C * K;
  int size_y = MB * K;

  Value *X = (Value *)aligned_alloc(CACHE_BLOCK_SIZE, sizeX);
  for (int index = 0; index < size_x; index ++){
    X[index] = (float)1;
  }
  Value *W = (Value *)aligned_alloc(CACHE_BLOCK_SIZE, sizeW);
  for (int index = 0; index < size_w; index ++){
    W[index] = (float)2;
  }
  Value *Y = (Value *)aligned_alloc(CACHE_BLOCK_SIZE, sizeY);

  if (!X || !W || !Y) {
    printf("Failed to allocate X %p W %p Y %p.\n", X, W, Y);
    exit(1);
  }
#ifdef GEM_FORGE
  m5_detail_sim_start();
#endif
// #ifdef GEM_FORGE
//   m5_reset_stats(0, 0);
// #endif
#ifdef WARM_CACHE
  printf("Start warming up cache ...\n");
  for (int iter = 0; iter < 1; iter ++){
    if (vector_elements == 1){
      volatile Value temp = foo_sisd(X, W, Y, Nb, Cb, Kb, bn, bk, bc, numThreads);
    } else if (vector_elements == 16) {
      volatile Value temp = foo_512(X, W, Y, Nb, Cb, Kb, bn, bk, bc, numThreads);
    } else if (vector_elements == 8) {
      volatile Value temp = foo_256(X, W, Y, Nb, Cb, Kb, bn, bk, bc, numThreads);
    }else if (vector_elements == 4) {
      volatile Value temp = foo_128(X, W, Y, Nb, Cb, Kb, bn, bk, bc, numThreads);
    }
  }
  printf("Finished cache warmup.\n");
  // for (int index = 0; index < size_y; index ++){
  //   if (Y[index] != C*2) {
  //     printf("Y[%d] = %f\n", index, Y[index]);
  //   }
  //   // assert(Y[index] == C*2);
  //   // printf("Finished cache warmup.\n");
  // }
#endif


// // Used for warmup
#ifdef GEM_FORGE
  m5_reset_stats(0, 0);
#endif

for (int iter = 0; iter < iters - 1; iter ++){
  if (vector_elements == 1){
    volatile Value temp = foo_sisd(X, W, Y, Nb, Cb, Kb, bn, bk, bc, numThreads);
  } else if (vector_elements == 16) {
    volatile Value C_result = foo_512(X, W, Y, Nb, Cb, Kb, bn, bk, bc, numThreads);
  } else if (vector_elements == 8) {
    volatile Value C_result = foo_256(X, W, Y, Nb, Cb, Kb, bn, bk, bc, numThreads);
  }else if (vector_elements == 4) {
    volatile Value C_result = foo_128(X, W, Y, Nb, Cb, Kb, bn, bk, bc, numThreads);
  }
}
  // for (int index = 0; index < size_y; index ++){
  //   if (Y[index] != 4096) {
  //     printf("Y[%d] = %f\n", index, Y[index]);
  //   }
  //   assert(Y[index] == 4096);
  //   // printf("Finished cache warmup.\n");
  // }
#ifdef GEM_FORGE
  m5_detail_sim_end();
  exit(0);
#endif

  return 0;
}
