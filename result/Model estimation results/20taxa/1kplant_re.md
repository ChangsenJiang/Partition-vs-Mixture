# Summary of Results for 1kplant_re

| Name | Free parameters | Partitions | Mix LogL | mAIC | LogL | AIC | Runtime | Command |
|------|-----------------|------------|-----------|------|------|-----|---------|---------|
| 1kplant20_c60_search | 37 | NA | NA | 6072505.7534 | -3036215.8767 | 6072505.7534 | 33.08 h | `../../iqtree2 -s 20_concated.nex -mdef 1kplant20_c60_F_parameter.nex -m LG_C60_F_R10 -t ../partition/Q/1kplant20_Q_search.treefile -T 60 --mem 120G -pre 1kplant20_c60_search` |
| 1kplant20_c60_opt | 114 | NA | NA | 6096270.2906 | -3048021.1453 | 6096270.2906 | 42.23 h | `../../iqtree2 -s ./20_concated.nex -m LG+C60+R10 -te ../partition/Q/1kplant20_Q_search.treefile -mwopt -T 60 -mem 120G -safe -pre 1kplant20_c60_opt` |
| **1kplant20_c60_F** | 134 | NA | NA | 6072751.7771 | -3036241.8885 | 6072751.7771 | 26.34 h | `../../iqtree2 -s ./20_concated.nex -m LG+C60+F+R10 -te ../partition/Q/1kplant20_Q_search.treefile -T 60 -mem 120G -safe -pre 1kplant20_c60_F` |
| 1kplant20_c60_unopt | 55 | NA | NA | 6147118.8203 | -3073504.4102 | 6147118.8203 | 16.61 h | `../../iqtree2 -s ./20_concated.nex -m LG+C60+R10 -te ../partition/Q/1kplant20_Q_search.treefile -T 60 -mem 120G -safe -pre 1kplant20_c60_unopt` |
| 201kplant_c60_init | 74 | NA | NA | 6127893.7263 | -3063872.8631 | 6127893.7263 | 2.47 h | `../../iqtree2 -s 20_concated.nex -m MF -merit AIC -T 60 -mem 120G -pre 201kplant_c60_init` |
| **1kplant20_p_mf** | 2813 | 128 | -3062819.0380 | 6131264.0759 | -3043739.7501 | 6093105.5003 | 2.78 h | `../../../iqtree2 -s 20_concated.nex -p 20_concated.nex -m MF+MERGE -merit AIC -T 15 -pre 1kplant20_p_mf` |
| 1kplant20_q_mf | 2682 | 163 | -3073743.2670 | 6152850.5340 | -3051188.4558 | 6107740.9117 | 0.50 h | `../../../iqtree2 -s 20_concated.nex -q 20_concated.nex -m MF+MERGE -mrate E,I,G,I+G -merit AIC -T 15 -pre 1kplant20_q_mf` |
| 1kplant20_Q_mf | 10186 | 202 | -3067445.6572 | 6155263.3143 | -3028132.3570 | 6076636.7141 | 1.94 h | `../../../iqtree2 -s 20_concated.nex -Q 20_concated.nex -m MF+MERGE -merit AIC -T 15 -pre 1kplant20_Q_mf` |
| 1kplant20_Q_search | 9407 | 202 | -3067458.3141 | 6153730.6282 | -3028132.3554 | 6075078.7108 | 0.18 h | `../../../iqtree2 -s 20_concated.nex -Q 1kplant20_Q_mf.best_model.nex -t 1kplant20_Q_mf.treefile -T 60 -pre 1kplant20_Q_search` |

## Summary of log file
1. Partition Analysis
- Best partition: Q with AIC: 6076636.7141
- Best partition: p with mAIC: 6131264.0759

2. C60 Initialization
- Selected model: LG+F+R10

3. C60 Running (full mode)
- Best C60: c60_F with AIC: 6072751.7771
- Best overall: C60 (c60_F) with mAIC: 6072751.7771

4. Treesearch Result
- 1kplant20_c60_search with mAIC: 6072505.7534
- 1kplant20_Q_search with mAIC: 6153730.6282

5. Corrected mAIC using correct parameter number:
- 1kplant20_c60_search: 2 * 134 - 2 * -3036215.8767 = 6072699.7534
- 1kplant20_Q_search: 2 * 10186 - 2 * -3067458.3141 = 6155288.6282
