# Summary of Results for bird

| Name | Free parameters | Partitions | Mix LogL | mAIC | LogL | AIC | BIC | Runtime | Command |
|------|-----------------|------------|-----------|------|------|-----|-----|---------|---------|
| 10bird_c60_init | 29 | NA | NA | 2217413.6355 | -1108677.8178 | 2217413.6355 | 2217717.9701 | 0.31 h | `../../iqtree2 -s 10_concated.nex -m MF -merit AIC -T 45 -mem 120G -pre 10bird_c60_init` |
| bird10_c60_opt | 88 | NA | NA | 2218665.9708 | -1109244.9854 | 2218665.9708 | 2219589.4688 | 2.48 h | `../../iqtree2 -s ./10_concated.nex -m Q.BIRD+C60+R7 -te ../partition/Q/bird10_Q_search.treefile -mwopt -T 45 -mem 120G -safe -pre bird10_c60_opt` |
| **bird10_c60_F** | 108 | NA | NA | 2213637.8695 | -1106710.9347 | 2213637.8695 | 2214771.2534 | 3.43 h | `../../iqtree2 -s ./10_concated.nex -m Q.BIRD+C60+F+R7 -te ../partition/Q/bird10_Q_search.treefile -T 45 -mem 120G -safe -pre bird10_c60_F` |
| bird10_c60_unopt | 29 | NA | NA | 2241243.0519 | -1120592.5260 | 2241243.0519 | 2241547.3865 | 1.67 h | `../../iqtree2 -s ./10_concated.nex -m Q.BIRD+C60+R7 -te ../partition/Q/bird10_Q_search.treefile -T 45 -mem 120G -safe -pre bird10_c60_unopt` |
| bird10_c60_search | 17 | NA | NA | 2213460.2870 | -1106713.1435 | 2213460.2870 | 2213638.6901 | 2.55 h | `../../iqtree2 -s 10_concated.nex -mdef bird10_c60_F_parameter.nex -m Q_BIRD_C60_F_R7 -t ../partition/Q/bird10_Q_search.treefile -bb 1000 --wbtl -T 45 --mem 120G -pre bird10_c60_search` |
| **bird10_p_mf** | 3122 | 164 | -1122000.0630 | 2250244.1260 | -1083285.3706 | 2172814.7412 | 2205577.9328 | 0.32 h | `../../../iqtree2 -s 10_concated.nex -p 10_concated.nex -m MF+MERGE -merit AIC -T 11 -pre bird10_p_mf` |
| bird10_p_search | 2897 | 164 | -1122030.1763 | 2249854.3527 | -1083285.3698 | 2172364.7396 | 2202766.7146 | 0.04 h | `../../../iqtree2 -s 10_concated.nex -p bird10_p_mf.best_model.nex -t bird10_p_mf.treefile -bb 1000 --wbtl -T 45 -pre bird10_p_search` |
| bird10_q_mf | 3325 | 208 | -1171735.8787 | 2350121.7573 | -1092103.4070 | 2190856.8139 | 2225750.3475 | 0.27 h | `../../../iqtree2 -s 10_concated.nex -q 10_concated.nex -m MF+MERGE -mrate E,I,G,I+G -merit AIC -T 11 -pre bird10_q_mf` |
| bird10_Q_search | 5312 | 173 | -1126237.5207 | 2263099.0414 | -1079370.1457 | 2169364.2913 | 2225109.9907 | 0.03 h | `../../../iqtree2 -s 10_concated.nex -Q bird10_Q_mf.best_model.nex -t bird10_Q_mf.treefile -bb 1000 --wbtl -T 45 -pre bird10_Q_search` |
| bird10_Q_mf | 5553 | 173 | -1126229.1905 | 2263564.3809 | -1079370.1646 | 2169846.3292 | 2228121.1539 | 0.29 h | `../../../iqtree2 -s 10_concated.nex -Q 10_concated.nex -m MF+MERGE -merit AIC -T 11 -pre bird10_Q_mf` |

## Summary of log file
1. Partition Analysis
- Best partition: Q with AIC: 2169846.3292
- Best partition: p with mAIC: 2250244.1260

2. C60 Initialization
- Selected model: Q.BIRD+R7

3. C60 Running (full mode)
- Best C60: c60_F with AIC: 2213637.8695
- Best overall: C60 (c60_F) with AIC: 2213637.8695

4. Treesearch Result
- bird10_c60_search with mAIC: 2213460.2870
- bird10_p_search with mAIC: 2249854.3527
- bird10_Q_search with mAIC: 2263099.0414

5. Corrected mAIC using correct parameter number:
- bird10_c60_search: 2 * 108 - 2 * -1106713.1435 = 2213642.287
- bird10_p_search: 2 * 3122 - 2 * -1122030.1763 = 2250304.35
- bird10_Q_search: 2 * 5553 - 2 * -1126237.5207 = 2263581.04
