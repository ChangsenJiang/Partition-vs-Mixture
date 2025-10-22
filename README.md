# Partition vs Mixture

Phylogenetic inference underpins our understanding of evolutionary relationships, and choosing an appropriate evolutionary model is critical—especially when **heterogeneity** is present across genes, sites, and lineages. Partitioned and profile **mixture** models capture different aspects of this heterogeneity, but past comparisons between them have been confounded by limitations of the Akaike Information Criterion (AIC), which is not directly comparable across different model classes.

**This project addresses that issue by applying a marginal AIC (mAIC) framework** to enable direct, like-for-like comparisons between partitioned and mixture models. We benchmark **partitioned** models against **C60 mixture** models across **nine** large empirical amino-acid datasets, and we assess not only **model fit** (mAIC) but also **model adequacy** (recovery of sequence properties) and **robustness** (stability of tree inference).

---

### What each major piece does

- **9datasets_summary.md**  
 Provides comprehensive information for each dataset (e.g., number of sites and number of loci), along with links to the data repository and the corresponding paper.

- **data/**  
  Provides alignment data for each dataset at multiple subsampling levels.

- **result/**  
  Centralized outputs of model estimation and summaries:
  - CSV tables of fitted models and corresponding model-fit statistics (cAIC/mAIC/log-likelihood).
  - Markdown notes summarizing all information (e.g. commands, model parameters, runtimes, and cross-model comparisons).

- **scripts/iqtree_pipeline.sh**  
  One-command pipeline to:
  1) run MF+MERGE on p/Q/q partition schemes,  
  2) select the best partition by AIC & mAIC,  
  3) initialize C60 from MF,  
  4) fit C60 variants (+F / no-F, with/without weight optimization),  
  5) compare models by AIC/mAIC,  
  6) (full mode) run a final tree search under the best C60 model.  
  Produces a timestamped log and writes IQ-TREE outputs into each dataset’s `partition/` and `c60/`.

- **scripts/parameter_nex.py**  
  Parses an `.iqtree` file and its `.log` to create a **NEXUS** model block, including `frequency F`, `+I`, `+G/R`, and `FMIX{...}`, enabling reproducible re-runs under the exact fitted model.

- **scripts/lrm_distance.py**  
  Computes **Lin–Rajan–Moret (LRM)** tree distances among all trees in a folder (**pairwise**) and versus a mandatory `reference.treefile` (**to-Ref**), with summary statistics (mean/SD/median).


## Example usage

### Model estimation (per dataset)
```bash
bash Model_estimation_pipeline.sh
```

### Build a parameter NEXUS from a finished run
```bash
python parameter_nex.py <path/to/run.iqtree> <path/to/run.log> --outdir .
```

### Robustness test (LRM distances)
```bash
python Robustness_test.py <path/to/.treefile> -o lrm_distances.txt
```

> For minimal IQ-TREE commands covering all model types, see  
> `scripts/Model_estimation_mAIC_calculation/Only_commands.txt`.
---

## References

- Knight, R., Maxwell, P., Birmingham, A., Carnes, J., Caporaso, J. G., Easton, B. C., … Huttley, G. A. (2007). **PyCogent: a toolkit for making sense from sequence.** *Genome Biology*, 8(8), R171. https://doi.org/10.1186/gb-2007-8-8-r171
- Lin, Y., Rajan, V., & Moret, B. M. (2012). **A metric for phylogenetic trees based on matching.** *IEEE/ACM Transactions on Computational Biology and Bioinformatics*, 9(4), 1014–1022. https://doi.org/10.1109/TCBB.2011.157  
- Minh, B. Q., Schmidt, H. A., Chernomor, O., Schrempf, D., Woodhams, M. D., von Haeseler, A., & Lanfear, B. (2020). **IQ-TREE 2: New Models and Efficient Methods for Phylogenetic Inference in the Genomic Era.** *Molecular Biology and Evolution*, 37(5), 1530–1534. https://doi.org/10.1093/molbev/msaa015  

