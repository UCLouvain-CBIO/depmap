### =========================================================================
### Make 19Q1 depmap data
### -------------------------------------------------------------------------
###

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
## EH2266 depmap `metadata_19Q1` dataset
##########################################

##  data cleaning of `metadata` dataset

### loading data (downloading .csv file from online source)
url_1 <- "https://depmap.org/portal/download/api/download/external?file_name=processed_portal_downloads%2Fdepmap-public-cell-line-metadata-183e.4%2FDepMap-2019q1-celllines_v2.csv"
depmap_19Q1_cell_lines <- read_csv(url_1)

### DepMap-2019q1-celllines.csv data renamed to `metadata`
metadata_19Q1 <- depmap_19Q1_cell_lines

#### Rename `metadata` columns to contain underscores and be in camel case
## names(metadata) 
names(metadata_19Q1)[1:9] <- c("depmap_id", "cell_line", "aliases", "cosmic_id", 
                                "sanger_id", "primary_disease",
                               "subtype_disease", "gender", "source")
### visual check
# head(metadata_19Q1)

### saving cleaned and converted `metadata` data as .rda file
save(metadata_19Q1, file = "../eh_data/metadata_19Q1.rda",
     compress = "xz", compression_level = 9)

## access the data on ExperimentHub
# hub <- ExperimentHub()
# x <- query(hub, "depmap")
# EH2266 <- x[["EH2266"]]

##########################################
## `depmap_id_to_name_19Q1` map `depmap_id` to `cell_line`
##########################################

## The subset of `metadata`, `depmap_id_to_name_19Q1` is used to map 
## `cell_line` and depmap_id via left_join in other depmap datasets that do not
## contain both variables. If you are generating the depmap data from scratch,
## you will need to run the following code to generate the data correctly.

### `depmap_id_to_name` to add `depmap_id` or `cell_line` to other datasets
depmap_id_to_name_19Q1 <- metadata_19Q1 %>% select(depmap_id, cell_line)

### visual check
# head(depmap_id_to_name_19Q1)

##########################################
## EH2265 depmap `mutationCalls_19Q1` dataset
##########################################

## data cleaning of `mutationCalls` dataset

### loading data (downloading .csv file from online source)
url_2 <- "https://depmap.org/portal/download/api/download/external?file_name=ccle%2Fdepmap-mutation-calls-9a1a.9%2Fdepmap_19Q1_mutation_calls_v2.csv"
depmap_19Q1_mutation_calls <- read_csv(url_2)

### depmap_19Q1_mutation_calls data renamed to `mutationCalls`
mutationCalls_19Q1 <- depmap_19Q1_mutation_calls

#### drop superfluous first row
mutationCalls_19Q1[[1]] <- NULL

#### rename last column to depmap_id
#names(mutationCalls_19Q1)
names(mutationCalls_19Q1)[1:35] <- c("gene_name", "entrez_id", "ncbi_build",            
                                    "chromosome", "start_pos", "end_pos",
                                    "strand", "var_class","var_type",
                                    "ref_allele","tumor_seq_allele1","dbSNP_RS", 
                                    "dbSNP_val_status", "genome_change",
                                    "annotation_transcript",
                                    "tumor_sample_barcode", "cDNA_change",
                                    "codon_change", "protein_change",        
                                    "is_deleterious", "is_tcga_hotspot",
                                    "tcga_hsCnt", "is_cosmic_hotspot",
                                    "cosmic_hsCnt", "ExAC_AF", "VA_WES_AC",
                                    "CGA_WES_AC", "sanger_WES_AC", 
                                    "sanger_recalib_WES_AC","RNAseq_AC","HC_AC",                 
                                    "RD_AC", "WGS_AC", "var_annotation",
                                    "depmap_id") #names converted to snake case

### rearrange columns into same column format as other datasets
mutationCalls_19Q1 <- mutationCalls_19Q1 %>%
    select(depmap_id, gene_name, entrez_id, ncbi_build, chromosome, start_pos,
           end_pos, strand, var_class, var_type, ref_allele, tumor_seq_allele1,
           dbSNP_RS, dbSNP_val_status, genome_change, annotation_transcript,
           tumor_sample_barcode, cDNA_change, codon_change, protein_change,
           is_deleterious, is_tcga_hotspot, tcga_hsCnt, is_cosmic_hotspot,
           cosmic_hsCnt, ExAC_AF, VA_WES_AC, CGA_WES_AC, sanger_WES_AC,
           sanger_recalib_WES_AC, RNAseq_AC, HC_AC, RD_AC, WGS_AC,
           var_annotation)

### visual check
# head(mutationCalls_19Q1)

### saving cleaned and converted `mutationCalls` data as .rda file
save(mutationCalls_19Q1, file = "../eh_data/mutationCalls_19Q1.rda",
     compress = "xz", compression_level = 9)

