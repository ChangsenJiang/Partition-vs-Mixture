# Partition vs Mixture

Phylogenetic inference underpins our understanding of evolutionary relationships, and choosing an appropriate evolutionary model is critical—especially when **heterogeneity** is present across genes, sites, and lineages. Partitioned and profile **mixture** models capture different aspects of this heterogeneity, but past comparisons between them have been confounded by limitations of the Akaike Information Criterion (AIC), which is not directly comparable across different model classes.

**This project addresses that issue by applying a marginal AIC (mAIC) framework** to enable direct, like-for-like comparisons between partitioned and mixture models. We benchmark **partitioned** models against **C60 mixture** models across **nine** large empirical amino-acid datasets, and we assess not only **model fit** (mAIC) but also **model adequacy** (recovery of sequence properties) and **robustness** (stability of tree inference).



## What each major piece does

- **summary_9datasets.md**  
 Provides comprehensive information for each dataset (e.g., number of sites and number of loci), along with links to the data repository and the corresponding paper.

- **[data](https://github.com/ChangsenJiang/Partition-vs-Mixture/tree/main/data)**  
  Provides processed alignment data for each dataset at multiple subsampling levels to be used for analysis.

- **result**  
  Centralized outputs of model estimation and summaries:
  - CSV tables of fitted models and corresponding model-fit statistics (cAIC/mAIC/log-likelihood).
  - Markdown notes summarizing all information (e.g. commands, model parameters, runtimes, and cross-model comparisons).

- **scripts**

  Scripts for the 
    + Model estimation and mAIC calculation in 20,10,5 taxa
    + Extended parametric bootstrap test in 20 taxa
    + Robustness test in 20 taxa
  
  Details explained in the Analysis process below
- **README.md**

  This document


## Analysis Process

### 0. Data subsampling

> [!NOTE] 
> The alignments provided in [data](https://github.com/ChangsenJiang/Partition-vs-Mixture/tree/main/data) have been subsampled into certain taxa level and processed. However, you can also subsample it by your own through the following command

```bash
# treefile is the file containing all species, and k is the number of taxa that one wish to subsample into

iqtree2 -t <TREE_FILE> -k <number of species>
```

### 1. Model estimation

For each dataset, the data alignment and scripts should be placed in the following folder structure, an example could be found [here].

```bash
datasets
├── dataset_1/
│   ├── partition/
│   │   ├── p
│   │   │   └── 20_concated.nex          # change "20" to the actual species number
│   │   ├── Q
│   │   │   └── 20_concated.nex
│   │   └── q
│   │       └── 20_concated.nex
│   ├── c60/
│   │   └── 20_concated.nex
│   │
│   ├── model_estimation_pipeline.sh
│   ├── parameter_nex.py                 # script for model parameter extraction
│   └── convert.py                       # script to convert the numeric format
│ 
├── dataset_2/                            # same as above
├── ...
├── dataset_9/
└── iqtree2
```
The headers in the bash scripts look like 

```bash
# Set input parameters
ns=20                                 # Number of species in the alignment to analyze (e.g., 20)
threads=45                            # Maximum number of threads to be used
maxmem=120G                           # Soft memory limit
```
Set these parameters, then run the pipeline bash

```bash
bash model_estimation_pipeline.sh
```
This would 

 1) run MF+MERGE on p/Q/q partitioned
 2) select the best partitioned model by AIC & mAIC  
  3) initialize the best exchangeability and RHAS for C60 models using ModelFinder
  4) fit three C60 variants (C60+F,C60-opt,C60) 
  5) select the best C60 model by AIC/mAIC
 6) run a final tree search under the best C60 model  
  7) Produces a timestamped log and writes IQ-TREE outputs into each dataset’s `partition/` and `c60/`

> [!NOTE] 
> For specific IQ-TREE commands performed in this pipeline, see [here]().

