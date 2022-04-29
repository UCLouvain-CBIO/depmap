### =========================================================================
### Make 22Q1 depmap data
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

# setwd("~/tmp/depmap/inst/scripts/")
## set environment variable to allow download from depmap website
Sys.setenv(VROOM_CONNECTION_SIZE = 500072)

##########################################
## depmap `metadata_22Q1` dataset
##########################################

### loading data (downloading .csv file from online source)
read_csv(file = "https://ndownloader.figshare.com/files/34008503"
         ) -> metadata_22Q1

#### Rename `metadata` columns to contain underscores and be in snake case
## note: "metadata_22Q1" has different columns than "metadata_22Q1"
names(metadata_22Q1)[1:22] <- c(
    "depmap_id", "cell_line_name",
    "stripped_cell_line_name", "cell_line",
    "aliases", "cosmic_id",
    "sex", "source",
    "RRID", "WTSI_master_cell_ID",
    "sample_collection_site", "primary_or_metastasis",
    "primary_disease", "subtype_disease",
    "age", "sanger_id",
    "additional_info", "lineage",
    "lineage_subtype", "lineage_sub_subtype",
    "lineage_molecular_subtype", "culture_type")

    ## these columns have been moved the achilles 
    # "Achilles_n_replicates", "cell_line_NNMD", "culture_medium",
    # "cas9_activity", 

### saving cleaned and converted `metadata` data as .rda file
save(metadata_22Q1, file = "../eh_data/metadata_22Q1.rda",
      compress = "xz", compression_level = 9)

##########################################
## `dep_2_name_22Q1 map `depmap_id` to `cell_line`
##########################################

##  generation of `metadata` subset `dep_2_name_22Q1`
## The subset of `metadata`, `dep_2_name_Q2` is used to map `cell_line`
## and depmap_id via left_join in other depmap datasets that do not contain
## both variables. If you are generating the depmap data from scratch, you will
## need to run the following code to generate the data correctly.

### `dep_2_name` to add `depmap_id` or `cell_line` to other datasets
metadata_22Q1 %>% dplyr::select(depmap_id, cell_line) -> dep_2_name_22Q1

##########################################
## depmap `mutationCalls_22Q1` dataset
##########################################

### loading data (downloading .csv file from online source)
read_csv(file = "https://ndownloader.figshare.com/files/34008434"
         ) -> mutationCalls_22Q1

