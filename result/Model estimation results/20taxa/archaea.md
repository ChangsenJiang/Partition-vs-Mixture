# Summary of Results for archaea

| Name | Free parameters | Partitions | Mix LogL | mAIC | LogL | AIC | Runtime | Command |
|------|-----------------|------------|-----------|------|------|-----|---------|---------|
| archaea20_c60_unopt | 46 | NA | NA | 1095265.5763 | -547586.7882 | 1095265.5763 | 4.55 h | `../../iqtree2 -s ./20_concated.nex -m LG+C60+I+R5 -te ../partition/Q/archaea20_Q_search.treefile -T 30 -mem 120G -safe -pre archaea20_c60_unopt` |
| 20archaea_c60_init | 65 | NA | NA | 1098411.9403 | -549140.9702 | 1098411.9403 | 5.40 h | `../../iqtree2 -s 20_concated.nex -m MF -merit AIC -T 30 -mem 120G -pre 20archaea_c60_init` |
| **archaea20_c60_F** | 125 | NA | NA | 1082745.3416 | -541247.6708 | 1082745.3416 | 2.27 h | `../../iqtree2 -s ./20_concated.nex -m LG+C60+F+I+R5 -te ../partition/Q/archaea20_Q_search.treefile -T 30 -mem 120G -safe -pre archaea20_c60_F` |
| archaea20_c60_search | 37 | NA | NA | 1082554.7527 | -541240.3763 | 1082554.7527 | 8.00 h | `../../iqtree2 -s 20_concated.nex -mdef archaea20_c60_F_parameter.nex -m LG_C60_F_I_R5 -t ../partition/Q/archaea20_Q_search.treefile -T 30 --mem 120G -pre archaea20_c60_search` |
| archaea20_c60_opt | 105 | NA | NA | 1087888.1606 | -543839.0803 | 1087888.1606 | 2.30 h | `../../iqtree2 -s ./20_concated.nex -m LG+C60+I+R5 -te ../partition/Q/archaea20_Q_search.treefile -mwopt -T 30 -mem 120G -safe -pre archaea20_c60_opt` |
| **archaea20_p_mf** | 717 | 32 | -548397.6703 | 1098229.3406 | -547203.2208 | 1095840.4416 | 1.10 h | `../../../iqtree2 -s 20_concated.nex -p 20_concated.nex -m MF+MERGE -merit AIC -T 7 -pre archaea20_p_mf` |
| archaea20_q_mf | 677 | 40 | -549173.8895 | 1099701.7789 | -548086.5380 | 1097527.0761 | 0.09 h | `../../../iqtree2 -s 20_concated.nex -q 20_concated.nex -m MF+MERGE -mrate E,I,G,I+G -merit AIC -T 7 -pre archaea20_q_mf` |
| archaea20_Q_mf | 2485 | 48 | -548823.3653 | 1102616.7306 | -544027.0113 | 1093024.0227 | 0.88 h | `../../../iqtree2 -s 20_concated.nex -Q 20_concated.nex -m MF+MERGE -merit AIC -T 7 -pre archaea20_Q_mf` |
| archaea20_Q_search | 2302 | 48 | -548789.1863 | 1102182.3726 | -543967.4022 | 1092538.8044 | 0.13 h | `../../../iqtree2 -s 20_concated.nex -Q archaea20_Q_mf.best_model.nex -t archaea20_Q_mf.treefile -T 30 -pre archaea20_Q_search` |

## Summary of log file
1. Partition Analysis
- Best partition: Q with AIC: 1093024.0227
- Best partition: p with mAIC: 1098229.3406

2. C60 Initialization
- Selected model: LG+F+I+R5

3. C60 Running (full mode)
- Best C60: c60_F with AIC: 1082745.3416
- Best overall: C60 (c60_F) with AIC: 1082745.3416

4. Treesearch Result
- archaea20_c60_search with mAIC: 1082554.7527
- archaea20_Q_search with mAIC: 1102182.3726

5. Corrected mAIC using correct parameter number:
- archaea20_c60_search: 2 * 125 - 2 * -541240.3763 = 1082730.7526
- archaea20_Q_search: 2 * 2485 - 2 * -548789.1863 = 1102548.3726
