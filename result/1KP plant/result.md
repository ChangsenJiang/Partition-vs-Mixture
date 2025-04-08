# Summary of Results for plant_20diverse

| Name | Free parameters | Partitions | Mix LogL | mAIC | LogL | AIC | Runtime | Command |
|------|-----------------|------------|-----------|------|------|-----|---------|---------|
| 20amas_c60_Q | 125 | NA | NA | NA | -1667510.8203 | 3335271.6406 | 9.48 h | `../../iqtree2 -s 20_concated_amas.nex -m LG+C60+F+I+R5 -te ./partition/amas20_Q_mfp.treefile -T 40 -pre 20amas_c60_Q --mem 100G` |
| 20amas_c60 | 125 | NA | NA | NA | -1667515.5413 | 3335281.0825 | 6.74 h | `../../iqtree2 -s 20_concated_amas.nex -m LG+C60+F+I+R5 -te ./partition/amas20_p_mfp.treefile -T 40 -pre 20amas_c60 --mem 100G` |
| 20amas_c60_init | 65 | NA | NA | NA | -1680630.8042 | 3361391.6084 | 9.78 h | `../../iqtree2 -s 20_concated_amas.nex -m MF -merit AIC -T 25 -pre 20amas_c60_init --mem 20G` |
| amas20_p_mf | 2966 | 156 | -1711834.5245 | 3429601.0489 | -1670228.3057 | 3346388.6113 | 1.23 h | `../../../iqtree2 -s 20_concated_amas.nex -p 20_concated_amas.nex -m MF+MERGE -merit AIC -T 30 -pre amas20_p_mf` |
| amas20_Q_mfp | 7099 | 198 | -1722065.7284 | 3458329.4568 | -1660754.9924 | 3335707.9847 | 0.80 h | `../../../iqtree2 -s 20_concated_amas.nex -Q 20_concated_amas.nex -m MFP+MERGE -merit AIC -T 35 -pre amas20_Q_mfp` |
| amas20_p_mfp | 2827 | 148 | -1708341.4521 | 3422336.9042 | -1670252.7078 | 3346159.4157 | 1.52 h | `../../../iqtree2 -s 20_concated_amas.nex -p 20_concated_amas.nex -m MFP+MERGE -merit AIC -T 35 -pre amas20_p_mfp` |
| 20div_c60_init | 65 | NA | NA | NA | -1630646.2831 | 3261422.5662 | 9.08 h | `../../iqtree2 -s 20_concated.phy -m MF -merit AIC -T 24 -pre 20div_c60_init --mem 50G` |
| 20_LG_c60_opt | 125 | NA | NA | NA | -1617543.4350 | 3235336.8700 | 8.00 h | `../../iqtree2 -s 20_concated.phy -m LG+C60+F+I+R5 -te ../partition/Q/div20_Q_mfp.treefile -T 50 -pre 20_LG_c60_opt --mem 150G` |
| div20_p_mf | 2568 | 133 | -1654378.6545 | 3313893.3090 | -1620610.4665 | 3246356.9330 | 1.37 h | `../../../iqtree2 -s 20_concated.phy -p 20_concated.nex -m MF+MERGE -merit AIC -T 25 -pre div20_p_mf` |
| div20_p_mfp | 2568 | 133 | -1654378.9282 | 3313893.8563 | -1620610.4689 | 3246356.9377 | 1.58 h | `../../../iqtree2 -s 20_concated.phy -p 20_concated.nex -m MFP+MERGE -merit AIC -T 40 -pre div20_p_mfp` |
| div20_Q_mf | 6812 | 187 | -1670010.5977 | 3353645.1955 | -1611298.3002 | 3236220.6005 | 1.03 h | `../../../iqtree2 -s 20_concated.phy -Q 20_concated.nex -m MF+MERGE -merit AIC -T 25 -pre div20_Q_mf` |
| div20_Q_mfp | 6861 | 184 | -1668599.4000 | 3350920.8000 | -1611160.6247 | 3236043.2494 | 1.13 h | `../../../iqtree2 -s 20_concated.phy -Q 20_concated.nex -m MFP+MERGE -merit AIC -T 10 -pre div20_Q_mfp` |


# Summary of Results for bash_amas

