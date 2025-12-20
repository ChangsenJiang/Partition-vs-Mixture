# Summary of Results for insect

| Name | Free parameters | Partitions | Mix LogL | mAIC | LogL | AIC | BIC | Runtime | Command |
|------|-----------------|------------|-----------|------|------|-----|-----|---------|---------|
| insect10_c60_opt | 82 | NA | NA | 1736838.4973 | -868337.2486 | 1736838.4973 | 1737596.4816 | 5.88 h | `../../iqtree2 -s ./10_concated.nex -m LG+C60+R4 -te ../partition/Q/insect10_Q_search.treefile -mwopt -T 45 -mem 120G -safe -pre insect10_c60_opt` |
| insect10_c60_unopt | 23 | NA | NA | 1747080.6602 | -873517.3301 | 1747080.6602 | 1747293.2655 | 1.40 h | `../../iqtree2 -s ./10_concated.nex -m LG+C60+R4 -te ../partition/Q/insect10_Q_search.treefile -T 45 -mem 120G -safe -pre insect10_c60_unopt` |
| 10insect_c60_init | 42 | NA | NA | 1742573.0165 | -871244.5083 | 1742573.0165 | 1742961.2524 | 0.50 h | `../../iqtree2 -s 10_concated.nex -m MF -merit AIC -T 45 -mem 120G -pre 10insect_c60_init` |
| **insect10_c60_F** | 102 | NA | NA | 1732866.6777 | -866331.3388 | 1732866.6777 | 1733809.5363 | 1.45 h | `../../iqtree2 -s ./10_concated.nex -m LG+C60+F+R4 -te ../partition/Q/insect10_Q_search.treefile -T 45 -mem 120G -safe -pre insect10_c60_F` |
| insect10_c60_search | 17 | NA | NA | 1732700.2233 | -866333.1116 | 1732700.2233 | 1732857.3664 | 1.90 h | `../../iqtree2 -s 10_concated.nex -mdef insect10_c60_F_parameter.nex -m LG_C60_F_R4 -t ../partition/Q/insect10_Q_search.treefile -bb 1000 --wbtl -T 45 --mem 120G -pre insect10_c60_search` |
| **insect10_p_mf** | 1722 | 115 | -869756.7224 | 1742957.4448 | -858723.9685 | 1720891.9370 | 1736809.6087 | 0.44 h | `../../../iqtree2 -s 10_concated.nex -p 10_concated.nex -m MF+MERGE -merit AIC -T 11 -pre insect10_p_mf` |
| insect10_p_search | 1480 | 115 | -869756.7471 | 1742473.4941 | -858723.9655 | 1720407.9311 | 1734088.6245 | 0.10 h | `../../../iqtree2 -s 10_concated.nex -p insect10_p_mf.best_model.nex -t insect10_p_mf.treefile -bb 1000 --wbtl -T 45 -pre insect10_p_search` |
| insect10_q_mf | 1669 | 163 | -873531.7808 | 1750401.5616 | -862908.7961 | 1729155.5921 | 1744583.3471 | 0.21 h | `../../../iqtree2 -s 10_concated.nex -q 10_concated.nex -m MF+MERGE -mrate E,I,G,I+G -merit AIC -T 11 -pre insect10_q_mf` |
| insect10_Q_mf | 4745 | 188 | -871039.8160 | 1751569.6320 | -851502.3687 | 1712494.7374 | 1756356.1499 | 0.33 h | `../../../iqtree2 -s 10_concated.nex -Q 10_concated.nex -m MF+MERGE -merit AIC -T 11 -pre insect10_Q_mf` |
| insect10_Q_search | 4349 | 188 | -871047.8277 | 1750793.6553 | -851504.4635 | 1711706.9269 | 1751907.8295 | 0.04 h | `../../../iqtree2 -s 10_concated.nex -Q insect10_Q_mf.best_model.nex -t insect10_Q_mf.treefile -bb 1000 --wbtl -T 45 -pre insect10_Q_search` |

## Summary of log file
1. Partition Analysis
- Best partition: Q with AIC: 1712494.7374
- Best partition: p with mAIC: 1742957.4448

2. C60 Initialization
- Selected model: LG+F+R4

3. C60 Running (full mode)
- Best C60: c60_F with AIC: 1732866.6777
- Best overall: C60 (c60_F) with AIC: 1732866.6777

4. Treesearch Result
- insect10_c60_search with mAIC: 1732700.2233
- insect10_p_search with mAIC: 1742473.4941
- insect10_Q_search with mAIC: 1750793.6553

5. Corrected mAIC using correct parameter number:
- insect10_c60_search: 2 * 102 - 2 * -866333.1116 = 1732870.2232
- insect10_p_search: 2 * 1722 - 2 * -869756.7471 = 1742957.49
- insect10_Q_search: 2 * 4745 - 2 * -871047.8277 = 1751585.66
