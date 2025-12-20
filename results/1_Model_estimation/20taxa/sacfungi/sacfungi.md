# Summary of Results for sacfungi

| Name | Free parameters | Partitions | Mix LogL | mAIC | LogL | AIC | Runtime | Command |
|------|-----------------|------------|-----------|------|------|-----|---------|---------|
| **sacfungi20_c60_F** | 129 | NA | NA | 14673207.7576 | -7336474.8788 | 14673207.7576 | 4.56 h | `../../iqtree2 -s ./20_concated.nex -m Q.YEAST+C60+F+I+R7 -te ../partition/Q/sacfungi20_Q_search.treefile -T 80 --mem 140G -safe -pre sacfungi20_c60_F` |
| sacfungi20_c60_unopt | 50 | NA | NA | 14858185.2685 | -7429042.6343 | 14858185.2685 | 72.33 h | `../../iqtree2 -s ./20_concated.nex -m Q.YEAST+C60+I+R7 -te ../partition/Q/sacfungi20_Q_search.treefile -T 40 --mem 70G -safe -pre sacfungi20_c60_unopt` |
| sacfungi20_c60_search | 37 | NA | NA | 14673046.5208 | -7336486.2604 | 14673046.5208 | 41.50 h | `../../iqtree2 -s 20_concated.nex -mdef sacfungi20_c60_F_parameter.nex -m Q_YEAST_C60_F_I_R7 -t ../partition/Q/sacfungi20_Q_search.treefile -T 80 --mem 140G -pre sacfungi20_c60_search` |
| sacfungi20_c60_opt | 109 | NA | NA | 14733784.0331 | -7366783.0165 | 14733784.0331 | 55.14 h | `../../iqtree2 -s ./20_concated.nex -m Q.YEAST+C60+I+R7 -te ../partition/Q/sacfungi20_Q_search.treefile -mwopt -T 40 --mem 70G -safe -pre sacfungi20_c60_opt` |
| 20sacfungi_c60_init | 50 | NA | NA | 14790216.9224 | -7395058.4612 | 14790216.9224 | 6.72 h | `../../iqtree2 -s 20_concated.nex -m MF -merit AIC -T 80 --mem 140G -pre 20sacfungi_c60_init` |
| **sacfungi20_p_mf** | 4242 | 195 | -7386842.1793 | 14782168.3586 | -7345616.8036 | 14699717.6072 | 4.17 h | `../../../iqtree2 -s 20_concated.nex -p 20_concated.nex -m MF+MERGE -merit AIC -T 20 -pre sacfungi20_p_mf` |
| sacfungi20_q_mf | 3472 | 223 | -7403658.5246 | 14814261.0492 | -7365153.1550 | 14737250.3100 | 0.63 h | `../../../iqtree2 -s 20_concated.nex -q 20_concated.nex -m MF+MERGE -mrate E,I,G,I+G -merit AIC -T 20 -pre sacfungi20_q_mf` |
| sacfungi20_Q_mf | 18004 | 361 | -7415725.7382 | 14867459.4764 | -7293830.5928 | 14623669.1856 | 2.44 h | `../../../iqtree2 -s 20_concated.nex -Q 20_concated.nex -m MF+MERGE -merit AIC -T 20 -pre sacfungi20_Q_mf` |
| sacfungi20_Q_search | 16095 | 361 | -7415650.2690 | 14863490.5380 | -7293830.5333 | 14619851.0667 | 0.32 h | `../../../iqtree2 -s 20_concated.nex -Q sacfungi20_Q_mf.best_model.nex -t sacfungi20_Q_mf.treefile -T 80 -pre sacfungi20_Q_search` |

## Summary of log file
1. Partition Analysis
- Best partition: Q with AIC: 14623669.1856
- Best partition: p with mAIC: 14782168.3586

2. C60 Initialization
- Selected model: Q.YEAST+I+R7

3. C60 Running (full mode)
- Best C60: c60_F with AIC: 14673207.7576
- Best overall: C60 (c60_F) with AIC: 14673207.7576

4. Treesearch Result
- sacfungi20_c60_search with mAIC: 14673046.5208
- sacfungi20_Q_search with mAIC: 14863490.5380

5. Corrected mAIC using correct parameter number:
- sacfungi20_c60_search: 2 * 129 - 2 * -7336486.2604 = 14673230.5208
- sacfungi20_Q_search: 2 * 18004 - 2 * -7415650.2690 = 14867308.538
