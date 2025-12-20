# Summary of Results for Sacfungi

| Name | Free parameters | Partitions | Mix LogL | mAIC | LogL | AIC | BIC | Runtime | Command |
|------|-----------------|------------|-----------|------|------|-----|-----|---------|---------|
| Sacfungi5_c60_unopt | 9 | NA | NA | 4643485.7018 | -2321733.8509 | 4643485.7018 | 4643580.2683 | 0.45 h | `../../iqtree2 -s ./5_concated.nex -m LG+C60+I+G4 -te ../partition/Q/Sacfungi5_Q_search.treefile -T 21 -mem 120G -safe -pre Sacfungi5_c60_unopt` |
| **Sacfungi5_c60_F** | 88 | NA | NA | 4597792.3169 | -2298808.1585 | 4597792.3169 | 4598716.9674 | 0.96 h | `../../iqtree2 -s ./5_concated.nex -m LG+C60+F+I+G4 -te ../partition/Q/Sacfungi5_Q_search.treefile -T 21 -mem 120G -safe -pre Sacfungi5_c60_F` |
| Sacfungi5_c60_opt | 68 | NA | NA | 4610768.7444 | -2305316.3722 | 4610768.7444 | 4611483.2470 | 0.26 h | `../../iqtree2 -s ./5_concated.nex -m LG+C60+I+G4 -te ../partition/Q/Sacfungi5_Q_search.treefile -mwopt -T 21 -mem 120G -safe -pre Sacfungi5_c60_opt` |
| 5Sacfungi_c60_init | 28 | NA | NA | 4603275.4840 | -2301609.7420 | 4603275.4840 | 4603569.6910 | 4.65 h | `../../iqtree2 -s 5_concated.nex -m MF -merit AIC -T 21 -mem 120G -pre 5Sacfungi_c60_init` |
| Sacfungi5_c60_search | 7 | NA | NA | 4597538.5729 | -2298762.2864 | 4597538.5729 | 4597612.1246 | 1.16 h | `../../iqtree2 -s 5_concated.nex -mdef Sacfungi5_c60_F_parameter.nex -m LG_C60_F_I_G4 -t ../partition/Q/Sacfungi5_Q_search.treefile -bb 1000 --wbtl -T 21 --mem 120G -pre Sacfungi5_c60_search` |
| **Sacfungi5_p_mf** | 3572 | 182 | -2304381.5061 | 4615907.0123 | -2270554.8680 | 4548253.7361 | 4585786.1379 | 1.04 h | `../../../iqtree2 -s 5_concated.nex -p 5_concated.nex -m MF+MERGE -merit AIC -T 5 -pre Sacfungi5_p_mf` |
| Sacfungi5_p_search | 3266 | 182 | -2304359.5908 | 4615251.1816 | -2270551.6934 | 4547635.3868 | 4581952.5268 | 0.05 h | `../../../iqtree2 -s 5_concated.nex -p Sacfungi5_p_mf.best_model.nex -t Sacfungi5_p_mf.treefile -bb 1000 --wbtl -T 21 -pre Sacfungi5_p_search` |
| Sacfungi5_q_mf | 3645 | 206 | -2314350.4121 | 4635990.8242 | -2277886.2665 | 4563062.5330 | 4601361.9744 | 0.70 h | `../../../iqtree2 -s 5_concated.nex -q 5_concated.nex -m MF+MERGE -mrate E,I,G,I+G -merit AIC -T 5 -pre Sacfungi5_q_mf` |
| Sacfungi5_Q_mf | 5452 | 228 | -2303508.9488 | 4617921.8977 | -2265088.9458 | 4541081.8915 | 4598368.1890 | 0.90 h | `../../../iqtree2 -s 5_concated.nex -Q 5_concated.nex -m MF+MERGE -merit AIC -T 5 -pre Sacfungi5_Q_mf` |
| Sacfungi5_Q_search | 5067 | 228 | -2303456.9361 | 4617047.8722 | -2265088.9468 | 4540311.8936 | 4593552.8454 | 0.04 h | `../../../iqtree2 -s 5_concated.nex -Q Sacfungi5_Q_mf.best_model.nex -t Sacfungi5_Q_mf.treefile -bb 1000 --wbtl -T 21 -pre Sacfungi5_Q_search` |

## Summary of log file
1. Partition Analysis
- Best partition: Q with AIC: 4541081.8915
- Best partition: p with mAIC: 4615907.0123

2. C60 Initialization
- Selected model: LG+F+I+G4

3. C60 Running (full mode)
- Best C60: c60_F with AIC: 4597792.3169
- Best overall: C60 (c60_F) with AIC: 4597792.3169

4. Treesearch Result
- Sacfungi5_c60_search with mAIC: 4597538.5729
- Sacfungi5_p_search with mAIC: 4615251.1816
- Sacfungi5_Q_search with mAIC: 4617047.8722

5. Corrected mAIC using correct parameter number:
- Sacfungi5_c60_search: 2 * 88 - 2 * -2298762.2864 = 4597700.5728
- Sacfungi5_p_search: 2 * 3572 - 2 * -2304359.5908 = 4615863.18
- Sacfungi5_Q_search: 2 * 5452 - 2 * -2303456.9361 = 4617817.87
