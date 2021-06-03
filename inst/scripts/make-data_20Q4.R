### =========================================================================
### Make 20Q4 depmap data
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
## depmap `metadata_20Q4` dataset
##########################################

### loading data (downloading .csv file from online source)
url_44 <- "https://ndownloader.figshare.com/files/25494443"
metadata_20Q4 <- read_csv(url_44)

#### Rename `metadata` columns to contain underscores and be in snake case
## note: "metadata_20Q4" has different columns than "metadata_20Q4"
names(metadata_20Q4)[1:26] <-c(
    "depmap_id", "cell_line_name", "stripped_cell_line_name", "cell_line",
    "aliases", "cosmic_id", "sex", "source", "Achilles_n_replicates",
    "cell_line_NNMD", "culture_type", "culture_medium", "cas9_activity",
    "RRID", "WTSI_master_cell_ID", "sample_collection_site",
    "primary_or_metastasis", "primary_disease", "subtype_disease", "age",
    "sanger_id", "additional_info", "lineage", "lineage_subtype",
    "lineage_sub_subtype", "lineage_molecular_subtype")

### saving cleaned and converted `metadata` data as .rda file
save(metadata_20Q4, file = "../eh_data/metadata_20Q4.rda",
     compress = "xz", compression_level = 9)

##########################################
## `depmap_id_to_name_20Q4 map `depmap_id` to `cell_line`
##########################################

##  generation of `metadata` subset `depmap_id_to_name_20Q4`
## The subset of `metadata`, `depmap_id_to_name_Q2` is used to map `cell_line`
## and depmap_id via left_join in other depmap datasets that do not contain
## both variables. If you are generating the depmap data from scratch, you will
## need to run the following code to generate the data correctly.

### `depmap_id_to_name` to add `depmap_id` or `cell_line` to other datasets
depmap_id_to_name_20Q4 <- metadata_20Q4 %>% dplyr::select(depmap_id, cell_line)

##########################################
## depmap `mutationCalls_20Q4` dataset
##########################################

### loading data (downloading .csv file from online source)
url_45 <- "https://ndownloader.figshare.com/files/25494419"
mutationCalls_20Q4 <- read_csv(url_45)

## note: "mutationCalls_20Q4" has different columns than "mutationCalls_19Q1"
## the variable "VA_WES_AC" is no longer present in this dataset, unlike
## previous releases (e.g. 19Q1)! 
names(mutationCalls_20Q4)[1:32] <- c(
    "gene_name", "entrez_id", "ncbi_build", "chromosome", "start_pos",
    "end_pos", "strand", "var_class","var_type", "ref_allele",
    "tumor_seq_allele1", "dbSNP_RS", "dbSNP_val_status", "genome_change",
    "annotation_trans", "depmap_id", "cDNA_change", # "tumor_sample_barcode",
    "codon_change", "protein_change", "is_deleterious", "is_tcga_hotspot",
    "tcga_hsCnt", "is_cosmic_hotspot", "cosmic_hsCnt", "ExAC_AF",
    "var_annotation",  "CGA_WES_AC", "HC_AC", "RD_AC", "RNAseq_AC",
    "sanger_WES_AC", "WGS_AC") # "sanger_recalib_WES_AC",

### rearrange columns into same column format as other datasets
mutationCalls_20Q4 <- mutationCalls_20Q4 %>%
    dplyr::select(depmap_id, everything())

### saving cleaned and converted `mutationCalls` data as .rda file
save(mutationCalls_20Q4, file = "../eh_data/mutationCalls_20Q4.rda",
     compress = "xz", compression_level = 9)

##########################################
## depmap `copyNumber_20Q4` dataset
##########################################

### loading data (downloading .csv file from online source)
url_46 <- "https://ndownloader.figshare.com/files/25494416"
copyNumber_20Q4 <- read_csv(url_46)

### rename column first column to "depmap_id"
names(copyNumber_20Q4)[1] <- "depmap_id"

### gather into long form on columns: `depmap_id`, `gene`, `logCopyNumber`
copyNumber_20Q4_long <- gather(copyNumber_20Q4, gene, log_copy_number,
                               -depmap_id)

