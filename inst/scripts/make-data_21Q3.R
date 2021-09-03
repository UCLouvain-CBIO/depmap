### =========================================================================
### Make 21Q3 depmap data
### -------------------------------------------------------------------------

## This scripts documents how to download and generate the data files.
## Note 1: This scipt assumes (!!!) that it is run in ./depmap/inst/scripts/ and
## saves the resulting .rda files in ./depmap/inst/data
## (e.g. *setwd(./depmap/inst/scripts/)*)
## Note 2: the Broad Institute may change the download urls for these datasets.
## If the link to one of these datasets is broken, please contact the package
## maintainer. All Depmap data can be downloaded from the API at
## https://depmap.org/portal/download/ even if the specific links may change

## load libraries
library("readr")
library("dplyr")
library("tidyr")
# library("ExperimentHub")

# setwd("~/tmp/depmap/inst/scripts/")
# Sys.setenv(VROOM_CONNECTION_SIZE = 500072)

##########################################
## depmap `metadata_21Q3` dataset
##########################################

### loading data (downloading .csv file from online source)
metadata_21Q3 <- read_csv(file = "https://ndownloader.figshare.com/files/29162481")

#### Rename `metadata` columns to contain underscores and be in snake case
## note: "metadata_21Q3" has different columns than "metadata_21Q3"
names(metadata_21Q3)[1:26] <- c(
    "depmap_id", "cell_line_name",
    "stripped_cell_line_name", "cell_line",
    "aliases", "cosmic_id",
    "sex", "source",
    "Achilles_n_replicates", "cell_line_NNMD",
    "culture_type", "culture_medium",
    "cas9_activity", "RRID",
    "WTSI_master_cell_ID", "sample_collection_site",
    "primary_or_metastasis", "primary_disease",
    "subtype_disease", "age",
    "sanger_id", "additional_info",
    "lineage", "lineage_subtype",
    "lineage_sub_subtype", "lineage_molecular_subtype")

### saving cleaned and converted `metadata` data as .rda file
save(metadata_21Q3, file = "../eh_data/metadata_21Q3.rda",
      compress = "xz", compression_level = 9)

##########################################
## `dep_2_name_21Q3 map `depmap_id` to `cell_line`
##########################################

##  generation of `metadata` subset `dep_2_name_21Q3`
## The subset of `metadata`, `dep_2_name_Q2` is used to map `cell_line`
## and depmap_id via left_join in other depmap datasets that do not contain
## both variables. If you are generating the depmap data from scratch, you will
## need to run the following code to generate the data correctly.

### `dep_2_name` to add `depmap_id` or `cell_line` to other datasets
metadata_21Q3 %>% dplyr::select(depmap_id, cell_line) -> dep_2_name_21Q3

##########################################
## depmap `mutationCalls_21Q3` dataset
##########################################

### loading data (downloading .csv file from online source)
mutationCalls_21Q3 <- read_csv(file = "https://ndownloader.figshare.com/files/29125233")

## note: "mutationCalls_21Q3" has different columns than "mutationCalls_19Q1"
## the variable "VA_WES_AC" is no longer present in this dataset, unlike
## previous releases (e.g. 19Q1)!
names(mutationCalls_21Q3)[1:32] <- c(
    "gene_name", "entrez_id",
    "ncbi_build", "chromosome",
    "start_pos", "end_pos",
    "strand", "var_class",
    "var_type", "ref_allele",
    "tumor_seq_allele1", "dbSNP_RS",
    "dbSNP_val_status", "genome_change",
    "annotation_trans", "depmap_id",
    "cDNA_change", "codon_change",
    "protein_change", "is_deleterious",
    "is_tcga_hotspot", "tcga_hsCnt",
    "is_cosmic_hotspot", "cosmic_hsCnt",
    "ExAC_AF", "var_annotation",
    "CGA_WES_AC", "HC_AC",
    "RD_AC", "RNAseq_AC",
    "sanger_WES_AC", "WGS_AC")

### rearrange columns into same column format as other datasets
mutationCalls_21Q3 %>%
    dplyr::select(depmap_id, everything()) -> mutationCalls_21Q3

### saving cleaned and converted `mutationCalls` data as .rda file
save(mutationCalls_21Q3, file = "../eh_data/mutationCalls_21Q3.rda",
     compress = "xz", compression_level = 9)

##########################################
## depmap `copyNumber_21Q3` dataset
##########################################

