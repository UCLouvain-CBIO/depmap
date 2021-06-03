### =========================================================================
### Make 19Q4 depmap data
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
## EH3086 depmap `metadata_19Q4` dataset
##########################################

##  data cleaning of `metadata` dataset

### loading data (downloading .csv file from online source)
url_23 <- "https://ndownloader.figshare.com/files/20274744"
sample_info <- read_csv(url_23)

### DepMap-2019q1-celllines.csv data renamed to `metadata`
metadata_19Q4 <- sample_info
# names(metadata_19Q4)
# [1] "DepMap_ID"                 "stripped_cell_line_name"   "CCLE_Name"                
# [4] "alias"                     "COSMIC_ID"                 "lineage"                  
# [7] "lineage_subtype"           "lineage_sub_subtype"       "lineage_molecular_subtype"
# [10] "sex"                       "source"                    "Achilles_n_replicates"    
# [13] "cell_line_NNMD"            "culture_type"              "culture_medium"           
# [16] "cas9_activity"             "RRID"                      "sample_collection_site"   
# [19] "primary_or_metastasis"     "disease"                   "disease_subtype"          
# [22] "age"                       "Sanger_model_ID"           "additional_info"   

#### Rename `metadata` columns to contain underscores and be in snake case
## note: "metadata_19Q4" has different columns than "metadata_19Q4"
names(metadata_19Q4)[1:24] <-c("depmap_id", "stripped_cell_line_name",
                              "cell_line", "aliases", "cosmic_id", "lineage",
                              "lineage_subtype", "lineage_sub_subtype",
                              "lineage_molecular_subtype", "sex",
                              "source", "Achilles_n_replicates",
                              "cell_line_NNMD", "culture_type",
                              "culture_medium", "cas9_activity", "RRID",
                              "sample_collection_site", "primary_or_metastasis",
                              "primary_disease", "subtype_disease", "age",
                              "sanger_id", "additional_info")

### visual check
View(metadata_19Q4)

### saving cleaned and converted `metadata` data as .rda file
save(metadata_19Q4, file = "../eh_data/metadata_19Q4.rda",
     compress = "xz", compression_level = 9)

## access the data on ExperimentHub
# hub <- ExperimentHub()
# x <- query(hub, "depmap")

##########################################
## `depmap_id_to_name_19Q4 map `depmap_id` to `cell_line`
##########################################

##  generation of `metadata` subset `depmap_id_to_name_19Q4`

## The subset of `metadata`, `depmap_id_to_name_Q2` is used to map `cell_line`
## and depmap_id via left_join in other depmap datasets that do not contain
## both variables. If you are generating the depmap data from scratch, you will
## need to run the following code to generate the data correctly.

### `depmap_id_to_name` to add `depmap_id` or `cell_line` to other datasets
depmap_id_to_name_19Q4 <- metadata_19Q4 %>% dplyr::select(depmap_id, cell_line)

### visual check
# head(depmap_id_to_name_19Q4)

##########################################
## depmap `mutationCalls_19Q4` dataset
##########################################

## data cleaning of `mutationCalls` dataset

### loading data (downloading .csv file from online source)
url_24 <- "https://ndownloader.figshare.com/files/20274747"
CCLE_mutations_19Q4 <- read_csv(url_24)

### depmap_19Q1_mutation_calls data renamed to `mutationCalls`
mutationCalls_19Q4 <- CCLE_mutations_19Q4
head(mutationCalls_19Q4)

## remove unnecessary X1 variable
mutationCalls_19Q4 <- mutationCalls_19Q4 %>% dplyr::select(-X1)

#### rename last column to depmap_id
names(mutationCalls_19Q4)
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

