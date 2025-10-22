# Summary of Results for archaea

| Name | Free parameters | Partitions | Mix LogL | mAIC | LogL | AIC | BIC | Runtime | Command |
|------|-----------------|------------|-----------|------|------|-----|-----|---------|---------|
| archaea5_c60_unopt | 9 | NA | NA | 318463.5542 | -159222.7771 | 318463.5542 | 318533.3235 | 0.01 h | `../../iqtree2 -s ./5_concated.nex -m LG+C60+I+G4 -te ../partition/Q/archaea5_Q_search.treefile -T 30 -mem 120G -safe -pre archaea5_c60_unopt` |
| archaea5_c60_search | 7 | NA | NA | 312576.1880 | -156281.0940 | 312576.1880 | 312630.4530 | 0.15 h | `../../iqtree2 -s 5_concated.nex -mdef archaea5_c60_F_parameter.nex -m LG_C60_F_I_G4 -t ../partition/Q/archaea5_Q_search.treefile -bb 1000 --wbtl -T 30 --mem 120G -pre archaea5_c60_search` |
| archaea5_c60_opt | 68 | NA | NA | 315041.4292 | -157452.7146 | 315041.4292 | 315568.5748 | 0.06 h | `../../iqtree2 -s ./5_concated.nex -m LG+C60+I+G4 -te ../partition/Q/archaea5_Q_search.treefile -mwopt -T 30 -mem 120G -safe -pre archaea5_c60_opt` |
| **archaea5_c60_F** | 88 | NA | NA | 312735.3558 | -156279.6779 | 312735.3558 | 313417.5442 | 0.10 h | `../../iqtree2 -s ./5_concated.nex -m LG+C60+F+I+G4 -te ../partition/Q/archaea5_Q_search.treefile -T 30 -mem 120G -safe -pre archaea5_c60_F` |
| 5archaea_c60_init | 28 | NA | NA | 312942.6373 | -156443.3186 | 312942.6373 | 313159.6972 | 0.17 h | `../../iqtree2 -s 5_concated.nex -m MF -merit AIC -T 30 -mem 120G -pre 5archaea_c60_init` |
| **archaea5_p_mf** | 510 | 27 | -156441.7476 | 313903.4952 | -155243.4138 | 311506.8276 | 315460.4196 | 0.10 h | `../../../iqtree2 -s 5_concated.nex -p 5_concated.nex -m MF+MERGE -merit AIC -T 7 -pre archaea5_p_mf` |
| archaea5_p_search | 470 | 27 | -156444.1694 | 313828.3388 | -155243.4120 | 311426.8240 | 315070.3304 | 0.01 h | `../../../iqtree2 -s 5_concated.nex -p archaea5_p_mf.best_model.nex -t archaea5_p_mf.treefile -bb 1000 --wbtl -T 30 -pre archaea5_p_search` |
| archaea5_q_mf | 535 | 31 | -157780.3583 | 316630.7166 | -155446.9816 | 311963.9632 | 316111.3588 | 0.03 h | `../../../iqtree2 -s 5_concated.nex -q 5_concated.nex -m MF+MERGE -mrate E,I,G,I+G -merit AIC -T 7 -pre archaea5_q_mf` |
| archaea5_Q_mf | 695 | 27 | -156468.8733 | 314327.7466 | -154993.4220 | 311376.8440 | 316764.5822 | 0.10 h | `../../../iqtree2 -s 5_concated.nex -Q 5_concated.nex -m MF+MERGE -merit AIC -T 7 -pre archaea5_Q_mf` |
| archaea5_Q_search | 657 | 27 | -156468.4123 | 314250.8247 | -154993.4220 | 311300.8440 | 316394.0008 | 0.00 h | `../../../iqtree2 -s 5_concated.nex -Q archaea5_Q_mf.best_model.nex -t archaea5_Q_mf.treefile -bb 1000 --wbtl -T 30 -pre archaea5_Q_search` |

## Summary of log file
1. Partition Analysis
- Best partition: Q with AIC: 311376.8440
- Best partition: p with mAIC: 313903.4952

2. C60 Initialization
- Selected model: LG+F+I+G4

3. C60 Running (full mode)
- Best C60: c60_F with AIC: 312735.3558
- Best overall: C60 (c60_F) with AIC: 312735.3558

4. Treesearch Result
- archaea5_c60_search with mAIC: 312576.1880
- archaea5_p_search with mAIC: 313828.3388
- archaea5_Q_search with mAIC: 314250.8247

5. Corrected mAIC using correct parameter number:
- archaea5_c60_search: 2 * 88 - 2 * -156281.0940 = 312738.188
- archaea5_p_search: 2 * 510 - 2 * -156444.1694 = 313908.34
- archaea5_Q_search: 2 * 695 - 2 * -156468.4123 = 314326.82
