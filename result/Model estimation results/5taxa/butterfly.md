# Summary of Results for butterfly

| Name | Free parameters | Partitions | Mix LogL | mAIC | LogL | AIC | BIC | Runtime | Command |
|------|-----------------|------------|-----------|------|------|-----|-----|---------|---------|
| **butterfly5_c60_F** | 93 | NA | NA | 1688055.6590 | -843934.8295 | 1688055.6590 | 1688975.6823 | 0.68 h | `../../iqtree2 -s ./5_concated.nex -m LG+C60+F+I+R4 -te ../partition/Q/butterfly5_Q_search.treefile -T 30 -mem 120G -safe -pre butterfly5_c60_F` |
| butterfly5_c60_unopt | 14 | NA | NA | 1700827.5160 | -850399.7580 | 1700827.5160 | 1700966.0141 | 1.65 h | `../../iqtree2 -s ./5_concated.nex -m LG+C60+I+R4 -te ../partition/Q/butterfly5_Q_search.treefile -T 30 -mem 120G -safe -pre butterfly5_c60_unopt` |
| butterfly5_c60_search | 7 | NA | NA | 1687890.7682 | -843938.3841 | 1687890.7682 | 1687960.0173 | 0.80 h | `../../iqtree2 -s 5_concated.nex -mdef butterfly5_c60_F_parameter.nex -m LG_C60_F_I_R4 -t ../partition/Q/butterfly5_Q_search.treefile -bb 1000 --wbtl -T 30 --mem 120G -pre butterfly5_c60_search` |
| 5butterfly_c60_init | 33 | NA | NA | 1689743.3499 | -844838.6749 | 1689743.3499 | 1690069.8098 | 1.57 h | `../../iqtree2 -s 5_concated.nex -m MF -merit AIC -T 30 -mem 120G -pre 5butterfly_c60_init` |
| butterfly5_c60_opt | 73 | NA | NA | 1691543.0989 | -845698.5495 | 1691543.0989 | 1692265.2678 | 0.10 h | `../../iqtree2 -s ./5_concated.nex -m LG+C60+I+R4 -te ../partition/Q/butterfly5_Q_search.treefile -mwopt -T 30 -mem 120G -safe -pre butterfly5_c60_opt` |
| **butterfly5_p_mf** | 2238 | 121 | -844817.8495 | 1694111.6991 | -830103.8610 | 1664683.7219 | 1686823.6382 | 1.07 h | `../../../iqtree2 -s 5_concated.nex -p 5_concated.nex -m MF+MERGE -merit AIC -T 7 -pre butterfly5_p_mf` |
| butterfly5_p_search | 2084 | 121 | -844861.1459 | 1693890.2918 | -830103.8623 | 1664375.7247 | 1684992.1614 | 0.07 h | `../../../iqtree2 -s 5_concated.nex -p butterfly5_p_mf.best_model.nex -t butterfly5_p_mf.treefile -bb 1000 --wbtl -T 30 -pre butterfly5_p_search` |
| butterfly5_q_mf | 2205 | 145 | -854077.1628 | 1712564.3255 | -833871.5811 | 1672153.1622 | 1693966.6186 | 0.91 h | `../../../iqtree2 -s 5_concated.nex -q 5_concated.nex -m MF+MERGE -mrate E,I,G,I+G -merit AIC -T 7 -pre butterfly5_q_mf` |
| butterfly5_Q_mf | 3569 | 164 | -846751.7010 | 1700641.4020 | -826531.9331 | 1660201.8663 | 1695508.9982 | 1.11 h | `../../../iqtree2 -s 5_concated.nex -Q 5_concated.nex -m MF+MERGE -merit AIC -T 7 -pre butterfly5_Q_mf` |
| butterfly5_Q_search | 3366 | 164 | -846768.3665 | 1700268.7330 | -826531.9355 | 1659795.8710 | 1693094.7799 | 0.03 h | `../../../iqtree2 -s 5_concated.nex -Q butterfly5_Q_mf.best_model.nex -t butterfly5_Q_mf.treefile -bb 1000 --wbtl -T 30 -pre butterfly5_Q_search` |

## Summary of log file
1. Partition Analysis
- Best partition: Q with AIC: 1660201.8663
- Best partition: p with mAIC: 1694111.6991

2. C60 Initialization
- Selected model: LG+F+I+R4

3. C60 Running (full mode)
- Best C60: c60_F with AIC: 1688055.6590
- Best overall: C60 (c60_F) with AIC: 1688055.6590

4. Treesearch Result
- butterfly5_c60_search with mAIC: 1687890.7682
- butterfly5_p_search with mAIC: 1693890.2918
- butterfly5_Q_search with mAIC: 1700268.7330

5. Corrected mAIC using correct parameter number:
- butterfly5_c60_search: 2 * 93 - 2 * -843938.3841 = 1688062.7682
- butterfly5_p_search: 2 * 2238 - 2 * -844861.1459 = 1694198.29
- butterfly5_Q_search: 2 * 3569 - 2 * -846768.3665 = 1700674.73
