# Summary of Results for Legume

| Name | Free parameters | Partitions | Mix LogL | mAIC | LogL | AIC | Runtime | Command |
|------|-----------------|------------|-----------|------|------|-----|---------|---------|
| **Legume20_c60_F** | 124 | NA | NA | 2957984.6724 | -1478868.3362 | 2957984.6724 | 5.05 h | `../../iqtree2 -s ./20_concated.nex -m Q.PLANT+C60+F+R5 -te ../partition/Q/Legume20_Q_search.treefile -T 60 -mem 120G -safe -pre Legume20_c60_F` |
| Legume20_c60_unopt | 45 | NA | NA | 2974108.7425 | -1487009.3712 | 2974108.7425 | 3.74 h | `../../iqtree2 -s ./20_concated.nex -m Q.PLANT+C60+R5 -te ../partition/Q/Legume20_Q_search.treefile -T 60 -mem 120G -safe -pre Legume20_c60_unopt` |
| 20Legume_c60_init | 45 | NA | NA | 3004439.2394 | -1502174.6197 | 3004439.2394 | 1.49 h | `../../iqtree2 -s 20_concated.nex -m MF -merit AIC -T 60 -mem 120G -pre 20Legume_c60_init` |
| Legume20_c60_search | 37 | NA | NA | 2957773.7802 | -1478849.8901 | 2957773.7802 | 8.28 h | `../../iqtree2 -s 20_concated.nex -mdef Legume20_c60_F_parameter.nex -m Q_PLANT_C60_F_R5 -t ../partition/Q/Legume20_Q_search.treefile -T 60 --mem 120G -pre Legume20_c60_search` |
| Legume20_c60_opt | 104 | NA | NA | 2963099.8606 | -1481445.9303 | 2963099.8606 | 5.11 h | `../../iqtree2 -s ./20_concated.nex -m Q.PLANT+C60+R5 -te ../partition/Q/Legume20_Q_search.treefile -mwopt -T 60 -mem 120G -safe -pre Legume20_c60_opt` |
| **Legume20_p_mf** | 1266 | 99 | -1504773.5315 | 3012079.0629 | -1496012.4865 | 2994556.9729 | 1.01 h | `../../../iqtree2 -s 20_concated.nex -p 20_concated.nex -m MF+MERGE -merit AIC -T 15 -pre Legume20_p_mf` |
| Legume20_q_mf | 1165 | 171 | -1520030.3337 | 3042390.6674 | -1500160.6755 | 3002651.3511 | 0.33 h | `../../../iqtree2 -s 20_concated.nex -q 20_concated.nex -m MF+MERGE -mrate E,I,G,I+G -merit AIC -T 15 -pre Legume20_q_mf` |
| Legume20_Q_mf | 5174 | 116 | -1507327.9698 | 3025003.9396 | -1490798.8190 | 2991945.6379 | 0.96 h | `../../../iqtree2 -s 20_concated.nex -Q 20_concated.nex -m MF+MERGE -merit AIC -T 15 -pre Legume20_Q_mf` |
| Legume20_Q_search | 4637 | 116 | -1507331.9176 | 3023937.8352 | -1490798.8096 | 2990871.6192 | 0.10 h | `../../../iqtree2 -s 20_concated.nex -Q Legume20_Q_mf.best_model.nex -t Legume20_Q_mf.treefile -T 60 -pre Legume20_Q_search` |

## Summary of log file
1. Partition Analysis
- Best partition: Q with AIC: 2991945.6379
- Best partition: p with mAIC: 3012079.0629

2. C60 Initialization
- Selected model: Q.PLANT+R5

3. C60 Running (full mode)
- Best C60: c60_F with AIC: 2957984.6724
- Best overall: C60 (c60_F) with AIC: 2957984.6724

4. Treesearch Result
- Legume20_c60_search with mAIC: 2957773.7802
- Legume20_Q_search with mAIC: 3023937.8352

5. Corrected mAIC using correct parameter number:
- Legume20_c60_search: 2 * 124 - 2 * -1478849.8901 = 2957947.7802
- Legume20_Q_search: 2 * 5174 - 2 * -1507331.9176 = 3025011.8352