## note: "mutationCalls_19Q4" has different columns than "mutationCalls_19Q1"
## the variable "VA_WES_AC" is no longer present in this dataset, unlike
## previous releases (e.g. 19Q1)! 
names(mutationCalls_19Q4)[1:34] <- c("gene_name", "entrez_id", "ncbi_build",
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
mutationCalls_19Q4 <- mutationCalls_19Q4 %>%
    dplyr::select(depmap_id, gene_name, entrez_id, ncbi_build, chromosome,
                  start_pos, end_pos, strand, var_class, var_type, ref_allele,
                  tumor_seq_allele1, dbSNP_RS, dbSNP_val_status, genome_change,
                  annotation_transcript, tumor_sample_barcode, cDNA_change,
                  codon_change, protein_change, is_deleterious, is_tcga_hotspot,
                  tcga_hsCnt, is_cosmic_hotspot, cosmic_hsCnt, ExAC_AF,
                  CGA_WES_AC, sanger_WES_AC, sanger_recalib_WES_AC, RNAseq_AC,
                  HC_AC, RD_AC, WGS_AC, var_annotation)

### visual check
# head(mutationCalls_19Q4)

### saving cleaned and converted `mutationCalls` data as .rda file
save(mutationCalls_19Q4, file = "../eh_data/mutationCalls_19Q4.rda",
     compress = "xz", compression_level = 9)

## access the data on ExperimentHub
# hub <- ExperimentHub()
# x <- query(hub, "depmap")

##########################################
## depmap `copyNumber_19Q4` dataset
##########################################

##  data cleaning of `copyNumber` dataset 

### loading data (downloading .csv file from online source)
url_25 <- "https://ndownloader.figshare.com/files/20234367"
CCLE_gene_cn_19Q4 <- read_csv(url_25)

### public_19Q1_gene_cn.csv data renamed to `copyNumber`
copyNumber_19Q4 <- CCLE_gene_cn_19Q4

### rename column first column to "depmap_id"
names(copyNumber_19Q4)[1] <- "depmap_id"

### gather into long form on columns: `depmap_id`, `gene`, `logCopyNumber`
copyNumber_19Q4_long <- gather(copyNumber_19Q4, gene, log_copy_number,
                               -depmap_id)

### mutate gene column into `gene_name` and `entrez_id`
copyNumber_19Q4_long <- copyNumber_19Q4_long %>% 
    mutate(entrez_id = gsub("&", ";", sub("\\)", "", sub("^.+ \\(", "", gene))),
           gene_name = gsub("&", ";", sub(" \\(.+\\)$", "", gene))) 

### left_join `copyNumber` & `depmap_id_to_name_19Q4` on `depmap_id`, 
## `cell_line`     
copyNumber_19Q4 <- copyNumber_19Q4_long %>% 
    left_join(depmap_id_to_name_19Q4, by = c("depmap_id" = "depmap_id"))

### rearrange columns into same column format as other datasets
copyNumber_19Q4 <- copyNumber_19Q4 %>% 
                        dplyr::select(depmap_id, gene, log_copy_number,
                                      entrez_id, gene_name, cell_line) %>%
                                      type_convert(cols(entrez_id = "i"))
### visual check
head(copyNumber_19Q4)

### saving cleaned and converted `copyNumber` data as .rda file
save(copyNumber_19Q4, file = "../eh_data/copyNumber_19Q4.rda",
     compress = "xz", compression_level = 9)

## access the data on ExperimentHub
# hub <- ExperimentHub()
# x <- query(hub, "depmap")

##########################################
## depmap `crispr_19Q4` dataset
##########################################

##  data cleaning of `crispr` dataset`

### loading data (downloading .csv file from online source)
url_26 <- "https://ndownloader.figshare.com/files/20234073"
Achilles_gene_effect_19Q4 <- read_csv(url_26)

### gene_effect_corrected.csv data renamed to `crispr`
crispr_19Q4 <- Achilles_gene_effect_19Q4

### visual check
head(crispr_19Q4)

### rename column first column to "depmap_id"
names(crispr_19Q4)[1] <-"depmap_id"

### gather cripsr into long form with columns: `depmap_id`, `gene`, `dependency`
crispr_19Q4_long <- gather(crispr_19Q4, gene, dependency, -depmap_id)

### mutate gene into `gene_name` and `entrez_id`
crispr_19Q4_long <- crispr_19Q4_long %>% 
    mutate(entrez_id = gsub("&", ";", sub("\\)", "", sub("^.+ \\(", "", gene))),
           gene_name = gsub("&", ";", sub(" \\(.+\\)$", "", gene))) 

### left_join `crispr_long` and `depmap_id_to_name` to add `cell_line` column   
crispr_19Q4 <- crispr_19Q4_long %>% left_join(depmap_id_to_name_19Q4, 
                                    by = c("depmap_id" = "depmap_id"))

### rearrange columns into same column format as other datasets
crispr_19Q4 <- crispr_19Q4 %>% dplyr::select(depmap_id, gene,
                                             dependency, entrez_id,
                                             gene_name, cell_line) %>%
                                             type_convert(cols(entrez_id = "i"))
### visual check
head(crispr_19Q4)

### saving cleaned and converted `crispr` data as .rda file
save(crispr_19Q4, file = "../eh_data/crispr_19Q4.rda",
     compress = "xz", compression_level = 9)

## access the data on ExperimentHub
# hub <- ExperimentHub()
# x <- query(hub, "depmap")

##########################################
## depmap `TPM_19Q4` dataset
##########################################

## data cleaning of `TPM` dataset

### loading data (downloading .csv file from online source)
url_27 <- "https://ndownloader.figshare.com/files/20234346"
CCLE_expression_full_19Q4 <- read_csv(url_27)

### CCLE_depMap_19Q1_TPM.csv data renamed to `TPM`
TPM_19Q4 <- CCLE_expression_full_19Q4
names(TPM_19Q4)

### rename column first column to "depmap_id"
names(TPM_19Q4)[1] <-"depmap_id"

### gather `TPM` into long form on columns: `depmap_id`, `gene`, `expression`
TPM_19Q4_long <- gather(TPM_19Q4, gene, expression, -depmap_id)

### mutate gene into gene_name and ensembl_id
TPM_19Q4_long <- TPM_19Q4_long %>% 
    mutate(ensembl_id = gsub("&", ";", sub("\\)", "", sub("^.+ \\(", "",gene))),
           gene_name = gsub("&", ";", sub(" \\(.+\\)$", "", gene))) 

### left_join join `TPM` and `depmap_id_to_name_19Q4` to add `cell_line` column
TPM_19Q4 <- TPM_19Q4_long %>% left_join(depmap_id_to_name_19Q4, 
                              by = c("depmap_id" = "depmap_id"))

### rearrange columns into same column format as other datasets
TPM_19Q4 <- TPM_19Q4 %>% dplyr::select(depmap_id, gene, expression, entrez_id,
                                gene_name, cell_line) %>%
                                type_convert(cols(entrez_id_id = "i"))
### visual check
head(TPM_19Q4)

### saving cleaned and converted `TPM` data as .rda file
save(TPM_19Q4, file = "../eh_data/TPM_19Q4.rda", compress="xz",
     compression_level = 9)