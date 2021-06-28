### =========================================================================
### Make 21Q1 depmap data
### -------------------------------------------------------------------------

## This scripts documents how to download and generate the data files.
## Note 1: This scipt assumes (!!!) that it is run in ./depmap/inst/scripts/ and
## saves the resulting .rda files in ./depmap/inst/data
## (e.g. *setwd(./depmap/inst/scripts/)*)
## Note 2: the Broad Institute may change the download urls for these datasets.
## If the link to one of these datasets is broken, please contact the package
## maintainer. All Depmap data can be downloaded from the API at
## https://depmap.org/portal/download/ even if the specific links may change

library("readr")
library("dplyr")
library("tidyr")
library("ExperimentHub")

##########################################
## depmap `metadata_21Q2` dataset
##########################################

### loading data (downloading .csv file from online source)
metadata_21Q2 <- read_csv("https://ndownloader.figshare.com/files/27902376")

#### Rename `metadata` columns to contain underscores and be in snake case
## note: "metadata_21Q2" has different columns than "metadata_21Q2"
names(metadata_21Q2)[1:26] <- c(
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
save(metadata_21Q2, file = "../eh_data/metadata_21Q2.rda",
      compress = "xz", compression_level = 9)

##########################################
## `dep_2_name_21Q2 map `depmap_id` to `cell_line`
##########################################

##  generation of `metadata` subset `dep_2_name_21Q2`
## The subset of `metadata`, `dep_2_name_Q2` is used to map `cell_line`
## and depmap_id via left_join in other depmap datasets that do not contain
## both variables. If you are generating the depmap data from scratch, you will
## need to run the following code to generate the data correctly.

### `dep_2_name` to add `depmap_id` or `cell_line` to other datasets
metadata_21Q2 %>% dplyr::select(depmap_id, cell_line) -> dep_2_name_21Q2

##########################################
## depmap `mutationCalls_21Q2` dataset
##########################################

### loading data (downloading .csv file from online source)
mutationCalls_21Q2 <- read_csv("https://ndownloader.figshare.com/files/27902118")

## note: "mutationCalls_21Q2" has different columns than "mutationCalls_19Q1"
## the variable "VA_WES_AC" is no longer present in this dataset, unlike
## previous releases (e.g. 19Q1)!
names(mutationCalls_21Q2)[1:32] <- c(
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
mutationCalls_21Q2 %>%
    dplyr::select(depmap_id, everything()) -> mutationCalls_21Q2

### saving cleaned and converted `mutationCalls` data as .rda file
save(mutationCalls_21Q2, file = "../eh_data/mutationCalls_21Q2.rda",
     compress = "xz", compression_level = 9)

##########################################
## depmap `copyNumber_21Q2` dataset
##########################################

### loading data (downloading .csv file from online source)
copyNumber_21Q2 <- read_csv("https://ndownloader.figshare.com/files/27902124")

### rename column first column to "depmap_id"
names(copyNumber_21Q2)[1] <- "depmap_id"

### gather into long form on columns: `depmap_id`, `gene`, `logCopyNumber`
copyNumber_21Q2 %>%
  gather(gene, log_copy_number, -depmap_id) -> copyNumber_21Q2_long

### mutate gene column into `gene_name` and `entrez_id`
copyNumber_21Q2_long %>%
    mutate(entrez_id = gsub("&", ";", sub("\\)", "", sub("^.+ \\(", "", gene))),
           gene_name = gsub("&", ";", sub(" \\(.+\\)$", "", gene))
           ) -> copyNumber_21Q2_long

### left_join `copyNumber` & `dep_2_name_21Q2` on `depmap_id`,
 copyNumber_21Q2_long %>%
    left_join(dep_2_name_21Q2,
              by = c("depmap_id" = "depmap_id")) -> copyNumber_21Q2

### rearrange columns into same column format as other datasets
copyNumber_21Q2 %>% 
  select(depmap_id, gene, log_copy_number, entrez_id, gene_name, cell_line) %>%
  type_convert(cols(entrez_id = "i")) -> copyNumber_21Q2

### saving cleaned and converted `copyNumber` data as .rda file
save(copyNumber_21Q2, file = "../eh_data/copyNumber_21Q2.rda",
     compress = "xz", compression_level = 9)

##########################################
## depmap `crispr_21Q2` dataset
##########################################

### loading data (downloading .csv file from online source)
crispr_21Q2 <- read_csv("https://ndownloader.figshare.com/files/27902226")

### rename column first column to "depmap_id"
names(crispr_21Q2)[1] <-"depmap_id"

### gather cripsr into long form with columns: `depmap_id`, `gene`, `dependency`
crispr_21Q2 %>%
  gather(gene, dependency, -depmap_id) -> crispr_21Q2_long

### mutate gene into `gene_name` and `entrez_id`
crispr_21Q2_long %>%
    mutate(entrez_id = gsub("&", ";", sub("\\)", "", sub("^.+ \\(", "", gene))),
           gene_name = gsub("&", ";", sub(" \\(.+\\)$", "", gene))
           ) -> crispr_21Q2_long

### left_join `crispr_long` and `dep_2_name` to add `cell_line` column
crispr_21Q2_long %>%
  left_join(dep_2_name_21Q2, by = c("depmap_id" = "depmap_id")) -> crispr_21Q2

### rearrange columns into same column format as other datasets
crispr_21Q2 %>%
  select(depmap_id, gene, dependency, entrez_id, gene_name, cell_line) %>%
  type_convert(cols(entrez_id = "i")) -> crispr_21Q2

### saving cleaned and converted `crispr` data as .rda file
save(crispr_21Q2, file = "../eh_data/crispr_21Q2.rda",
     compress = "xz", compression_level = 9)

##########################################
## depmap `TPM_21Q2` dataset
##########################################

### loading data (downloading .csv file from online source)
TPM_21Q2 <- read_csv("https://ndownloader.figshare.com/files/27902091")

### rename column first column to "depmap_id"
names(TPM_21Q2)[1] <-"depmap_id"

### gather `TPM` into long form on columns: `depmap_id`, `gene`, `expression`
TPM_21Q2 %>%
  gather(gene, rna_expression, -depmap_id) ->   TPM_21Q2_long

### mutate gene into gene_name and entrez_id
TPM_21Q2_long %>%
    mutate(entrez_id = gsub("&", ";", sub("\\)", "", sub("^.+ \\(", "",gene))),
           gene_name = gsub("&", ";", sub(" \\(.+\\)$", "", gene))
           ) -> TPM_21Q2_long

### left_join join `TPM` and `dep_2_name_21Q2` to add `cell_line` column
TPM_21Q2_long %>%
  left_join(dep_2_name_21Q2, by = c("depmap_id" = "depmap_id")
            ) -> TPM_21Q2

### rearrange columns into same column format as other datasets
TPM_21Q2 %>%
    select(depmap_id, gene, rna_expression, entrez_id, gene_name, cell_line) %>%
    type_convert(cols(entrez_id = "i")) -> TPM_21Q2

### saving cleaned and converted `TPM` data as .rda file
save(TPM_21Q2, file = "../eh_data/TPM_21Q2.rda", compress = "xz",
     compression_level = 9)

#################################################################
## depmap `drug_sensativity_19Q3` dataset merged with screen info
#################################################################

### `dep_2_name` to add `depmap_id` or `cell_line` to other datasets
library("depmap")
eh <- ExperimentHub()
query(eh, "depmap")
eh[["EH3086"]] %>% dplyr::select(depmap_id, cell_line) -> dep_2_name_19Q3

## data cleaning of `drug_sensativity` dataset and screen info
read_csv("https://ndownloader.figshare.com/files/20237715") %>% 
  rename(compound = column_name) -> screen_info
# drug_dep_19Q3 <- read_csv("https://ndownloader.figshare.com/files/17741420")
eh[["EH3087"]] -> drug_dep_19Q3

### rename column first column to "depmap_id"
#names(drug_dep_19Q3)[1] <- "depmap_id"
#drug_dep_19Q3$depmap_id <- gsub("_FAILED_STR", "", drug_dep_19Q3$depmap_id)

### gather drug_sensativity into long form with columns: depmap_id, compound and
### dependency. Additional screen info is also added. Lastly, rearrange columns
### into same column format as other datasets
drug_dep_19Q3 %>%
  # gather(key = compound, value = dependency, -depmap_id) %>%
  # left_join(dep_2_name_19Q3, by = c("depmap_id" = "depmap_id")) %>% 
  left_join(screen_info, by = c("compound" = "compound")) %>% 
  select(depmap_id, cell_line, compound, dependency, everything()) %>%
  rename(disease_area = disease.area) -> drug_sensativity_19Q3

### saving cleaned and converted `drug_sensativity` data as .rda file
save(drug_sensativity_19Q3, file = "../eh_data/drug_sensativity_19Q3.rda",
     compress = "xz", compression_level = 9)

#################################################################
## fix entrez_id in TPM datasets 19Q1 through 21Q1 
#################################################################
# library("readr")
# library("dplyr")
# library("tidyr")
# library("ExperimentHub")
# library("depmap")
# eh <- ExperimentHub()
# query(eh, "depmap")

## old datasets will be downloaded via EH and saved
# eh[["EH2264"]] %>% rename(entrez_id = ensembl_id) -> TPM_19Q1
# save(TPM_19Q1, file = "../eh_data/TPM_19Q1.rda", compress = "xz",
#      compression_level = 9)
# rm(TPM_19Q1)
# eh[["EH2554"]] %>% rename(entrez_id = ensembl_id) -> TPM_19Q2
# save(TPM_19Q2, file = "../eh_data/TPM_19Q2.rda", compress = "xz",
#      compression_level = 9)
# rm(TPM_19Q2)
eh[["EH3084"]] %>% rename(entrez_id = ensembl_id) -> TPM_19Q3
save(TPM_19Q3, file = "../eh_data/TPM_19Q3.rda", compress = "xz",
     compression_level = 9)
rm(TPM_19Q3)
eh[["EH3242"]] %>% rename(entrez_id = ensembl_id) -> TPM_19Q4
save(TPM_19Q4, file = "../eh_data/TPM_19Q4.rda", compress = "xz",
     compression_level = 9)
rm(TPM_19Q4)
eh[["EH3292"]] %>% rename(entrez_id = ensembl_id) -> TPM_20Q1
save(TPM_20Q1, file = "../eh_data/TPM_20Q1.rda", compress = "xz",
     compression_level = 9)
rm(TPM_20Q1)
eh[["EH3456"]] %>% rename(entrez_id = ensembl_id) -> TPM_20Q2
save(TPM_20Q2, file = "../eh_data/TPM_20Q2.rda", compress = "xz",
     compression_level = 9)
rm(TPM_20Q2)
eh[["EH3799"]] %>% rename(entrez_id = ensembl_id) -> TPM_20Q3
save(TPM_20Q3, file = "../eh_data/TPM_20Q3.rda", compress = "xz",
     compression_level = 9)
rm(TPM_20Q3)
eh[["EH3962"]] %>% rename(entrez_id = ensembl_id) -> TPM_20Q4
save(TPM_20Q4, file = "../eh_data/TPM_20Q4.rda", compress = "xz",
     compression_level = 9)
rm(TPM_20Q4)
eh[["EH5360"]] %>% rename(entrez_id = ensembl_id) -> TPM_21Q1
save(TPM_21Q1, file = "../eh_data/TPM_21Q1.rda", compress = "xz",
     compression_level = 9)
rm(TPM_21Q1)