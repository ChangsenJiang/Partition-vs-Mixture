# Partition-vs-Mixture

## Model Analysis Result for 1kp Plant Data



Below is the detailed comparison of several models evaluated for plant data:

# Model Analysis for Plant Data

## Results

### Model Comparison and Selection

Below is the detailed comparison of several models evaluated for plant data:

| Species | Category                   | Free Parameters | Number of Partitions | Mixture-based LogL | mAIC or AIC    | LogL            | AIC            | Run Time                               | Command                                                                                                           |
|---------|----------------------------|-----------------|----------------------|--------------------|----------------|-----------------|----------------|----------------------------------------|-------------------------------------------------------------------------------------------------------------------|
| 20      | Edge-linked partition      | 1688            | 162                  | -2656197.4349      | 5315770.87     | -2651058.8646  | 5305493.7293   | 15 min with 80 threads                 | iqtree2 -s all_concated.phy -q all_concated.nex                                                                     |
| 20      | Edge-proportional partition| 1927            | 105                  | -2497042.9292      | 4997939.8584   | -2484231.6237  | 4972317.2475   | 1.5h with 50 threads                   | iqtree2 -s all_concated.phy -p all_concated.nex                                                                     |
| 20      | Edge-unlinked partition    | 6732            | 140                  | -2496868.8428      | 5007201.6855   | -2474757.1266  | 4962978.2531   | 2h with 50 threads                     | iqtree2 -s all_concated.phy -Q all_concated.nex                                                                     |
| 20      | C10 weight optimized       | NA              | NA                   | NA                 | 5036713.3919   | NA              | NA             | 3h initialize + 7h estimation, 30 threads | iqtree2 -s all_concated.phy -m Q.plant+C10+R6 --opt-weights-only --init-model all_concated.phy.model               |
| 20      | C10 weight unoptimized     | NA              | NA                   | NA                 | 5054752.2331   | NA              | NA             | 7h estimation, 40 threads              | iqtree2 -s all_concated.phy -m Q.plant+C10+R6                                                                      |
| 20      | C20 weight unoptimized     | NA              | NA                   | NA                 | 5037813.8559   | NA              | NA             | 14h estimation, 40 threads             | iqtree2 -s all_concated.phy -m Q.plant+C20+R6                                                                      |
| 20      | C20 weight optimized       | NA              | NA                   | NA                 | 5005795.864    | NA              | NA             | 21h estimation, 30 threads             | iqtree2 -s all_concated.phy -m Q.plant+C20+R6 --opt-weights-only                                                   |
| 20      | C20+F optimized            | NA              | NA                   | NA                 | 4968139.4167   | NA              | NA             | 13h estimation, 60 threads             | iqtree2 -s all_concated.phy -m Q.plant+C20+F+R6 --opt-weights-only                                                 |
| 20      | C10+F weight optimized     | NA              | NA                   | NA                 | 4976154.2086   | NA              | NA             | 8h estimation, 40 threads              | iqtree2 -s all_concated.phy -m Q.plant+C10+F+R6 --opt-weights-only                                                 |
| 50      | Edge-linked partition      | NA              | NA                   | NA                 | 10378557.9084  | NA              | 10443827.7692  | 1h with 50 threads                     | similar                                                                                                           |
| 50      | Edge-proportional partition| NA              | NA                   | NA                 | 9637018.4445   | NA              | 9611795.1476   | 20h with 64 threads                    | similar                                                                                                           |
| 50      | Edge-unlinked partition    | NA              | NA                   | NA                 | 9668024.4723   | NA              | 9592644.0406   | 12h with 50 threads                    | similar                                                                                                           |
| 50      | C10 weight unoptimized     | NA              | NA                   | NA                 | 9701799.4079   | NA              | NA             | 26h initialize + 53h estimation, 30 threads | similar                                                                                                           |
| 50      | C10 weight optimized       | NA              | NA                   | NA                 | 9672705.2508   | NA              | NA             | 58h estimation, 20 threads             | similar                                                                                                           |

### Interpretation

- The **Edge-proportional partition** (20 species) has the lowest AIC (4972317.2475), indicating the best model fit with a reasonable number of parameters.
- Weight-optimized models (e.g., C20+F optimized) also performed competitively but required significantly more computational resources.
- Larger datasets (50 species) showed a substantial increase in computational time without clear improvements in model fit.