| Name | Free parameters | Partitions | Mix LogL | mAIC | LogL | AIC | Runtime | Command |
|------|-----------------|------------|-----------|------|------|-----|---------|---------|
| bash_amas20_c60_unopt | 46 | NA | NA | NA | -1683104.8682 | 3366301.7363 | 5.07 h | `../../iqtree2 -s ./20_concated.nex -m LG+C60+I+R5 -te ../partition/Q/bash_amas20_Q_mfp.treefile -T 40 --mem 80G -safe -pre bash_amas20_c60_unopt` |
| bash_amas20_c60_F | 125 | NA | NA | NA | -1667510.8611 | 3335271.7221 | 8.37 h | `../../iqtree2 -s ./20_concated.nex -m LG+C60+F+I+R5 -te ../partition/Q/bash_amas20_Q_mfp.treefile -T 80 --mem 160G -safe -pre bash_amas20_c60_F` |
| 20bash_amas_c60_init | 65 | NA | NA | NA | -1680630.8303 | 3361391.6606 | 6.10 h | `../../iqtree2 -s 20_concated.nex -m MF -merit AIC -T 60 --mem 160G -safe -pre 20bash_amas_c60_init` |
| bash_amas20_p_mfp | 2828 | 153 | -1708826.1390 | 3423308.2781 | -1670066.5873 | 3345789.1747 | 2.70 h | `../../../iqtree2 -s 20_concated.nex -p 20_concated.nex -m MFP+MERGE -merit AIC -T 30 -pre bash_amas20_p_mfp` |
| bash_amas20_p_mf | 2850 | 153 | -1709089.1179 | 3423878.2357 | -1670299.6710 | 3346299.3419 | 2.32 h | `../../../iqtree2 -s 20_concated.nex -p 20_concated.nex -m MF+MERGE -merit AIC -T 30 -pre bash_amas20_p_mf` |
| bash_amas20_Q_mf | 7099 | 198 | -1721986.7684 | 3458171.5368 | -1660802.1480 | 3335802.2960 | 0.79 h | `../../../iqtree2 -s 20_concated.nex -Q 20_concated.nex -m MF+MERGE -merit AIC -T 30 -pre bash_amas20_Q_mf` |
| bash_amas20_Q_mfp | 7099 | 198 | -1722024.9864 | 3458247.9729 | -1660755.0423 | 3335708.0846 | 0.91 h | `../../../iqtree2 -s 20_concated.nex -Q 20_concated.nex -m MFP+MERGE -merit AIC -T 30 -pre bash_amas20_Q_mfp` |






# Summary of Results for plant_nosearch

| Name | Free parameters | Partitions | Mix LogL | mAIC | LogL | AIC | Runtime | Command |
|------|-----------------|------------|-----------|------|------|-----|---------|---------|
| partitiontree_c60_opt | 125 | NA | NA | NA | -2481021.5196 | 4962293.0392 | 0.75 h | `../iqtree2 -s all_concated.phy -m Q.plant+C60+F+I+R6 -te 20_notree_p.treefile -T 20 -pre partitiontree_c60_opt` |
| 20_c60_opt | 125 | NA | NA | NA | -2481028.7471 | 4962307.4942 | 0.47 h | `../iqtree2 -s all_concated.phy -m Q.plant+C60+F+I+R6 -te 20_c60_init_MF_new.treefile -T 50 -pre 20_c60_opt` |
| 20_c60_init_MF_new | 65 | NA | NA | NA | -2499306.3702 | 4998742.7404 | 1.98 h | `../iqtree2 -s all_concated.phy -m MF -merit AIC -T 70 -pre 20_c60_init_MF_new` |
| 20_c60_opt | 124 | NA | NA | NA | -2480564.5917 | 4961377.1834 | 7.97 h | `../iqtree2 -s all_concated.phy -m JTT+C60+F+R6 -te 20_c60_init_MF.treefile -T 50 -pre 20_c60_opt` |
| 20_notree_p | 1949 | 106 | -2495846.0518 | 4995590.1036 | -2484195.3013 | 4972288.6025 | 1.13 h | `../../iqtree2 -s all_concated.phy -p all_concated.nex -m MF+MERGE -merit AIC -T 20 -pre 20_notree_p` |
| 20_MFP_p | 1958 | 106 | -2496019.5603 | 4995955.1207 | -2484141.3500 | 4972198.7000 | 2.03 h | `../../iqtree2 -s all_concated.phy -p all_concated.nex -m MF+MERGE -te 20_init_MF.treefile -merit AIC -T 50 -pre 20_MFP_p` |
| 20_MFP_Q | 6393 | 133 | -2495644.9440 | 5004075.8880 | -2475193.4938 | 4963172.9876 | 0.92 h | `../../iqtree2 -s all_concated.phy -Q all_concated.nex -m MF+MERGE -te 20_init_MF.treefile -merit AIC -T 50 -pre 20_MFP_Q` |
| 50_c60_init_MF | 114 | NA | NA | NA | -4821938.7583 | 9644105.5167 | 17.68 h | `../iqtree2 -s all_concated.phy -m MF -merit AIC -T 70 -pre 50_c60_init_MF` |
| check_profile | 114 | NA | NA | NA | -5224349.4678 | 10448926.9355 | 0.00 h | `../iqtree2 -s all_concated.phy -m JTT+F -wsr -pre check_profile -T 50 -n 0` |