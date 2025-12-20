# Summary of Results for 1kplant

| Name | Free parameters | Partitions | Mix LogL | mAIC | LogL | AIC | BIC | Runtime | Command |
|------|-----------------|------------|-----------|------|------|-----|-----|---------|---------|
| 1kplant5_c60_opt | 71 | NA | NA | 2032260.4197 | -1016059.2098 | 2032260.4197 | 2032965.9980 | 0.11 h | `../../iqtree2 -s ./5_concated.nex -m LG+C60+I+R3 -te ../partition/Q/1kplant5_Q_search.treefile -mwopt -T 30 -mem 120G -safe -pre 1kplant5_c60_opt` |
| 1kplant5_c60_search | 7 | NA | NA | 2025821.0912 | -1012903.5456 | 2025821.0912 | 2025890.6553 | 1.00 h | `../../iqtree2 -s 5_concated.nex -mdef 1kplant5_c60_F_parameter.nex -m LG_C60_F_I_R3 -t ../partition/Q/1kplant5_Q_search.treefile -bb 1000 --wbtl -T 30 --mem 120G -pre 1kplant5_c60_search` |
| **1kplant5_c60_F** | 91 | NA | NA | 2025987.7745 | -1012902.8873 | 2025987.7745 | 2026892.1073 | 0.41 h | `../../iqtree2 -s ./5_concated.nex -m LG+C60+F+I+R3 -te ../partition/Q/1kplant5_Q_search.treefile -T 30 -mem 120G -safe -pre 1kplant5_c60_F` |
| 1kplant5_c60_unopt | 12 | NA | NA | 2049413.3685 | -1024694.6842 | 2049413.3685 | 2049532.6211 | 0.12 h | `../../iqtree2 -s ./5_concated.nex -m LG+C60+I+R3 -te ../partition/Q/1kplant5_Q_search.treefile -T 30 -mem 120G -safe -pre 1kplant5_c60_unopt` |
| 51kplant_c60_init | 31 | NA | NA | 2028360.0074 | -1014149.0037 | 2028360.0074 | 2028668.0768 | 1.04 h | `../../iqtree2 -s 5_concated.nex -m MF -merit AIC -T 30 -mem 120G -pre 51kplant_c60_init` |
| **1kplant5_p_mf** | 2511 | 128 | -1015889.6912 | 2036801.3825 | -1000641.6369 | 2006305.2737 | 2031258.8949 | 0.42 h | `../../../iqtree2 -s 5_concated.nex -p 5_concated.nex -m MF+MERGE -merit AIC -T 7 -pre 1kplant5_p_mf` |
| 1kplant5_p_search | 2319 | 128 | -1015851.4753 | 2036340.9507 | -1000641.6340 | 2005921.2679 | 2028966.8464 | 0.03 h | `../../../iqtree2 -s 5_concated.nex -p 1kplant5_p_mf.best_model.nex -t 1kplant5_p_mf.treefile -bb 1000 --wbtl -T 30 -pre 1kplant5_p_search` |
| 1kplant5_q_mf | 2733 | 160 | -1029277.6010 | 2064021.2019 | -1002676.3720 | 2010818.7441 | 2037978.5397 | 0.23 h | `../../../iqtree2 -s 5_concated.nex -q 5_concated.nex -m MF+MERGE -mrate E,I,G,I+G -merit AIC -T 7 -pre 1kplant5_q_mf` |
| 1kplant5_Q_mf | 3583 | 151 | -1016520.4341 | 2040206.8682 | -998421.4830 | 2004008.9659 | 2039615.8256 | 0.34 h | `../../../iqtree2 -s 5_concated.nex -Q 5_concated.nex -m MF+MERGE -merit AIC -T 7 -pre 1kplant5_Q_mf` |
| 1kplant5_Q_search | 3370 | 151 | -1016678.7803 | 2040097.5606 | -998421.4857 | 2003582.9714 | 2037073.0962 | 0.03 h | `../../../iqtree2 -s 5_concated.nex -Q 1kplant5_Q_mf.best_model.nex -t 1kplant5_Q_mf.treefile -bb 1000 --wbtl -T 30 -pre 1kplant5_Q_search` |

## Summary of log file
1. Partition Analysis
- Best partition: Q with AIC: 2004008.9659
- Best partition: p with mAIC: 2036801.3825

2. C60 Initialization
- Selected model: LG+F+I+R3

3. C60 Running (full mode)
- Best C60: c60_F with AIC: 2025987.7745
- Best overall: C60 (c60_F) with AIC: 2025987.7745

4. Treesearch Result
- 1kplant5_c60_search with mAIC: 2025821.0912
- 1kplant5_p_search with mAIC: 2036340.9507
- 1kplant5_Q_search with mAIC: 2040097.5606

5. Corrected mAIC using correct parameter number:
- 1kplant5_c60_search: 2 * 91 - 2 * -1012903.5456 = 2025989.0912
- 1kplant5_p_search: 2 * 2511 - 2 * -1015851.4753 = 2036724.95
- 1kplant5_Q_search: 2 * 3583 - 2 * -1016678.7803 = 2040523.56