## access the data on ExperimentHub
# hub <- ExperimentHub()
# x <- query(hub, "depmap")
# EH2265 <- x[["EH2265"]]

##########################################
## EH2262 depmap `copyNumber_19Q1` dataset
##########################################

##  data cleaning of `copyNumber` dataset 

### loading data (downloading .csv file from online source)
url_3 <- "https://depmap.org/portal/download/api/download/external?file_name=ccle%2Fdepmap-wes-cn-data-97cc.14%2Fpublic_19Q1_gene_cn.csv"
public_19Q1_gene_cn  <- read_csv(url_3)

### public_19Q1_gene_cn.csv data renamed to `copyNumber`
copyNumber_19Q1 <- public_19Q1_gene_cn

### rename column first column to "depmap_id"
names(copyNumber_19Q1)[1] <- "depmap_id"

### gather into long form on columns: `depmap_id`, `gene`, `logCopyNumber`
copyNumber_19Q1_long <- gather(copyNumber_19Q1, gene, log_copy_number,
                               -depmap_id)

### mutate gene column into `gene_name` and `entrez_id`
copyNumber_19Q1_long <- copyNumber_19Q1_long %>% 
    mutate(entrez_id = gsub("&", ";", sub("\\)", "", sub("^.+ \\(", "", gene))),
           gene_name = gsub("&", ";", sub(" \\(.+\\)$", "", gene))) 

### left_join `copyNumber` & `depmap_id_to_name_19Q1` on `depmap_id`,`cell_line`     
copyNumber_19Q1 <- copyNumber_19Q1_long %>% 
    left_join(depmap_id_to_name_19Q1, by = c("depmap_id" = "depmap_id"))

### rearrange columns into same column format as other datasets
copyNumber_19Q1 <- copyNumber_19Q1 %>% 
                                    select(depmap_id, gene, log_copy_number,
                                           entrez_id, gene_name, cell_line) %>%
                                           type_convert(cols(entrez_id = "i"))
### visual check
# head(copyNumber_19Q1)

### saving cleaned and converted `copyNumber` data as .rda file
save(copyNumber_19Q1, file = "../eh_data/copyNumber_19Q1.rda",
     compress = "xz", compression_level = 9)

## access the data on ExperimentHub
# hub <- ExperimentHub()
# x <- query(hub, "depmap")
# EH2262 <- x[["EH2262"]]

##########################################
## EH2261 depmap `crispr_19Q1` dataset
##########################################

##  data cleaning of `crispr` dataset`

### loading data (downloading .csv file from online source)
url_4 <- "https://ndownloader.figshare.com/files/14221385"
gene_effect_corrected <- read_csv(url_4)

### gene_effect_corrected.csv data renamed to `crispr`
crispr_19Q1 <- gene_effect_corrected

### rename column first column to "depmap_id"
names(crispr_19Q1)[1] <-"depmap_id"

### gather cripsr into long form with columns: `depmap_id`, `gene`, `dependency`
crispr_19Q1_long <- gather(crispr_19Q1, gene, dependency, -depmap_id)

### mutate gene into `gene_name` and `entrez_id`
crispr_19Q1_long <- crispr_19Q1_long %>% 
    mutate(entrez_id = gsub("&", ";", sub("\\)", "", sub("^.+ \\(", "", gene))),
           gene_name = gsub("&", ";", sub(" \\(.+\\)$", "", gene))) 

### left_join `crispr_long` & `depmap_id_to_name_19Q1` to add `cell_line` column
crispr_19Q1 <- crispr_19Q1_long %>% left_join(depmap_id_to_name_19Q1, 
                                    by = c("depmap_id" = "depmap_id"))

### rearrange columns into same column format as other datasets
crispr_19Q1 <- crispr_19Q1 %>% select(depmap_id, gene, dependency, entrez_id,
                                      gene_name, cell_line) %>%
                                      type_convert(cols(entrez_id = "i"))
### visual check
# head(crispr_19Q1)

### saving cleaned and converted `crispr` data as .rda file
save(crispr_19Q1, file = "../eh_data/crispr_19Q1.rda",
     compress = "xz", compression_level = 9)

## access the data on ExperimentHub
# hub <- ExperimentHub()
# x <- query(hub, "depmap")
# EH2261 <- x[["EH2261"]]

##########################################
## EH2264 depmap `TPM_19Q1` dataset
##########################################

## data cleaning of `TPM` dataset

### loading data (downloading .csv file from online source)
url_5 <- "https://depmap.org/portal/download/api/download/external?file_name=ccle%2Fdepmap-rnaseq-expression-data-ccd0.12%2FCCLE_depMap_19Q1_TPM.csv"
CCLE_depMap_19Q1_TPM  <- read_csv(url_5)

