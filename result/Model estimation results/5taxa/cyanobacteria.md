# Summary of Results for cyanobacteria

| Name | Free parameters | Partitions | Mix LogL | mAIC | LogL | AIC | BIC | Runtime | Command |
|------|-----------------|------------|-----------|------|------|-----|-----|---------|---------|
| cyanobacteria5_c60_unopt | 11 | NA | NA | 1649447.2546 | -824712.6273 | 1649447.2546 | 1649553.9739 | 0.51 h | `../../iqtree2 -s ./5_concated.nex -m LG+C60+R3 -te ../partition/Q/cyanobacteria5_Q_search.treefile -T 30 -mem 120G -safe -pre cyanobacteria5_c60_unopt` |
| 5cyanobacteria_c60_init | 30 | NA | NA | 1644619.7396 | -822279.8698 | 1644619.7396 | 1644910.7924 | 1.00 h | `../../iqtree2 -s 5_concated.nex -m MF -merit AIC -T 30 -mem 120G -pre 5cyanobacteria_c60_init` |
| cyanobacteria5_c60_search | 7 | NA | NA | 1639222.4013 | -819604.2006 | 1639222.4013 | 1639290.3136 | 0.17 h | `../../iqtree2 -s 5_concated.nex -mdef cyanobacteria5_c60_F_parameter.nex -m LG_C60_F_R3 -t ../partition/Q/cyanobacteria5_Q_search.treefile -bb 1000 --wbtl -T 30 --mem 120G -pre cyanobacteria5_c60_search` |
| cyanobacteria5_c60_opt | 70 | NA | NA | 1641815.5530 | -820837.7765 | 1641815.5530 | 1642494.6761 | 0.62 h | `../../iqtree2 -s ./5_concated.nex -m LG+C60+R3 -te ../partition/Q/cyanobacteria5_Q_search.treefile -mwopt -T 30 -mem 120G -safe -pre cyanobacteria5_c60_opt` |
| **cyanobacteria5_c60_F** | 90 | NA | NA | 1639386.4809 | -819603.2404 | 1639386.4809 | 1640259.6392 | 0.79 h | `../../iqtree2 -s ./5_concated.nex -m LG+C60+F+R3 -te ../partition/Q/cyanobacteria5_Q_search.treefile -T 30 -mem 120G -safe -pre cyanobacteria5_c60_F` |
| cyanobacteria5_p_search | 1780 | 102 | -821755.9694 | 1647071.9388 | -811767.2603 | 1627094.5206 | 1644363.6518 | 0.02 h | `../../../iqtree2 -s 5_concated.nex -p cyanobacteria5_p_mf.best_model.nex -t cyanobacteria5_p_mf.treefile -bb 1000 --wbtl -T 30 -pre cyanobacteria5_p_search` |
| **cyanobacteria5_p_mf** | 1923 | 102 | -821751.2749 | 1647348.5498 | -811767.2624 | 1627380.5247 | 1646037.0075 | 0.19 h | `../../../iqtree2 -s 5_concated.nex -p 5_concated.nex -m MF+MERGE -merit AIC -T 7 -pre cyanobacteria5_p_mf` |
| cyanobacteria5_q_mf | 1668 | 104 | -828329.8039 | 1659995.6078 | -815277.1680 | 1633890.3360 | 1650072.8702 | 0.18 h | `../../../iqtree2 -s 5_concated.nex -q 5_concated.nex -m MF+MERGE -mrate E,I,G,I+G -merit AIC -T 7 -pre cyanobacteria5_q_mf` |
| cyanobacteria5_Q_mf | 2960 | 133 | -821980.1970 | 1649880.3939 | -808771.3858 | 1623462.7715 | 1652179.9785 | 0.15 h | `../../../iqtree2 -s 5_concated.nex -Q 5_concated.nex -m MF+MERGE -merit AIC -T 7 -pre cyanobacteria5_Q_mf` |
| cyanobacteria5_Q_search | 2772 | 133 | -821988.6289 | 1649521.2579 | -808771.3847 | 1623086.7693 | 1649980.0456 | 0.01 h | `../../../iqtree2 -s 5_concated.nex -Q cyanobacteria5_Q_mf.best_model.nex -t cyanobacteria5_Q_mf.treefile -bb 1000 --wbtl -T 30 -pre cyanobacteria5_Q_search` |

## Summary of log file
1. Partition Analysis
- Best partition: Q with AIC: 1623462.7715
- Best partition: p with mAIC: 1647348.5498

2. C60 Initialization
- Selected model: LG+F+R3

3. C60 Running (full mode)
- Best C60: c60_F with AIC: 1639386.4809
- Best overall: C60 (c60_F) with AIC: 1639386.4809

4. Treesearch Result
- cyanobacteria5_c60_search with mAIC: 1639222.4013
- cyanobacteria5_p_search with mAIC: 1647071.9388
- cyanobacteria5_Q_search with mAIC: 1649521.2579

5. Corrected mAIC using correct parameter number:
- cyanobacteria5_c60_search: 2 * 90 - 2 * -819604.2006 = 1639388.4012
- cyanobacteria5_p_search: 2 * 1923 - 2 * -821755.9694 = 1647357.94
- cyanobacteria5_Q_search: 2 * 2960 - 2 * -821988.6289 = 1649897.26