After estimation, the [mAIC/cAIC values](https://github.com/ChangsenJiang/Partition-vs-Mixture/blob/main/result/Model%20estimation%20results/20taxa/1kplant_re.csv) for each model could be used for plotting **Fig. 1** in the paper





### 2. Extended Parametric bootstrap test
#### 2.1 Extract the estimated model parameters from Step 1

For every partitioned model estimated in step 1, the model parameter is simply the `.best_model.nex` file generated during the estimation.

For every C60 model, the model parameters could be extracted by first extracting its corresponding `.iqtree` and `.log` file, then run 

```bash
# create a *_parameter.nex file containing the parameters for a specific model
python parameter_nex.py <path/to/.iqtree> <path/to/.log> --outdir <output directory>
```

#### 2.2 Use the extracted parameters to simulate 100 alignments

For **partitioned models**, run

```bash
# p (edge-proportional)
iqtree2 --alisim <jobname> --seqtype AA -p <*_parameter.nex> -t <*_p_mf.treefile> --length <original alignment length> --out-format fasta --num-alignments 100

# Q (edge-unlinked)
iqtree2 --alisim <jobname> --seqtype AA -Q <*_parameter.nex> -t <*_Q_mf.parttrees> --length <original alignment length> --out-format fasta --num-alignments 100

# q (edge-linked)
iqtree2 --alisim <jobname> --seqtype AA -q <*_parameter.nex> -t <*_q_mf.treefile> --length <original alignment length> --out-format fasta --num-alignments 100
```

For **C60 models**, run

```bash
# for C60,C60-opt,C60+F
iqtree2 --alisim <jobname> --seqtype AA -m <model_name_specified_in_model_parameter.nex> -mdef <model_parameter.nex> -t <treefile> --length <original alignment length> --out-format fasta --num-alignments 100
```

After the above process, **100 simulated alignments should be generated for each model in each dataset**


#### 2.3 Performing extended parametric bootstrap test

We will use the scripts written by Yutong Shao to perform the test.

First, enter the `scripts/2_Parametric bootstrap_test` folder, and install and activate the required environment through

```bash
conda env create -f environment.yml
conda activate pbt_new_metrics
```

Then, to start the parametric bootstrap test, please make sure your input folder is structured as follows:

```bash
parametric_bootstrap_tests/
├── parametric_bootstrap_test_dataset_1/
│   ├── p/                        # Contains 100 simulated datasets in FASTA format
│   │   ├── simulate_1.fa
│   │   ├── simulate_2.fa
│   │   ├── ...
│   │   └── simulate_100.fa
│   ├── Q/                        # Same as above
│   ├── q/
│   ├── ...
│   └── C60/
│
├── parametric_bootstrap_test_dataset_2/  # Same as above
│  
├── ...
│
└── parametric_bootstrap_test_dataset_9/
    
```

Finally, for **each dataset folder**, run 

```
python PBT.py <parametric_bootstrap_test_dataset_n> <OriginalAlignment>  
```

- `OriginalAlignment`: the path to the original empirical fasta alignment

this script would

+ perform the **parametric bootstrap test** based on 
  
  - mean Shannon entropy
  - mean diversity 

+ perform the *two-sample Cramér–von Mises test* **(CvM test)** based on 

  - sitewise Shannon entropy
  - sitewise diversity

Results for the parametric bootstrap test are summarized in [`.pbr_gaps`](https://github.com/ChangsenJiang/Partition-vs-Mixture/blob/main/result/Parametric%20bootstrap%20results/Mean/mean_div/1kplant_c60_F.pbr_gaps) and [`.txt_gaps`](https://github.com/ChangsenJiang/Partition-vs-Mixture/blob/main/result/Parametric%20bootstrap%20results/Mean/mean_div/1kplant_c60_F.txt_gaps) files.
Results for the CvM test are summarized in [`cvm_diversity/entropy_results.txt`](https://github.com/ChangsenJiang/Partition-vs-Mixture/tree/main/result/Parametric%20bootstrap%20results/CvM%20test/Ascomycota), which could be used to plot **Figure 2&3** in the paper








### 3. Robustness test (LRM distances)

Robustness test was performed using the Cogent3 package, please make sure you have installed it

```bash
pip install cogent3
```

#### 3.1 Generate each drop-one-taxa alignment

First, we drop one taxa at a time for the 20-taxa alignments using 

```bash
python3 drop_seq_onebyone.py <alignment.nex>
```
For the 20-taxa alignment, this would generate twenty 19-taxa sub-alignments, in which one sequence was removed.

#### 3.2 Perform robustness test

Then, we would perform the same model estimation process as in Section 1 for each of the 19-taxa sub-alignments, but only for the best partitioned model (edge-unlinked or Q, edge-proportional or p), and the best C60 model (C60+F)

After the estimation, the resulting tree file produced by treesearch process for every sub-alignments for each model should be extracted into a same folder, together with the reference treefile, which is the tree estimated from the original 20-taxa alignment. The folder structure should be :

```bash
robustness_tests/
├── robustness_test_dataset_1/
│   ├── p/
│   │   ├── 19_taxa_tree_1.treefile
│   │   ├── 19_taxa_tree_2.treefile
│   │   ├── ...
│   │   └── 19_taxa_tree_20.treefile
│   ├── Q/                          # same as above
│   ├── C60+F/                      # same as above
│   └── reference.treefile          # 20-taxa tree estimated from original alignment
│
├── robustness_test_dataset_2/
├── ...
└── robustness_test_dataset_9/
```
For **each model folder in each dataset**, run

```bash
python Robustness_test.py <treefile_folder> -o <output_name.txt>
```

This would compute **Lin–Rajan–Moret (LRM)** tree distances between all trees generated from the minus-one-taxa subalignment and the original `reference.treefile` (to-Ref LRM distance), and also calculates the summary statistics (mean/SD/median) for those calculated LRM distances. [These results](https://github.com/ChangsenJiang/Partition-vs-Mixture/tree/main/result/Robustness%20test%20results) could then be used to plot **Figure 4** in the paper




## References

- Knight, R., Maxwell, P., Birmingham, A., Carnes, J., Caporaso, J. G., Easton, B. C., … Huttley, G. A. (2007). **PyCogent: a toolkit for making sense from sequence.** *Genome Biology*, 8(8), R171. https://doi.org/10.1186/gb-2007-8-8-r171
- Kalyaanamoorthy, S., Minh, B. Q., Wong, T. K. F., von Haeseler, A., & Jermiin, L. S. (2017). 
**ModelFinder: fast model selection for accurate phylogenetic estimates.** Nature Methods, 14(6), 
587-589. https://doi.org/10.1038/nmeth.4285  
- Lanfear, R., Calcott, B., Ho, S. Y., & Guindon, S. (2012). **Partitionfinder: combined selection of 
partitioning schemes and substitution models for phylogenetic analyses.** Mol Biol Evol, 29(6), 
1695-1701. https://doi.org/10.1093/molbev/mss020  
- Lanfear, R., Frandsen, P. B., Wright, A. M., Senfeld, T., & Calcott, B. (2017). **PartitionFinder 2: New 
Methods for Selecting Partitioned Models of Evolution for Molecular and Morphological 
Phylogenetic Analyses.** Mol Biol Evol, 34(3), 772-773. https://doi.org/10.1093/molbev/msw260 
- Lin, Y., Rajan, V., & Moret, B. M. (2012). **A metric for phylogenetic trees based on matching.** *IEEE/ACM Transactions on Computational Biology and Bioinformatics*, 9(4), 1014–1022. https://doi.org/10.1109/TCBB.2011.157
- Minh, B. Q., Schmidt, H. A., Chernomor, O., Schrempf, D., Woodhams, M. D., von Haeseler, A., & Lanfear, R. (2020). **IQ-TREE 2: New Models and Efficient Methods for Phylogenetic Inference in the Genomic Era.** *Molecular Biology and Evolution*, 37(5), 1530–1534. https://doi.org/10.1093/molbev/msaa015  
- **New-metrics-PBT**, Yutong, S. Github link: https://github.com/Yutong-Shao/new-metrics-PBT