### CCLE_depMap_19Q1_TPM.csv data renamed to `TPM`
TPM_19Q1 <- CCLE_depMap_19Q1_TPM

### rename column first column to "depmap_id"
names(TPM_19Q1)[1] <-"depmap_id"

### gather `TPM` into long form on columns: `depmap_id`, `gene`, `expression`
TPM_19Q1_long <- gather(TPM_19Q1, gene, expression, -depmap_id)

### mutate gene into gene_name and ensembl_id
TPM_19Q1_long <- TPM_19Q1_long %>% 
    mutate(ensembl_id = gsub("&", ";", sub("\\)", "", sub("^.+ \\(", "",gene))),
           gene_name = gsub("&", ";", sub(" \\(.+\\)$", "", gene))) 

### left_join join `TPM` and `depmap_id_to_name_19Q1` to add `cell_line` column
TPM_19Q1 <- TPM_19Q1_long %>% left_join(depmap_id_to_name_19Q1, 
                              by = c("depmap_id" = "depmap_id"))

### rearrange columns into same column format as other datasets
TPM_19Q1 <- TPM_19Q1 %>% select(depmap_id, gene, expression, ensembl_id,
                                gene_name, cell_line)
### visual check
# head(TPM_19Q1)

### saving cleaned and converted `TPM` data as .rda file
save(TPM_19Q1, file = "../eh_data/TPM_19Q1.rda", compress="xz",
     compression_level=9)

## access the data on ExperimentHub
# hub <- ExperimentHub()
# x <- query(hub, "depmap")
# EH2264 <- x[["EH2264"]]

##########################################
## EH2263 depmap `RPPA_19Q1` dataset
##########################################

## data cleaning of `RPPA` dataset

### loading data (downloading .csv file from online source)
url_6 <- "https://depmap.org/portal/download/api/download/external?file_name=ccle%2FCCLE_RPPA_20180123.csv"
CCLE_RPPA_20180123  <- read_csv(url_6)

### CCLE_RPPA_20180123.csv data renamed to `RPPA`
RPPA_19Q1 <- CCLE_RPPA_20180123

### rename column first column to "cell_line"
names(RPPA_19Q1)[1] <-"cell_line"

### gather cell line columns and split gene name into gene_name and entrez_id
RPPA_19Q1_long <- RPPA_19Q1 %>% gather(antibody, expression, -cell_line)

### join cell_line name    
RPPA_19Q1 <- RPPA_19Q1_long %>% left_join(depmap_id_to_name_19Q1, 
                                by = c("cell_line" = "cell_line"))

### rearrange columns into same column format as other datasets
RPPA_19Q1 <- RPPA_19Q1 %>% select(cell_line, antibody, expression, depmap_id)

### visual check
# head(RPPA_19Q1)

### saving cleaned and converted `RPPA` data as .rda file
save(RPPA_19Q1, file="../eh_data/RPPA_19Q1.rda", compress="xz",
     compression_level=9)

## access the data on ExperimentHub
# hub <- ExperimentHub()
# x <- query(hub, "depmap")
# EH2263 <- x[["EH2263"]]

##########################################
## EH2260 depmap `rnai_19Q1` dataset
##########################################

## data cleaning of `rnai` dataset

### loading data (downloading .csv file from online source)
url_7 <- "https://ndownloader.figshare.com/files/13515395"
D2_combined_genetic_dependency_scores  <- read_csv(url_7)

### D2_combined_genetic_dependency_scores.csv data renamed to `rnai`
rnai_19Q1 <- D2_combined_genetic_dependency_scores

### rename column first column to "gene"
names(rnai_19Q1)[1] <- "gene"

### gather rnai into long form with columns: depmap_id, gene and dependency
rnai_19Q1 <- gather(rnai_19Q1, key = cell_line, value = dependency, -gene) %>%
    mutate(entrez_id = gsub("&", ";", sub("\\)", "", sub("^.+ \\(", "", gene))),
           gene_name = gsub("&", ";", sub(" \\(.+\\)$", "", gene))) %>%
    left_join(depmap_id_to_name_19Q1, by = c("cell_line" = "cell_line"))

### rearrange columns into same column format as other datasets
rnai_19Q1 <- rnai_19Q1 %>% select(gene, cell_line, dependency, entrez_id,
                                  gene_name, depmap_id) %>%
                                  type_convert(cols(entrez_id = "i"))

### visual check
# head(rnai_19Q1)

### saving cleaned and converted `rnai` data as .rda file
save(rnai_19Q1, file="../eh_data/rnai_19Q1.rda", compress="xz",
     compression_level=9)

## access the data on ExperimentHub
# hub <- ExperimentHub()
# x <- query(hub, "depmap")
# EH2260 <- x[["EH2260"]]