## note: "mutationCalls_22Q1" has different columns than "mutationCalls_19Q1"
## the variable "VA_WES_AC" is no longer present in this dataset, unlike
## previous releases (e.g. 19Q1)!
## In the 22Q1 release the feature, "tumor_seq_allele1" was changed to
## "alt_allele"
names(mutationCalls_22Q1)[1:32] <- c(
    "gene_name", "entrez_id",
    "ncbi_build", "chromosome",
    "start_pos", "end_pos",
    "strand", "var_class",
    "var_type", "ref_allele",
    "alt_allele", "dbSNP_RS",
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
mutationCalls_22Q1 %>%
    dplyr::select(depmap_id, everything()) -> mutationCalls_22Q1

### saving cleaned and converted `mutationCalls` data as .rda file
save(mutationCalls_22Q1, file = "../eh_data/mutationCalls_22Q1.rda",
     compress = "xz", compression_level = 9)

##########################################
## depmap `copyNumber_22Q1` dataset
##########################################

### loading data (downloading .csv file from online source)
read_csv("https://ndownloader.figshare.com/files/34008428") -> copyNumber_22Q1

### rename column first column to "depmap_id"
names(copyNumber_22Q1)[1] <- "depmap_id"

### gather into long form on columns: `depmap_id`, `gene`, `logCopyNumber`
copyNumber_22Q1 %>%
  tidyr::gather(gene, log_copy_number, -depmap_id) -> copyNumber_22Q1_long

### mutate gene column into `gene_name` and `entrez_id`
copyNumber_22Q1_long %>%
    dplyr::mutate(
      entrez_id = gsub("&", ";", sub("\\)", "", sub("^.+ \\(", "", gene))),
      gene_name = gsub("&", ";", sub(" \\(.+\\)$", "", gene))
                  ) -> copyNumber_22Q1_long

### left_join `copyNumber` & `dep_2_name_22Q1` on `depmap_id`,
copyNumber_22Q1_long %>%
    dplyr::left_join(dep_2_name_22Q1, by = c("depmap_id" = "depmap_id")
                     ) -> copyNumber_22Q1

### rearrange columns into same column format as other datasets
copyNumber_22Q1 %>% 
  dplyr::select(depmap_id, gene, log_copy_number, entrez_id, gene_name,
                cell_line) %>%
  readr::type_convert(cols(entrez_id = "i")) -> copyNumber_22Q1

### saving cleaned and converted `copyNumber` data as .rda file
save(copyNumber_22Q1, file = "../eh_data/copyNumber_22Q1.rda",
     compress = "xz", compression_level = 9)

##########################################
## depmap `crispr_22Q1` dataset
##########################################

# read_csv(file = "~/Downloads/CCLE_gene_cn.csv") -> c1

### loading data (downloading .csv file from online source)
read_csv(file = "https://ndownloader.figshare.com/files/34008491"
         ) -> crispr_22Q1

### rename column first column to "depmap_id"
names(crispr_22Q1)[1] <-"depmap_id"

### gather cripsr into long form with columns: `depmap_id`, `gene`, `dependency`
crispr_22Q1 %>%
  tidyr::gather(gene, dependency, -depmap_id) -> crispr_22Q1_long

### mutate gene into `gene_name` and `entrez_id`
crispr_22Q1_long %>%
    dplyr::mutate(
        entrez_id = gsub("&", ";", sub("\\)", "", sub("^.+ \\(", "", gene))),
        gene_name = gsub("&", ";", sub(" \\(.+\\)$", "", gene))
                  ) -> crispr_22Q1_long

### left_join `crispr_long` and `dep_2_name` to add `cell_line` column
crispr_22Q1_long %>%
  dplyr::left_join(dep_2_name_22Q1, by = c("depmap_id" = "depmap_id")
                   ) -> crispr_22Q1

### rearrange columns into same column format as other datasets
crispr_22Q1 %>%
  dplyr::select(depmap_id, gene, dependency, entrez_id, gene_name,
                cell_line) %>%
  readr::type_convert(cols(entrez_id = "i")) -> crispr_22Q1

### saving cleaned and converted `crispr` data as .rda file
save(crispr_22Q1, file = "../eh_data/crispr_22Q1.rda",
     compress = "xz", compression_level = 9)

##########################################
## depmap `TPM_22Q1` dataset
##########################################

### loading data (downloading .csv file from online source)
TPM_22Q1 <- read_csv(file = "https://ndownloader.figshare.com/files/34008404")

### rename column first column to "depmap_id"
names(TPM_22Q1)[1] <-"depmap_id"

### gather `TPM` into long form on columns: `depmap_id`, `gene`, `expression`
TPM_22Q1 %>%
  tidyr::gather(gene, rna_expression, -depmap_id) -> TPM_22Q1_long

### mutate gene into gene_name and entrez_id
TPM_22Q1_long %>%
    dplyr::mutate(
        entrez_id = gsub("&", ";", sub("\\)", "", sub("^.+ \\(", "", gene))),
        gene_name = gsub("&", ";", sub(" \\(.+\\)$", "", gene))
                  ) -> TPM_22Q1_long

### left_join join `TPM` and `dep_2_name_22Q1` to add `cell_line` column
TPM_22Q1_long %>%
  dplyr::left_join(dep_2_name_22Q1, by = c("depmap_id" = "depmap_id")
                   ) -> TPM_22Q1

### rearrange columns into same column format as other datasets
TPM_22Q1 %>%
    dplyr::select(depmap_id, gene, rna_expression, entrez_id, gene_name,
                  cell_line) %>%
    readr::type_convert(cols(entrez_id = "i")) -> TPM_22Q1

### saving cleaned and converted `TPM` data as .rda file
save(TPM_22Q1, file = "../eh_data/TPM_22Q1.rda", compress = "xz",
     compression_level = 9)

##########################################
## depmap `gene_summaries_22Q1` dataset
##########################################
read_csv(file = "https://depmap.org/portal/api/download/gene_dep_summary"
         ) -> gene_summaries_22Q1

names(gene_summaries_22Q1)[1:7] <- c(
  "entrez_id", "gene_name", "dataset", "dependent_cell_lines",
  "cell_lines_with_data", "strongly_selective", "common_essential")

## remove "DependencyEnum." from the dataset variable
gene_summaries_22Q1$dataset <- sub("DependencyEnum.", "",
                                   gene_summaries_22Q1$dataset)

### saving cleaned and converted `metadata` data as .rda file
save(gene_summaries_22Q1, file = "../eh_data/gene_summary_22Q1.rda",
      compress = "xz", compression_level = 9)

##########################################
## depmap `achilles_metadata_22Q1` dataset
##########################################
read_csv(file = "https://ndownloader.figshare.com/files/34008386"
         ) -> achilles_metadata

names(achilles_metadata)[1:6] <- c(
  "depmap_id", "achilles_n_replicates", "cell_line_NNMD", "culture_type",
  "culture_medium", "cas9_activity")

achilles_metadata %>% 
  dplyr::left_join(dep_2_name_22Q1, by = "depmap_id") %>%
  dplyr::select(depmap_id, cell_line, everything()) -> achilles_metadata_22Q1

### saving cleaned and converted `metadata` data as .rda file
save(achilles_metadata_22Q1, file = "../eh_data/achilles_22Q1.rda",
      compress = "xz", compression_level = 9)

#################################################################
## depmap `drug_sensativity_21Q2` dataset merged with screen info
#################################################################

### `dep_2_name` to add `depmap_id` or `cell_line` to other datasets
library("depmap")
library("ExperimentHub")
eh <- ExperimentHub()
query(eh, "depmap")
eh[["EH3086"]] %>% dplyr::select(depmap_id, cell_line) -> dep_2_name_19Q3

## data cleaning of `drug_sensativity` dataset and screen info
read_csv("https://ndownloader.figshare.com/files/20237715") %>%
  dplyr::rename(compound = column_name) -> screen_info
eh[["EH3087"]] -> drug_dep_19Q3

### gather drug_sensativity into long form with columns: depmap_id, compound and
### dependency. Additional screen info is also added. Lastly, rearrange columns
### into same column format as other datasets
drug_dep_19Q3 %>%
  dplyr::left_join(screen_info, by = c("compound" = "compound")) %>% 
  dplyr::select(depmap_id, cell_line, compound, dependency, everything()) %>%
  dplyr::rename(disease_area = disease.area) -> drug_sensativity_21Q2

### saving cleaned and converted `drug_sensativity` data as .rda file
save(drug_sensativity_21Q2, file = "../eh_data/drug_sensativity_21Q2.rda",
     compress = "xz", compression_level = 9)