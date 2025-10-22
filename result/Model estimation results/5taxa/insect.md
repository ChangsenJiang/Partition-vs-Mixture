# Summary of Results for insect

| Name | Free parameters | Partitions | Mix LogL | mAIC | LogL | AIC | BIC | Runtime | Command |
|------|-----------------|------------|-----------|------|------|-----|-----|---------|---------|
| **insect5_c60_F** | 90 | NA | NA | 1054690.9025 | -527255.4513 | 1054690.9025 | 1055522.8366 | 1.21 h | `../../iqtree2 -s ./5_concated.nex -m LG+C60+F+R3 -te ../partition/Q/insect5_Q_search.treefile -T 30 -mem 120G -safe -pre insect5_c60_F` |
| insect5_c60_unopt | 11 | NA | NA | 1063264.0464 | -531621.0232 | 1063264.0464 | 1063365.7272 | 0.86 h | `../../iqtree2 -s ./5_concated.nex -m LG+C60+R3 -te ../partition/Q/insect5_Q_search.treefile -T 30 -mem 120G -safe -pre insect5_c60_unopt` |
| 5insect_c60_init | 30 | NA | NA | 1055803.7299 | -527871.8649 | 1055803.7299 | 1056081.0413 | 1.27 h | `../../iqtree2 -s 5_concated.nex -m MF -merit AIC -T 30 -mem 120G -pre 5insect_c60_init` |
| insect5_c60_search | 7 | NA | NA | 1054530.0286 | -527258.0143 | 1054530.0286 | 1054594.7346 | 0.24 h | `../../iqtree2 -s 5_concated.nex -mdef insect5_c60_F_parameter.nex -m LG_C60_F_R3 -t ../partition/Q/insect5_Q_search.treefile -bb 1000 --wbtl -T 30 --mem 120G -pre insect5_c60_search` |
| insect5_c60_opt | 70 | NA | NA | 1057197.6925 | -528528.8462 | 1057197.6925 | 1057844.7523 | 2.59 h | `../../iqtree2 -s ./5_concated.nex -m LG+C60+R3 -te ../partition/Q/insect5_Q_search.treefile -mwopt -T 30 -mem 120G -safe -pre insect5_c60_opt` |
| **insect5_p_mf** | 1748 | 105 | -527231.0381 | 1057958.0761 | -518611.0660 | 1040718.1319 | 1056876.1402 | 0.81 h | `../../../iqtree2 -s 5_concated.nex -p 5_concated.nex -m MF+MERGE -merit AIC -T 7 -pre insect5_p_mf` |
| insect5_p_search | 1612 | 105 | -527231.8553 | 1057687.7105 | -518611.1444 | 1040446.2887 | 1055347.1521 | 0.04 h | `../../../iqtree2 -s 5_concated.nex -p insect5_p_mf.best_model.nex -t insect5_p_mf.treefile -bb 1000 --wbtl -T 30 -pre insect5_p_search` |
| insect5_q_mf | 1734 | 125 | -532144.1510 | 1067756.3020 | -520779.1958 | 1045026.3917 | 1061054.9879 | 0.44 h | `../../../iqtree2 -s 5_concated.nex -q 5_concated.nex -m MF+MERGE -mrate E,I,G,I+G -merit AIC -T 7 -pre insect5_q_mf` |
| insect5_Q_mf | 2716 | 128 | -527265.8783 | 1059963.7567 | -516479.5538 | 1038391.1077 | 1063497.0289 | 0.70 h | `../../../iqtree2 -s 5_concated.nex -Q 5_concated.nex -m MF+MERGE -merit AIC -T 7 -pre insect5_Q_mf` |
| insect5_Q_search | 2538 | 128 | -527283.4081 | 1059642.8161 | -516479.5557 | 1038035.1114 | 1061495.6520 | 0.03 h | `../../../iqtree2 -s 5_concated.nex -Q insect5_Q_mf.best_model.nex -t insect5_Q_mf.treefile -bb 1000 --wbtl -T 30 -pre insect5_Q_search` |

## Summary of log file
1. Partition Analysis
- Best partition: Q with AIC: 1038391.1077
- Best partition: p with mAIC: 1057958.0761

2. C60 Initialization
- Selected model: LG+F+R3

3. C60 Running (full mode)
- Best C60: c60_F with AIC: 1054690.9025
- Best overall: C60 (c60_F) with AIC: 1054690.9025

4. Treesearch Result
- insect5_c60_search with mAIC: 1054530.0286
- insect5_p_search with mAIC: 1057687.7105
- insect5_Q_search with mAIC: 1059642.8161

5. Corrected mAIC using correct parameter number:
- insect5_c60_search: 2 * 90 - 2 * -527258.0143 = 1054696.0286
- insect5_p_search: 2 * 1748 - 2 * -527231.8553 = 1057959.71
- insect5_Q_search: 2 * 2716 - 2 * -527283.4081 = 1059998.82
