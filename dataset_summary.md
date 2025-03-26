# Summary of Datasets

Below is a summary of datasets covering diverse taxonomic groups including Animals, Plants, Fungi, and Bacteria. Each dataset is referenced with a citation; please click on the citation links to view the corresponding publications.

| Taxonomic Group | Dataset                                                                                               | Journal          | Sites   | Loci  | Sequences |Type |Data link |
|-----------------|-------------------------------------------------------------------------------------------------------|------------------|---------|-------|-----------|-----------|-----------|
| Animal          | Avain ([Stiller et al., 2024](https://www.nature.com/articles/s41586-024-07323-1))                    | Nature           | 9487705 | 14972 | 363       |DNA & AA|[link](https://sid.erda.dk/cgi-sid/ls.py?share_id=Ehhw9rJN8E)|
| Animal          | Tardigrada ([Giacomelli et al., 2025](https://academic.oup.com/gbe/article/17/1/evae273/7931680))     | GBE              | 70888   | 571   | 40        |AA|[link](https://github.com/mgiacom/tardigrades_catpmsf/tree/main/data/matrix)|
| Plant           | Viridiplantae/1kp Plants ([One Thousand Plant Transcriptomes Project, 2019](https://www.nature.com/articles/s41586-019-1693-2)) | Nature           | 155575  | 410   | 1187      |DNA & AA |[link](https://zenodo.org/records/3255100)|
| Plant           | Eucalypts ([Crisp et al., 2024](https://onlinelibrary.wiley.com/doi/10.1111/jse.13047))               | JSE              | 129354  | 101   | 399       |DNA|[link](https://datadryad.org/dataset/doi:10.5061/dryad.gb5mkkwww)|
| Fungi           | Ascomycota ([Shen et al., 2020](https://www.science.org/doi/10.1126/sciadv.abd0079))                  | Science Advances | 562376  | 815   | 1113      |DNA & AA|[link](https://figshare.com/articles/dataset/Phylogenomics_and_contrasting_modes_of_genome_evolution_in_Ascomycota/12196149)|
| Fungi           | Budding Yeast ([Shen et al., 2018](https://www.cell.com/cell/fulltext/S0092-8674(18)31332-1))         | Cell             | 1162805 | 2408  | 343       |AA|[link](https://figshare.com/articles/dataset/Tempo_and_mode_of_genome_evolution_in_the_budding_yeast_subphylum/5854692)|
| Bacteria        | Genome Taxonomy Database GTDB ([Parks et al., 2022](https://academic.oup.com/nar/article/50/D1/D785/6370255?login=true))| NAR              | 41083   | 120   | 45555     |AA|[link](https://data.ace.uq.edu.au/public/gtdb/data/releases/temporary/full_msas/)|
| Bacteria        | Cyanobacteria ([Pardo-De la Hoz et al., 2023](https://academic.oup.com/sysbio/article/72/3/694/7056769#408745380))| Syst Bio         | 229602  | 746   | 55        |DNA & AA|[link](https://datadryad.org/dataset/doi:10.5061/dryad.tht76hf1p)|

### Descriptions:
- **Avain**: Both DNA and amino acid alignment sequence for 14972 exon in 363 avian species.
- **Tardigrada**: 
- **1kp Plants**: Both the amino acid and DNA alignment for over one thousand Viridiplantae species
- **Eucalypts**: DNA alignment of 101 protein coding single-copy genes in 392 eucalypt and 7 outgroup species
- **Ascomycota**: Both DNA and amino acid Alignments of 1107 representatives of the phylum Ascomycota and 6 outgroup species in 815 BUSCO genes
- **Budding Yeast**: Same amino acid alignment dataset used in Qmaker paper to train Q.yeast
- **Genome Taxonomy Database GTDB**: The GTDB dataset contains bacterial and archaeal multiple sequence alignments (MSAs) are formed from the concatenation of 120 (bac120) or 53 (arc53) phylogenetically informative markers. Here we use the alignmengt of 120 bacteria gene (bac120), containing 45555 bacteria species in 127 Phylum, 360 Class, 1163 Order. 
- **Cyanobacteria**:  Both DNA and amino acid alignments of a subset of 746 genes from the 773 single-copy ortholog genes in the “cyanobacteria_odb10” database used by BUSCO, which are conserved across all Cyanobacteria. 

