### =========================================================================
### Make 19Q3 depmap data
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
## EH3086 depmap `metadata_19Q3` dataset
##########################################

##  data cleaning of `metadata` dataset

### loading data (downloading .csv file from online source)
url_15 <- "https://ndownloader.figshare.com/files/16757723"
sample_info <- read_csv(url_15)

### DepMap-2019q1-celllines.csv data renamed to `metadata`
metadata_19Q3 <- sample_info
# names(metadata_19Q3)
# [1] "DepMap_ID"               "stripped_cell_line_name" "CCLE Name"              
# [4] "alias"                   "COSMIC_ID"               "lineage"                
# [7] "lineage_subtype"         "lineage_sub_subtype"     "sex"                    
# [10] "source"                  "Achilles_n_replicates"   "cell_line_NNMD"         
# [13] "culture_type"            "culture_medium"          "cas9_activity"          
# [16] "RRID"                    "sample_collection_site"  "primary_or_metastasis"  
# [19] "disease"                 "disease_subtype"         "age"                    
# [22] "Sanger_model_ID"         "additional_info"   


#### Rename `metadata` columns to contain underscores and be in camel case
## note: "metadata_19Q3" has different columns than "metadata_19Q3"
names(metadata_19Q3)[1:23] <-c("depmap_id", "stripped_cell_line_name",
                              "cell_line", "aliases", "cosmic_id", "lineage",
                              "lineage_subtype", "lineage_sub_subtype", "sex",
                              "source", "Achilles_n_replicates",
                              "cell_line_NNMD", "culture_type",
                              "culture_medium", "cas9_activity", "RRID",
                              "sample_collection_site", "primary_or_metastasis",
                              "primary_disease", "subtype_disease", "age",
                              "sanger_id", "additional_info")

### visual check
# View(metadata_19Q3)

### saving cleaned and converted `metadata` data as .rda file
save(metadata_19Q3, file = "../eh_data/metadata_19Q3.rda",
     compress = "xz", compression_level = 9)

## access the data on ExperimentHub
# hub <- ExperimentHub()
# x <- query(hub, "depmap")
# EH3086 <- x[["EH3086"]]

##########################################
## `depmap_id_to_name_19Q3 map `depmap_id` to `cell_line`
##########################################

##  generation of `metadata` subset `depmap_id_to_name_19Q3`

## The subset of `metadata`, `depmap_id_to_name_Q2` is used to map `cell_line`
## and depmap_id via left_join in other depmap datasets that do not contain
## both variables. If you are generating the depmap data from scratch, you will
## need to run the following code to generate the data correctly.

### `depmap_id_to_name` to add `depmap_id` or `cell_line` to other datasets
depmap_id_to_name_19Q3 <- metadata_19Q3 %>% dplyr::select(depmap_id, cell_line)

### visual check
# head(depmap_id_to_name_19Q3)

##########################################
## EH3085 depmap `mutationCalls_19Q3` dataset
##########################################

## data cleaning of `mutationCalls` dataset

### loading data (downloading .csv file from online source)
url_16 <- "https://ndownloader.figshare.com/files/16757702"
CCLE_mutations_19Q3 <- read_csv(url_16)

### depmap_19Q1_mutation_calls data renamed to `mutationCalls`
mutationCalls_19Q3 <- CCLE_mutations_19Q3
# head(mutationCalls_19Q3)

#### rename last column to depmap_id
# names(mutationCalls_19Q3)
# [1] "Hugo_Symbol"            "Entrez_Gene_Id"         "NCBI_Build"            
# [4] "Chromosome"             "Start_position"         "End_position"          
# [7] "Strand"                 "Variant_Classification" "Variant_Type"          
# [10] "Reference_Allele"       "Tumor_Seq_Allele1"      "dbSNP_RS"              
# [13] "dbSNP_Val_Status"       "Genome_Change"          "Annotation_Transcript"
# [16] "Tumor_Sample_Barcode"   "cDNA_Change"            "Codon_Change"          
# [19] "Protein_Change"         "isDeleterious"          "isTCGAhotspot"         
# [22] "TCGAhsCnt"              "isCOSMIChotspot"        "COSMIChsCnt"           
# [25] "ExAC_AF"                "CGA_WES_AC"             "SangerWES_AC"          
# [28] "SangerRecalibWES_AC"    "RNAseq_AC"              "HC_AC"                 
# [31] "RD_AC"                  "WGS_AC"                 "Variant_annotation"
# [34] "DepMap_ID"             

