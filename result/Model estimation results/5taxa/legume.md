# Summary of Results for legume

| Name | Free parameters | Partitions | Mix LogL | mAIC | LogL | AIC | BIC | Runtime | Command |
|------|-----------------|------------|-----------|------|------|-----|-----|---------|---------|
| 5legume_c60_init | 31 | NA | NA | 1280986.5077 | -640462.2538 | 1280986.5077 | 1281286.2041 | 0.88 h | `../../iqtree2 -s 5_concated.nex -m MF -merit AIC -T 21 -mem 120G -pre 5legume_c60_init` |
| legume5_c60_unopt | 12 | NA | NA | 1286958.8186 | -643467.4093 | 1286958.8186 | 1287074.8301 | 2.48 h | `../../iqtree2 -s ./5_concated.nex -m Q.PLANT+C60+I+R3 -te ../partition/Q/legume5_Q_search.treefile -T 21 -mem 120G -safe -pre legume5_c60_unopt` |
| **legume5_c60_F** | 91 | NA | NA | 1280212.2528 | -640015.1264 | 1280212.2528 | 1281092.0069 | 0.05 h | `../../iqtree2 -s ./5_concated.nex -m Q.PLANT+C60+F+I+R3 -te ../partition/Q/legume5_Q_search.treefile -T 21 -mem 120G -safe -pre legume5_c60_F` |
| legume5_c60_search | 7 | NA | NA | 1280051.1182 | -640018.5591 | 1280051.1182 | 1280118.7916 | 0.66 h | `../../iqtree2 -s 5_concated.nex -mdef legume5_c60_F_parameter.nex -m Q_PLANT_C60_F_I_R3 -t ../partition/Q/legume5_Q_search.treefile -bb 1000 --wbtl -T 21 --mem 120G -pre legume5_c60_search` |
| legume5_c60_opt | 71 | NA | NA | 1282433.1995 | -641145.5997 | 1282433.1995 | 1283119.6010 | 0.07 h | `../../iqtree2 -s ./5_concated.nex -m Q.PLANT+C60+I+R3 -te ../partition/Q/legume5_Q_search.treefile -mwopt -T 21 -mem 120G -safe -pre legume5_c60_opt` |
| legume5_p_search | 1466 | 92 | -642494.4072 | 1287920.8144 | -634997.0522 | 1272926.1044 | 1287098.8462 | 0.02 h | `../../../iqtree2 -s 5_concated.nex -p legume5_p_mf.best_model.nex -t legume5_p_mf.treefile -bb 1000 --wbtl -T 21 -pre legume5_p_search` |
| **legume5_p_mf** | 1580 | 92 | -642470.0127 | 1288100.0254 | -634997.0526 | 1273154.1053 | 1288428.9566 | 0.56 h | `../../../iqtree2 -s 5_concated.nex -p 5_concated.nex -m MF+MERGE -merit AIC -T 5 -pre legume5_p_mf` |
| legume5_q_mf | 1653 | 120 | -682162.6132 | 1367631.2264 | -636439.8797 | 1276185.7594 | 1292166.3476 | 0.22 h | `../../../iqtree2 -s 5_concated.nex -q 5_concated.nex -m MF+MERGE -mrate E,I,G,I+G -merit AIC -T 5 -pre legume5_q_mf` |
| legume5_Q_mf | 2193 | 105 | -643448.3987 | 1291282.7974 | -634236.4030 | 1272858.8060 | 1294059.9129 | 0.44 h | `../../../iqtree2 -s 5_concated.nex -Q 5_concated.nex -m MF+MERGE -merit AIC -T 5 -pre legume5_Q_mf` |
| legume5_Q_search | 2053 | 105 | -643572.3778 | 1291250.7556 | -634236.4019 | 1272578.8038 | 1292426.4429 | 0.02 h | `../../../iqtree2 -s 5_concated.nex -Q legume5_Q_mf.best_model.nex -t legume5_Q_mf.treefile -bb 1000 --wbtl -T 21 -pre legume5_Q_search` |

## Summary of log file
1. Partition Analysis
- Best partition: Q with AIC: 1272858.8060
- Best partition: p with mAIC: 1288100.0254

2. C60 Initialization
- Selected model: Q.PLANT+F+I+R3

3. C60 Running (full mode)
- Best C60: c60_F with AIC: 1280212.2528
- Best overall: C60 (c60_F) with AIC: 1280212.2528

4. Treesearch Result
- legume5_c60_search with mAIC: 1280051.1182
- legume5_p_search with mAIC: 1287920.8144
- legume5_Q_search with mAIC: 1291250.7556

5. Corrected mAIC using correct parameter number:
- legume5_c60_search: 2 * 91 - 2 * -640018.5591 = 1280219.1182
- legume5_p_search: 2 * 1580 - 2 * -642494.4072 = 1288148.81
- legume5_Q_search: 2 * 2193 - 2 * -643572.3778 = 1291530.76
