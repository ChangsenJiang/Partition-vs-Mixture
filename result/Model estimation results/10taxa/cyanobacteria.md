# Summary of Results for cyanobacteria

| Name | Free parameters | Partitions | Mix LogL | mAIC | LogL | AIC | BIC | Runtime | Command |
|------|-----------------|------------|-----------|------|------|-----|-----|---------|---------|
| cyanobacteria10_c60_unopt | 27 | NA | NA | 2484687.4477 | -1242316.7239 | 2484687.4477 | 2484949.3952 | 1.88 h | `../../iqtree2 -s ./10_concated.nex -m LG+C60+R6 -te ../partition/Q/cyanobacteria10_Q_search.treefile -T 40 -mem 120G -safe -pre cyanobacteria10_c60_unopt` |
| cyanobacteria10_c60_opt | 86 | NA | NA | 2474779.9461 | -1237303.9731 | 2474779.9461 | 2475614.2974 | 2.39 h | `../../iqtree2 -s ./10_concated.nex -m LG+C60+R6 -te ../partition/Q/cyanobacteria10_Q_search.treefile -mwopt -T 40 -mem 120G -safe -pre cyanobacteria10_c60_opt` |
| 10cyanobacteria_c60_init | 46 | NA | NA | 2501857.3336 | -1250882.6668 | 2501857.3336 | 2502303.6145 | 1.08 h | `../../iqtree2 -s 10_concated.nex -m MF -merit AIC -T 40 -mem 120G -pre 10cyanobacteria_c60_init` |
| **cyanobacteria10_c60_F** | 106 | NA | NA | 2471866.6606 | -1235827.3303 | 2471866.6606 | 2472895.0470 | 4.28 h | `../../iqtree2 -s ./10_concated.nex -m LG+C60+F+R6 -te ../partition/Q/cyanobacteria10_Q_search.treefile -T 40 -mem 120G -safe -pre cyanobacteria10_c60_F` |
| cyanobacteria10_c60_search | 17 | NA | NA | 2471625.6046 | -1235795.8023 | 2471625.6046 | 2471790.5345 | 2.45 h | `../../iqtree2 -s 10_concated.nex -mdef cyanobacteria10_c60_F_parameter.nex -m LG_C60_F_R6 -t ../partition/Q/cyanobacteria10_Q_search.treefile -bb 1000 --wbtl -T 40 --mem 120G -pre cyanobacteria10_c60_search` |
| cyanobacteria10_p_search | 1499 | 96 | -1247936.8487 | 2498871.6974 | -1238905.9475 | 2480809.8949 | 2495352.8318 | 0.06 h | `../../../iqtree2 -s 10_concated.nex -p cyanobacteria10_p_mf.best_model.nex -t cyanobacteria10_p_mf.treefile -bb 1000 --wbtl -T 40 -pre cyanobacteria10_p_search` |
| **cyanobacteria10_p_mf** | 1785 | 96 | -1247936.7632 | 2499443.5265 | -1238905.9469 | 2481381.8938 | 2498699.5338 | 0.47 h | `../../../iqtree2 -s 10_concated.nex -p 10_concated.nex -m MF+MERGE -merit AIC -T 10 -pre cyanobacteria10_p_mf` |
| cyanobacteria10_q_mf | 1801 | 128 | -1261587.7343 | 2526777.4687 | -1243240.0377 | 2490082.0755 | 2507554.9436 | 0.33 h | `../../../iqtree2 -s 10_concated.nex -q 10_concated.nex -m MF+MERGE -mrate E,I,G,I+G -merit AIC -T 10 -pre cyanobacteria10_q_mf` |
| cyanobacteria10_Q_mf | 4573 | 146 | -1249660.4248 | 2508466.8497 | -1230827.7289 | 2470801.4579 | 2515167.6022 | 0.42 h | `../../../iqtree2 -s 10_concated.nex -Q 10_concated.nex -m MF+MERGE -merit AIC -T 10 -pre cyanobacteria10_Q_mf` |
| cyanobacteria10_Q_search | 4188 | 146 | -1249659.9970 | 2507695.9939 | -1230827.7208 | 2470031.4416 | 2510662.4088 | 0.04 h | `../../../iqtree2 -s 10_concated.nex -Q cyanobacteria10_Q_mf.best_model.nex -t cyanobacteria10_Q_mf.treefile -bb 1000 --wbtl -T 40 -pre cyanobacteria10_Q_search` |

## Summary of log file
1. Partition Analysis
- Best partition: Q with AIC: 2470801.4579
- Best partition: p with mAIC: 2499443.5265

2. C60 Initialization
- Selected model: LG+F+R6

3. C60 Running (full mode)
- Best C60: c60_F with AIC: 2471866.6606
- Best overall: C60 (c60_F) with AIC: 2471866.6606

4. Treesearch Result
- cyanobacteria10_c60_search with mAIC: 2471625.6046
- cyanobacteria10_p_search with mAIC: 2498871.6974
- cyanobacteria10_Q_search with mAIC: 2507695.9939

5. Corrected mAIC using correct parameter number:
- cyanobacteria10_c60_search: 2 * 106 - 2 * -1235795.8023 = 2471803.6046
- cyanobacteria10_p_search: 2 * 1785 - 2 * -1247936.8487 = 2499443.70
- cyanobacteria10_Q_search: 2 * 4573 - 2 * -1249659.997 = 2508465.99