### mutate gene column into `gene_name` and `entrez_id`
copyNumber_20Q4_long <- copyNumber_20Q4_long %>% 
    mutate(entrez_id = gsub("&", ";", sub("\\)", "", sub("^.+ \\(", "", gene))),
           gene_name = gsub("&", ";", sub(" \\(.+\\)$", "", gene))) 

### left_join `copyNumber` & `depmap_id_to_name_20Q4` on `depmap_id`, 
## `cell_line`     
copyNumber_20Q4 <- copyNumber_20Q4_long %>% 
    left_join(depmap_id_to_name_20Q4, by = c("depmap_id" = "depmap_id"))

### rearrange columns into same column format as other datasets
copyNumber_20Q4 <- copyNumber_20Q4 %>% 
                        dplyr::select(depmap_id, gene, log_copy_number,
                                      entrez_id, gene_name, cell_line) %>%
                                      type_convert(cols(entrez_id = "i"))

### saving cleaned and converted `copyNumber` data as .rda file
save(copyNumber_20Q4, file = "../eh_data/copyNumber_20Q4.rda",
     compress = "xz", compression_level = 9)

##########################################
## depmap `crispr_20Q4` dataset
##########################################

### loading data (downloading .csv file from online source)
url_47 <- "https://ndownloader.figshare.com/files/25494359"
crispr_20Q4 <- read_csv(url_47)

### rename column first column to "depmap_id"
names(crispr_20Q4)[1] <-"depmap_id"

### gather cripsr into long form with columns: `depmap_id`, `gene`, `dependency`
crispr_20Q4_long <- gather(crispr_20Q4, gene, dependency, -depmap_id)

### mutate gene into `gene_name` and `entrez_id`
crispr_20Q4_long <- crispr_20Q4_long %>% 
    mutate(entrez_id = gsub("&", ";", sub("\\)", "", sub("^.+ \\(", "", gene))),
           gene_name = gsub("&", ";", sub(" \\(.+\\)$", "", gene))) 

### left_join `crispr_long` and `depmap_id_to_name` to add `cell_line` column   
crispr_20Q4 <- crispr_20Q4_long %>% left_join(depmap_id_to_name_20Q4, 
                                    by = c("depmap_id" = "depmap_id"))

### rearrange columns into same column format as other datasets
crispr_20Q4 <- crispr_20Q4 %>% dplyr::select(depmap_id, gene,
                                             dependency, entrez_id,
                                             gene_name, cell_line) %>%
                                             type_convert(cols(entrez_id = "i"))

### saving cleaned and converted `crispr` data as .rda file
save(crispr_20Q4, file = "../eh_data/crispr_20Q4.rda",
     compress = "xz", compression_level = 9)

##########################################
## depmap `TPM_20Q4` dataset
##########################################

### loading data (downloading .csv file from online source)
url_48 <- "https://ndownloader.figshare.com/files/25494389"
TPM_20Q4 <- read_csv(url_48)

### rename column first column to "depmap_id"
names(TPM_20Q4)[1] <-"depmap_id"

### gather `TPM` into long form on columns: `depmap_id`, `gene`, `expression`
TPM_20Q4_long <- gather(TPM_20Q4, gene, rna_expression, -depmap_id)

### mutate gene into gene_name and ensembl_id
TPM_20Q4_long %>% 
    mutate(ensembl_id = gsub("&", ";", sub("\\)", "", sub("^.+ \\(", "",gene))),
           gene_name = gsub("&", ";", sub(" \\(.+\\)$", "", gene))
           ) -> TPM_20Q4_long 

### left_join join `TPM` and `depmap_id_to_name_20Q4` to add `cell_line` column
TPM_20Q4_long %>%
    left_join(depmap_id_to_name_20Q4, by = c("depmap_id" = "depmap_id")
              ) -> TPM_20Q4

### rearrange columns into same column format as other datasets
TPM_20Q4 %>%
    select(depmap_id, gene, rna_expression, entrez_id, gene_name, cell_line) %>%
    type_convert(cols(entrez_id = "i")) -> TPM_20Q4

### saving cleaned and converted `TPM` data as .rda file
save(TPM_20Q4, file = "../eh_data/TPM_20Q4.rda", compress = "xz",
     compression_level = 9)
