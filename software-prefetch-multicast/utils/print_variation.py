import os
import sys
import argparse
import numpy as np
import math
from scipy import stats
from copy import deepcopy
import matplotlib.pyplot as plt
import pandas as pd
import seaborn as sns
from easypyplot import pdf, barchart
from easypyplot import format as fmt

filename = f"./m5out/AE-result/256kB/link-128bits/baseline/mlp-16cpus/sim.log"

access_interval = {}

for i in range(16):
    access_interval[i] = []

with open(filename, "r") as statsfile:
    for line in statsfile:
        if "L1_GetS!!" in line:
            if "L1_GetS!!: addr = 0x1b7d00 , pc = 0x403463" in line:
                newline = line.split()
                for i in range(16):
                    if (newline[2] == "system.ruby.l1_cntrl" + str(i) + ":"):
                        access_interval[i].append(int(newline[4]))
                        break
statsfile.close()

# print(access_interval)

length = len(access_interval[0])

sequence_iteration = {}

for i in range(length):
    sequence_iteration[i] = []

for i in range(length):
    for j in range(16):
        sequence_iteration[i].append(access_interval[j][i])

print(sequence_iteration)

bar_width = 0.8  # 每个子柱子的宽度
indices = np.arange(16)

# figure_size = (18, 8)

# fig, ax = plt.subplots(dpi=1000, figsize=figure_size)

# for i in range(16):
#     bottom_value = 0
#     for j in range(length):
#         if(j == 0):
#             ax.bar(i, sequence_iteration[j][i], bottom=bottom_value)
#             bottom_value = sequence_iteration[j][i]
#         else:
#             ax.bar(i, (sequence_iteration[j][i] - sequence_iteration[j-1][i]), bottom=bottom_value)
#             bottom_value = sequence_iteration[j][i]

# plt.xlabel('Core_X',fontdict={'family':'Tw Cen MT', 'fontsize': 20,'weight': 'bold'})
# plt.ylabel('Cycles when touch the head of the input',fontdict={'family':'Tw Cen MT', 'fontsize': 20,'weight': 'bold'})
# plt.xticks(font={'family':'Tw Cen MT', 'size':20})
# plt.yticks(font={'family':'Tw Cen MT', 'size':20})
# ax.set_xticks(np.arange(16))
# plt.tight_layout()

# plt.savefig(os.path.join('overall.pdf'))

xticks = []
group_names = []
colors = ['#FA7F6F', '#82B0D2']
for i in range (16):
    xticks.append(i)
    group_names.append(str(i))
entry_names = ["The 3rd iteration", "The 4th iteration"]
# for i in range(2):
#     entry_names.append("The " + str(i+2) + " iteration")
    # colors.append('#b298dc')


figname = './figures/reproduce/Fig_3.pdf'
#figsize = (12, 5)
figsize = (10, 6)
pdfpage, fig = pdf.plot_setup(figname, figsize=figsize, fontsize=24,
        font=("family", "Tw Cen MT"))

ax = fig.gca()
data = []
for j in range(16):
    data_pair = []
    for i in range(6,8):
        min_value = min(sequence_iteration[i])
        data_pair.append((sequence_iteration[i][j] - min_value)/1000)
    data.append(data_pair)
print(data)

hdls = barchart.draw(
        ax,
        data,
        group_names=group_names,
        entry_names=entry_names,
        xticks=xticks,
        xticklabelfontsize=24,
        colors=colors,
        breakdown=False,
        width=bar_width)
# fig.autofmt_xdate()
plt.xlabel('Core ID',fontdict={'family':'Tw Cen MT', 'fontsize': 24})
ax.yaxis.grid(True, linestyle="--")
ax.set_ylim(0, 360)
ax.set_yticks(np.arange(0, 360, 50))
ax.set_ylabel("Time Variation (Thousand Cycles)")
ax.yaxis.set_label_coords(-0.09, 0.45)

ax.legend(
        hdls,
        entry_names,
        loc="upper center",
        #bbox_to_anchor=(0.5, 1.18),
        bbox_to_anchor=(0.48, 1.18),
        # ncol=np.ceil((num_links + 1) / 2),
        ncol=2,
        frameon=False,
        handletextpad=0.2,
        columnspacing=0.6)

fig.subplots_adjust(bottom=0.25, top=0.8)
pdf.plot_teardown(pdfpage, fig)