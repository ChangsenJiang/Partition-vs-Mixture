# Summary of Results for 1kplant

| Name | Free parameters | Partitions | Mix LogL | mAIC | LogL | AIC | BIC | Runtime | Command |
|------|-----------------|------------|-----------|------|------|-----|-----|---------|---------|
| 1kplant10_c60_search | 17 | NA | NA | 3395920.5076 | -1697943.2538 | 3395920.5076 | 3396089.4489 | 3.43 h | `../../iqtree2 -s 10_concated.nex -mdef 1kplant10_c60_F_parameter.nex -m LG_C60_F_R4 -t ../partition/Q/1kplant10_Q_search.treefile -bb 1000 --wbtl -T 45 --mem 120G -pre 1kplant10_c60_search` |
| **1kplant10_c60_F** | 102 | NA | NA | 3396145.1056 | -1697970.5528 | 3396145.1056 | 3397158.7533 | 1.76 h | `../../iqtree2 -s ./10_concated.nex -m LG+C60+F+R4 -te ../partition/Q/1kplant10_Q_search.treefile -T 45 -mem 120G -safe -pre 1kplant10_c60_F` |
| 1kplant10_c60_opt | 82 | NA | NA | 3406720.2764 | -1703278.1382 | 3406720.2764 | 3407535.1696 | 6.96 h | `../../iqtree2 -s ./10_concated.nex -m LG+C60+R4 -te ../partition/Q/1kplant10_Q_search.treefile -mwopt -T 45 -mem 120G -safe -pre 1kplant10_c60_opt` |
| 101kplant_c60_init | 42 | NA | NA | 3410904.2948 | -1705410.1474 | 3410904.2948 | 3411321.6792 | 6.06 h | `../../iqtree2 -s 10_concated.nex -m MF -merit AIC -T 45 -mem 120G -pre 101kplant_c60_init` |
| 1kplant10_c60_unopt | 23 | NA | NA | 3435380.7389 | -1717667.3694 | 3435380.7389 | 3435609.3065 | 1.52 h | `../../iqtree2 -s ./10_concated.nex -m LG+C60+R4 -te ../partition/Q/1kplant10_Q_search.treefile -T 45 -mem 120G -safe -pre 1kplant10_c60_unopt` |
| **1kplant10_p_mf** | 2503 | 129 | -1707467.0952 | 3419940.1904 | -1689453.1828 | 3383912.3655 | 3408786.4849 | 0.80 h | `../../../iqtree2 -s 10_concated.nex -p 10_concated.nex -m MF+MERGE -merit AIC -T 11 -pre 1kplant10_p_mf` |
| 1kplant10_p_search | 2216 | 129 | -1707467.2661 | 3419366.5322 | -1689453.1852 | 3383338.3705 | 3405360.3635 | 0.34 h | `../../../iqtree2 -s 10_concated.nex -p 1kplant10_p_mf.best_model.nex -t 1kplant10_p_mf.treefile -bb 1000 --wbtl -T 45 -pre 1kplant10_p_search` |
| 1kplant10_q_mf | 2820 | 162 | -1717449.8776 | 3440539.7553 | -1693536.9726 | 3392713.9452 | 3420738.3226 | 0.34 h | `../../../iqtree2 -s 10_concated.nex -q 10_concated.nex -m MF+MERGE -mrate E,I,G,I+G -merit AIC -T 11 -pre 1kplant10_q_mf` |
| 1kplant10_Q_search | 5305 | 180 | -1710198.4498 | 3431006.8996 | -1682483.7907 | 3375577.5814 | 3428297.1993 | 0.05 h | `../../../iqtree2 -s 10_concated.nex -Q 1kplant10_Q_mf.best_model.nex -t 1kplant10_Q_mf.treefile -bb 1000 --wbtl -T 45 -pre 1kplant10_Q_search` |
| 1kplant10_Q_mf | 5702 | 180 | -1710188.0139 | 3431780.0277 | -1682483.7981 | 3376371.5963 | 3433036.4900 | 0.67 h | `../../../iqtree2 -s 10_concated.nex -Q 10_concated.nex -m MF+MERGE -merit AIC -T 11 -pre 1kplant10_Q_mf` |

## Summary of log file
1. Partition Analysis
- Best partition: Q with AIC: 3376371.5963
- Best partition: p with mAIC: 3419940.1904

2. C60 Initialization
- Selected model: LG+F+R4

3. C60 Running (full mode)
- Best C60: c60_F with AIC: 3396145.1056
- Best overall: C60 (c60_F) with AIC: 3396145.1056

4. Treesearch Result
- 1kplant10_c60_search with mAIC: 3395920.5076
- 1kplant10_p_search with mAIC: 3419366.5322
- 1kplant10_Q_search with mAIC: 3431006.8996

5. Corrected mAIC using correct parameter number:
- 1kplant10_c60_search: 2 * 102 - 2 * -1697943.2538 = 3396090.5076
- 1kplant10_p_search: 2 * 2503 - 2 * -1707467.2661 = 3419940.53
- 1kplant10_Q_search: 2 * 5702 - 2 * -1710198.4498 = 3431800.90
