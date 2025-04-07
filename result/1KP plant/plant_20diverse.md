# Summary of Results for plant_20diverse

| Name | Free parameters | Partitions | Mix LogL | mAIC | LogL | AIC | Runtime | Command |
|------|-----------------|------------|-----------|------|------|-----|---------|---------|
| 20amas_c60 | 125 | NA | NA | NA | -1667515.5413 | 3335281.0825 | 6.74 h | `../../iqtree2 -s 20_concated_amas.nex -m LG+C60+F+I+R5 -te ./partition/amas20_p_mfp.treefile -T 40 -pre 20amas_c60 --mem 100G` |
| 20amas_c60_init | 65 | NA | NA | NA | -1680630.8042 | 3361391.6084 | 9.78 h | `../../iqtree2 -s 20_concated_amas.nex -m MF -merit AIC -T 25 -pre 20amas_c60_init --mem 20G` |
| amas20_p_mfp | 2827 | 148 | -1708341.4521 | 3422336.9042 | -1670252.7078 | 3346159.4157 | 1.52 h | `../../../iqtree2 -s 20_concated_amas.nex -p 20_concated_amas.nex -m MFP+MERGE -merit AIC -T 35 -pre amas20_p_mfp` |
| 20div_c60_init | 65 | NA | NA | NA | -1630646.2831 | 3261422.5662 | 9.08 h | `../../iqtree2 -s 20_concated.phy -m MF -merit AIC -T 24 -pre 20div_c60_init --mem 50G` |
| 20_LG_c60_opt | 125 | NA | NA | NA | -1617543.4350 | 3235336.8700 | 8.00 h | `../../iqtree2 -s 20_concated.phy -m LG+C60+F+I+R5 -te ../partition/Q/div20_Q_mfp.treefile -T 50 -pre 20_LG_c60_opt --mem 150G` |
| div20_p_mf | 2568 | 133 | -1654378.6545 | 3313893.3090 | -1620610.4665 | 3246356.9330 | 1.37 h | `../../../iqtree2 -s 20_concated.phy -p 20_concated.nex -m MF+MERGE -merit AIC -T 25 -pre div20_p_mf` |
| div20_p_mfp | 2568 | 133 | -1654378.9282 | 3313893.8563 | -1620610.4689 | 3246356.9377 | 1.58 h | `../../../iqtree2 -s 20_concated.phy -p 20_concated.nex -m MFP+MERGE -merit AIC -T 40 -pre div20_p_mfp` |
| div20_Q_mfp | 6861 | 184 | -1668599.4000 | 3350920.8000 | -1611160.6247 | 3236043.2494 | 1.13 h | `../../../iqtree2 -s 20_concated.phy -Q 20_concated.nex -m MFP+MERGE -merit AIC -T 10 -pre div20_Q_mfp` |
| div20_Q_mf | 6812 | 187 | -1670010.5977 | 3353645.1955 | -1611298.3002 | 3236220.6005 | 1.03 h | `../../../iqtree2 -s 20_concated.phy -Q 20_concated.nex -m MF+MERGE -merit AIC -T 25 -pre div20_Q_mf` |
