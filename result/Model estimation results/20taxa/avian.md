# Summary of Results for avian

| Name | Free parameters | Partitions | Mix LogL | mAIC | LogL | AIC | BIC | Runtime | Command |
|------|-----------------|------------|-----------|------|------|-----|-----|---------|---------|
| avian20_c60_opt | 107 | NA | NA | 3052199.5133 | -1525992.7567 | 3052199.5133 | 3053323.2128 | 1.66 h | `../../iqtree2 -s ./20_concated.nex -m Q.BIRD+C60+I+R6 -te ../partition/Q/avian20_Q_search.treefile -mwopt -T 50 -mem 120G -safe -pre avian20_c60_opt` |
| **avian20_c60_F** | 127 | NA | NA | 3046290.3352 | -1523018.1676 | 3046290.3352 | 3047624.0720 | 0.49 h | `../../iqtree2 -s ./20_concated.nex -m Q.BIRD+C60+F+I+R6 -te ../partition/Q/avian20_Q_search.treefile -T 50 -mem 120G -safe -pre avian20_c60_F` |
| avian20_c60_unopt | 48 | NA | NA | 3080005.7061 | -1539954.8530 | 3080005.7061 | 3080509.7956 | 12.20 h | `../../iqtree2 -s ./20_concated.nex -m Q.BIRD+C60+I+R6 -te ../partition/Q/avian20_Q_search.treefile -T 50 -mem 120G -safe -pre avian20_c60_unopt` |
| avian20_c60_search | 37 | NA | NA | 3046068.9948 | -1522997.4974 | 3046068.9948 | 3046457.5638 | 10.21 h | `../../iqtree2 -s 20_concated.nex -mdef avian20_c60_F_parameter.nex -m Q_BIRD_C60_F_I_R6 -t ../partition/Q/avian20_Q_search.treefile -T 50 --mem 120G -pre avian20_c60_search` |
| 20avian_c60_init | 48 | NA | NA | 3061888.5760 | -1530896.2880 | 3061888.5760 | 3062392.6654 | 2.08 h | `../../iqtree2 -s 20_concated.nex -m MF -merit AIC -T 50 -mem 120G -pre 20avian_c60_init` |
| **avian20_p_mf** | 3228 | 165 | -1553601.0143 | 3113658.0286 | -1500041.2299 | 3006538.4598 | 3040438.4775 | 2.02 h | `../../../iqtree2 -s 20_concated.nex -p 20_concated.nex -m MF+MERGE -merit AIC -T 12 -pre avian20_p_mf` |
| avian20_q_mf | 3514 | 230 | -1607249.7965 | 3221527.5930 | -1511998.7896 | 3031025.5792 | 3067929.1301 | 1.27 h | `../../../iqtree2 -s 20_concated.nex -q 20_concated.nex -m MF+MERGE -mrate E,I,G,I+G -merit AIC -T 12 -pre avian20_q_mf` |
| avian20_Q_mf | 8214 | 164 | -1556176.7353 | 3128781.4707 | -1492062.1383 | 3000552.2766 | 3086814.5895 | 1.88 h | `../../../iqtree2 -s 20_concated.nex -Q 20_concated.nex -m MF+MERGE -merit AIC -T 12 -pre avian20_Q_mf` |
| avian20_Q_search | 7748 | 164 | -1556138.1929 | 3127772.3858 | -1491987.5925 | 2999471.1849 | 3080839.6291 | 0.18 h | `../../../iqtree2 -s 20_concated.nex -Q avian20_Q_mf.best_model.nex -t avian20_Q_mf.treefile -T 50 -pre avian20_Q_search` |

## Summary of log file
1. Partition Analysis
- Best partition: Q with AIC: 3000552.2766
- Best partition: p with mAIC: 3113658.0286

2. C60 Initialization
- Selected model: Q.BIRD+I+R6

3. C60 Running (full mode)
- Best C60: c60_F with AIC: 3046290.3352
- Best overall: C60 (c60_F) with AIC: 3046290.3352

4. Treesearch Result
- avian20_c60_search with mAIC: 3046068.9948
- avian20_Q_search with mAIC: 3127772.3858

5. Corrected mAIC using correct parameter number:
- avian20_c60_search: 2 * 127 - 2 * -1522997.4974 = 3046248.9948
- avian20_Q_search: 2 * 8214 - 2 * -1556138.1929 = 3128704.39