## note: "mutationCalls_19Q3" has different columns than "mutationCalls_19Q1"
## the variable "VA_WES_AC" is no longer present in this dataset, unlike
## previous releases (e.g. 19Q1)! 
names(mutationCalls_19Q3)[1:34] <- c("gene_name", "entrez_id", "ncbi_build",
                                "chromosome", "start_pos", "end_pos", "strand",
                                "var_class","var_type", "ref_allele",
                                "tumor_seq_allele1", "dbSNP_RS",
                                "dbSNP_val_status", "genome_change",
                                "annotation_transcript", "tumor_sample_barcode",
                                "cDNA_change", "codon_change", "protein_change",  
                                "is_deleterious", "is_tcga_hotspot",
                                "tcga_hsCnt", "is_cosmic_hotspot",
                                "cosmic_hsCnt", "ExAC_AF", "CGA_WES_AC",
                                "sanger_WES_AC", "sanger_recalib_WES_AC",
                                "RNAseq_AC", "HC_AC", "RD_AC", "WGS_AC",
                                "var_annotation","depmap_id")

### rearrange columns into same column format as other datasets
mutationCalls_19Q3 <- mutationCalls_19Q3 %>%
    dplyr::select(depmap_id, gene_name, entrez_id, ncbi_build, chromosome,
                  start_pos, end_pos, strand, var_class, var_type, ref_allele,
                  tumor_seq_allele1, dbSNP_RS, dbSNP_val_status, genome_change,
                  annotation_transcript, tumor_sample_barcode, cDNA_change,
                  codon_change, protein_change, is_deleterious, is_tcga_hotspot,
                  tcga_hsCnt, is_cosmic_hotspot, cosmic_hsCnt, ExAC_AF,
                  CGA_WES_AC, sanger_WES_AC, sanger_recalib_WES_AC, RNAseq_AC,
                  HC_AC, RD_AC, WGS_AC, var_annotation)

### visual check
# head(mutationCalls_19Q3)

### saving cleaned and converted `mutationCalls` data as .rda file
save(mutationCalls_19Q3, file = "../eh_data/mutationCalls_19Q3.rda",
     compress = "xz", compression_level = 9)

## access the data on ExperimentHub
# hub <- ExperimentHub()
# x <- query(hub, "depmap")
# EH3085 <- x[["EH3085"]]

##########################################
## EH3082 depmap `copyNumber_19Q3` dataset
##########################################

##  data cleaning of `copyNumber` dataset 

### loading data (downloading .csv file from online source)
url_17 <- "https://ndownloader.figshare.com/files/16757699"
CCLE_gene_cn_19Q3 <- read_csv(url_17)

### public_19Q1_gene_cn.csv data renamed to `copyNumber`
copyNumber_19Q3 <- CCLE_gene_cn_19Q3
# names(copyNumber_19Q3)

### rename column first column to "depmap_id"
names(copyNumber_19Q3)[1] <- "depmap_id"

### gather into long form on columns: `depmap_id`, `gene`, `logCopyNumber`
copyNumber_19Q3_long <- gather(copyNumber_19Q3, gene, log_copy_number,
                               -depmap_id)

### mutate gene column into `gene_name` and `entrez_id`
copyNumber_19Q3_long <- copyNumber_19Q3_long %>% 
    mutate(entrez_id = gsub("&", ";", sub("\\)", "", sub("^.+ \\(", "", gene))),
           gene_name = gsub("&", ";", sub(" \\(.+\\)$", "", gene))) 

### left_join `copyNumber` & `depmap_id_to_name_19Q3` on `depmap_id`, 
## `cell_line`     
copyNumber_19Q3 <- copyNumber_19Q3_long %>% 
    left_join(depmap_id_to_name_19Q3, by = c("depmap_id" = "depmap_id"))

### rearrange columns into same column format as other datasets
copyNumber_19Q3 <- copyNumber_19Q3 %>% 
                        dplyr::select(depmap_id, gene, log_copy_number,
                                      entrez_id, gene_name, cell_line) %>%
                                      type_convert(cols(entrez_id = "i"))
### visual check
# head(copyNumber_19Q3)

### saving cleaned and converted `copyNumber` data as .rda file
save(copyNumber_19Q3, file = "../eh_data/copyNumber_19Q3.rda",
     compress = "xz", compression_level = 9)

## access the data on ExperimentHub
# hub <- ExperimentHub()
# x <- query(hub, "depmap")
# EH3082 <- x[["EH3082"]]

##########################################
## EH3081 depmap `crispr_19Q3` dataset
##########################################

