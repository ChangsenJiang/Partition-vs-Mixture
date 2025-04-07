# Summary of Results for bash_amas

| Name | Free parameters | Partitions | Mix LogL | mAIC | LogL | AIC | Runtime | Command |
|------|-----------------|------------|-----------|------|------|-----|---------|---------|
| 20bash_amas_c60_init | 65 | NA | NA | NA | -1680630.8303 | 3361391.6606 | 6.10 h | `../../iqtree2 -s 20_concated.nex -m MF -merit AIC -T 60 --mem 160G -safe -pre 20bash_amas_c60_init` |
| bash_amas20_p_mfp | 2828 | 153 | -1708826.1390 | 3423308.2781 | -1670066.5873 | 3345789.1747 | 2.70 h | `../../../iqtree2 -s 20_concated.nex -p 20_concated.nex -m MFP+MERGE -merit AIC -T 30 -pre bash_amas20_p_mfp` |
| bash_amas20_p_mf | 2850 | 153 | -1709089.1179 | 3423878.2357 | -1670299.6710 | 3346299.3419 | 2.32 h | `../../../iqtree2 -s 20_concated.nex -p 20_concated.nex -m MF+MERGE -merit AIC -T 30 -pre bash_amas20_p_mf` |
| bash_amas20_Q_mf | 7099 | 198 | -1721986.7684 | 3458171.5368 | -1660802.1480 | 3335802.2960 | 0.79 h | `../../../iqtree2 -s 20_concated.nex -Q 20_concated.nex -m MF+MERGE -merit AIC -T 30 -pre bash_amas20_Q_mf` |
| bash_amas20_Q_mfp | 7099 | 198 | -1722024.9864 | 3458247.9729 | -1660755.0423 | 3335708.0846 | 0.91 h | `../../../iqtree2 -s 20_concated.nex -Q 20_concated.nex -m MFP+MERGE -merit AIC -T 30 -pre bash_amas20_Q_mfp` |