### loading data (downloading .csv file from online source)
copyNumber_21Q3 <- read_csv("https://ndownloader.figshare.com/files/29125230")

### rename column first column to "depmap_id"
names(copyNumber_21Q3)[1] <- "depmap_id"

### gather into long form on columns: `depmap_id`, `gene`, `logCopyNumber`
copyNumber_21Q3 %>%
  gather(gene, log_copy_number, -depmap_id) -> copyNumber_21Q3_long

### mutate gene column into `gene_name` and `entrez_id`
copyNumber_21Q3_long %>%
    mutate(entrez_id = gsub("&", ";", sub("\\)", "", sub("^.+ \\(", "", gene))),
           gene_name = gsub("&", ";", sub(" \\(.+\\)$", "", gene))
           ) -> copyNumber_21Q3_long

### left_join `copyNumber` & `dep_2_name_21Q3` on `depmap_id`,
 copyNumber_21Q3_long %>%
    left_join(dep_2_name_21Q3,
              by = c("depmap_id" = "depmap_id")) -> copyNumber_21Q3

### rearrange columns into same column format as other datasets
copyNumber_21Q3 %>% 
  select(depmap_id, gene, log_copy_number, entrez_id, gene_name, cell_line) %>%
  type_convert(cols(entrez_id = "i")) -> copyNumber_21Q3

### saving cleaned and converted `copyNumber` data as .rda file
save(copyNumber_21Q3, file = "../eh_data/copyNumber_21Q3.rda",
     compress = "xz", compression_level = 9)

##########################################
## depmap `crispr_21Q3` dataset
##########################################

### loading data (downloading .csv file from online source)
crispr_21Q3 <- read_csv(file = "https://ndownloader.figshare.com/files/29125323")

### rename column first column to "depmap_id"
names(crispr_21Q3)[1] <-"depmap_id"

### gather cripsr into long form with columns: `depmap_id`, `gene`, `dependency`
crispr_21Q3 %>%
  gather(gene, dependency, -depmap_id) -> crispr_21Q3_long

### mutate gene into `gene_name` and `entrez_id`
crispr_21Q3_long %>%
    mutate(entrez_id = gsub("&", ";", sub("\\)", "", sub("^.+ \\(", "", gene))),
           gene_name = gsub("&", ";", sub(" \\(.+\\)$", "", gene))
           ) -> crispr_21Q3_long

### left_join `crispr_long` and `dep_2_name` to add `cell_line` column
crispr_21Q3_long %>%
  left_join(dep_2_name_21Q3, by = c("depmap_id" = "depmap_id")) -> crispr_21Q3

### rearrange columns into same column format as other datasets
crispr_21Q3 %>%
  select(depmap_id, gene, dependency, entrez_id, gene_name, cell_line) %>%
  type_convert(cols(entrez_id = "i")) -> crispr_21Q3

### saving cleaned and converted `crispr` data as .rda file
save(crispr_21Q3, file = "../eh_data/crispr_21Q3.rda",
     compress = "xz", compression_level = 9)

##########################################
## depmap `TPM_21Q3` dataset
##########################################

### loading data (downloading .csv file from online source)
TPM_21Q3 <- read_csv(file = "https://ndownloader.figshare.com/files/29124747")

### rename column first column to "depmap_id"
names(TPM_21Q3)[1] <-"depmap_id"

### gather `TPM` into long form on columns: `depmap_id`, `gene`, `expression`
TPM_21Q3 %>%
  gather(gene, rna_expression, -depmap_id) -> TPM_21Q3_long

### mutate gene into gene_name and entrez_id
TPM_21Q3_long %>%
    mutate(entrez_id = gsub("&", ";", sub("\\)", "", sub("^.+ \\(", "",gene))),
           gene_name = gsub("&", ";", sub(" \\(.+\\)$", "", gene))
           ) -> TPM_21Q3_long

### left_join join `TPM` and `dep_2_name_21Q3` to add `cell_line` column
TPM_21Q3_long %>%
  left_join(dep_2_name_21Q3, by = c("depmap_id" = "depmap_id")) -> TPM_21Q3

### rearrange columns into same column format as other datasets
TPM_21Q3 %>%
    select(depmap_id, gene, rna_expression, entrez_id, gene_name, cell_line) %>%
    type_convert(cols(entrez_id = "i")) -> TPM_21Q3

### saving cleaned and converted `TPM` data as .rda file
save(TPM_21Q3, file = "../eh_data/TPM_21Q3.rda", compress = "xz",
     compression_level = 9)