##  data cleaning of `crispr` dataset`

### loading data (downloading .csv file from online source)
url_18 <- "https://ndownloader.figshare.com/files/16757666"
Achilles_gene_effect_19Q3 <- read_csv(url_18)

### gene_effect_corrected.csv data renamed to `crispr`
crispr_19Q3 <- Achilles_gene_effect_19Q3

### visual check
# head(crispr_19Q3)

### rename column first column to "depmap_id"
names(crispr_19Q3)[1] <-"depmap_id"

### gather cripsr into long form with columns: `depmap_id`, `gene`, `dependency`
crispr_19Q3_long <- gather(crispr_19Q3, gene, dependency, -depmap_id)

### mutate gene into `gene_name` and `entrez_id`
crispr_19Q3_long <- crispr_19Q3_long %>% 
    mutate(entrez_id = gsub("&", ";", sub("\\)", "", sub("^.+ \\(", "", gene))),
           gene_name = gsub("&", ";", sub(" \\(.+\\)$", "", gene))) 

### left_join `crispr_long` and `depmap_id_to_name` to add `cell_line` column   
crispr_19Q3 <- crispr_19Q3_long %>% left_join(depmap_id_to_name_19Q3, 
                                    by = c("depmap_id" = "depmap_id"))

### rearrange columns into same column format as other datasets
crispr_19Q3 <- crispr_19Q3 %>% dplyr::select(depmap_id, gene,
                                             dependency, entrez_id,
                                             gene_name, cell_line) %>%
                                             type_convert(cols(entrez_id = "i"))
### visual check
# head(crispr_19Q3)

### saving cleaned and converted `crispr` data as .rda file
save(crispr_19Q3, file = "../eh_data/crispr_19Q3.rda",
     compress = "xz", compression_level = 9)

## access the data on ExperimentHub
# hub <- ExperimentHub()
# x <- query(hub, "depmap")
# EH3081 <- x[["EH3081"]]

##########################################
## EH3084 depmap `TPM_19Q3` dataset
##########################################

## data cleaning of `TPM` dataset

### loading data (downloading .csv file from online source)
url_19 <- "https://ndownloader.figshare.com/files/16757690"
CCLE_expression_full_19Q3 <- read_csv(url_19)

### CCLE_depMap_19Q1_TPM.csv data renamed to `TPM`
TPM_19Q3 <- CCLE_expression_full_19Q3
# names(TPM_19Q3)

### rename column first column to "depmap_id"
names(TPM_19Q3)[1] <-"depmap_id"

### gather `TPM` into long form on columns: `depmap_id`, `gene`, `expression`
TPM_19Q3_long <- gather(TPM_19Q3, gene, expression, -depmap_id)

### mutate gene into gene_name and ensembl_id
TPM_19Q3_long <- TPM_19Q3_long %>% 
    mutate(ensembl_id = gsub("&", ";", sub("\\)", "", sub("^.+ \\(", "",gene))),
           gene_name = gsub("&", ";", sub(" \\(.+\\)$", "", gene))) 

### left_join join `TPM` and `depmap_id_to_name_19Q3` to add `cell_line` column
TPM_19Q3 <- TPM_19Q3_long %>% left_join(depmap_id_to_name_19Q3, 
                              by = c("depmap_id" = "depmap_id"))

### rearrange columns into same column format as other datasets
TPM_19Q3 <- TPM_19Q3 %>% dplyr::select(depmap_id, gene, expression, ensembl_id,
                                gene_name, cell_line) %>%
                                type_convert(cols(ensembl_id = "i"))
### visual check
# head(TPM_19Q3)

### saving cleaned and converted `TPM` data as .rda file
save(TPM_19Q3, file = "../eh_data/TPM_19Q3.rda", compress="xz",
     compression_level=9)

## access the data on ExperimentHub
# hub <- ExperimentHub()
# x <- query(hub, "depmap")
# EH3084 <- x[["EH3084"]]

##########################################
## EH3083 depmap `RPPA_19Q3` dataset
##########################################

## data cleaning of `RPPA` dataset

### loading data (downloading .csv file from online source)
url_20 <- "https://depmap.org/portal/download/api/download/external?file_name=ccle%2Fccle_2019%2FCCLE_RPPA_20181003.csv"
CCLE_RPPA_20180123_19Q3 <- read_csv(url_20)

### CCLE_RPPA_20180123.csv data renamed to `RPPA`
RPPA_19Q3 <- CCLE_RPPA_20180123_19Q3
# head(RPPA_19Q3)

### rename column first column to "cell_line"
names(RPPA_19Q3)[1] <-"cell_line"

### gather cell line columns and split gene name into gene_name and entrez_id
RPPA_19Q3_long <- RPPA_19Q3 %>% gather(antibody, expression, -cell_line)

### join cell_line name    
RPPA_19Q3 <- RPPA_19Q3_long %>% left_join(depmap_id_to_name_19Q3, 
                                by = c("cell_line" = "cell_line"))

### rearrange columns into same column format as other datasets
RPPA_19Q3 <- RPPA_19Q3 %>% dplyr::select(cell_line, antibody, expression,
                                         depmap_id) 

### visual check
# head(RPPA_19Q3)

### saving cleaned and converted `RPPA` data as .rda file
save(RPPA_19Q3, file="../eh_data/RPPA_19Q3.rda", compress="xz",
     compression_level=9)

## access the data on ExperimentHub
# hub <- ExperimentHub()
# x <- query(hub, "depmap")
# EH3083 <- x[["EH3083"]]

##########################################
## EH3080 depmap `rnai_19Q3` dataset
##########################################

## data cleaning of `rnai` dataset

### loading data (downloading .csv file from online source)
url_21 <- "https://ndownloader.figshare.com/files/13515395"
D2_combined_gene_dep_scores_19Q3 <- read_csv(url_21)

### D2_combined_genetic_dependency_scores.csv data renamed to `rnai`
rnai_19Q3 <- D2_combined_gene_dep_scores_19Q3
# head(rnai_19Q3)

### rename column first column to "gene"
names(rnai_19Q3)[1] <- "gene"

### gather rnai into long form with columns: depmap_id, gene and dependency
rnai_19Q3 <- gather(rnai_19Q3, key = cell_line, value = dependency, -gene) %>%
    mutate(entrez_id = gsub("&", ";", sub("\\)", "", sub("^.+ \\(", "", gene))),
           gene_name = gsub("&", ";", sub(" \\(.+\\)$", "", gene))) %>%
    left_join(depmap_id_to_name_19Q3, by = c("cell_line" = "cell_line"))

### rearrange columns into same column format as other datasets
rnai_19Q3 <- rnai_19Q3 %>% dplyr::select(gene, cell_line, dependency, entrez_id,
                                         gene_name, depmap_id) %>%
                                         type_convert(cols(entrez_id = "i"))
### visual check
# head(rnai_19Q3)

### saving cleaned and converted `rnai` data as .rda file
save(rnai_19Q3, file="../eh_data/rnai_19Q3.rda", compress="xz",
     compression_level=9)

## access the data on ExperimentHub
# hub <- ExperimentHub()
# x <- query(hub, "depmap")
# EH3080 <- x[["EH3080"]]

##########################################
## EH3087 depmap `drug_sensativity_19Q3` dataset
##########################################

## data cleaning of `drug_sensativity` dataset

### loading data (downloading .csv file from online source)
url_22 <- "https://depmap.org/portal/download/api/download/external?file_name=drug%2Fprimary-screen-e5c7.7%2Fprimary_replicate_collapsed_logfold_change.csv"
primary_replicate_collapsed_logfold_change_19Q3 <- read_csv(url_22)

### primary_replicate_collapsed_logfold_change_19Q3.csv data renamed to 
### `drug_sensativity_19Q3`
drug_sensativity_19Q3 <- primary_replicate_collapsed_logfold_change_19Q3
# head(drug_sensativity_19Q3)

### rename column first column to "depmap_id"
names(drug_sensativity_19Q3)[1] <- "depmap_id"

### gather drug_sensativity into long form with columns: depmap_id, compound and
### dependency
drug_sensativity_19Q3 <- gather(drug_sensativity_19Q3, key = compound,
                                value = dependency, -depmap_id) %>%
                                left_join(depmap_id_to_name_19Q3,
                                          by = c("depmap_id" = "depmap_id"))

### rearrange columns into same column format as other datasets
drug_sensativity_19Q3 <- drug_sensativity_19Q3 %>% 
    dplyr::select(depmap_id, cell_line, compound, dependency)

### visual check
head(drug_sensativity_19Q3)

### saving cleaned and converted `drug_sensativity` data as .rda file
save(drug_sensativity_19Q3, file="../eh_data/drug_sensativity_19Q3.rda",
     compress="xz", compression_level=9)

## access the data on ExperimentHub
# hub <- ExperimentHub()
# x <- query(hub, "depmap")
# EH3087 <- x[["EH3087"]]