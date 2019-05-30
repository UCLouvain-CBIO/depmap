### =========================================================================
### Make 19Q2 depmap data
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
## EH2556 depmap `metadata_19Q2` dataset
##########################################

##  data cleaning of `metadata` dataset

### loading data (downloading .csv file from online source)
i <- "https://ndownloader.figshare.com/files/15023525"
sample_info <- read_csv(i)

### DepMap-2019q1-celllines.csv data renamed to `metadata`
metadata_19Q2 <- sample_info
# names(metadata_19Q2)
# [1] "DepMap_ID"               "stripped_cell_line_name"
# [3] "CCLE_name"               "alias"                  
# [5] "COSMIC_ID"               "Sanger_ID"              
# [7] "disease"                 "disease_sutype"         
# [9] "disease_sub_subtype"     "gender"                 
# [11] "source"                  "Achilles_n_replicates"  
# [13] "cell_line_NNMD"          "culture_type"           
# [15] "culture_medium"          "cas9_activity"  


#### Rename `metadata` columns to contain underscores and be in camel case
names(metadata_19Q2)[1:9] <-c("depmap_id", "stripped_cell_line_name",
                               "cell_line", "aliases", "cosmic_id", 
                               "sanger_id", "primary_disease","subtype_disease",
                               "sub_subtype_disease")

### visual check
#names(metadata_19Q2)
head(metadata_19Q2)

### saving cleaned and converted `metadata` data as .rda file
save(metadata_19Q2, file = "../eh_data/metadata_19Q2.rda",
     compress = "xz", compression_level = 9)

## access the data on ExperimentHub
hub <- ExperimentHub()
x <- query(hub, "depmap")
EH2556 <- x[["EH2556"]]

##########################################
## `depmap_id_to_name_19Q2 map `depmap_id` to `cell_line`
##########################################

##  generation of `metadata` subset `depmap_id_to_name_19Q2`

## The subset of `metadata`, `depmap_id_to_name_Q2` is used to map `cell_line`
## and depmap_id via left_join in other depmap datasets that do not contain
## both variables. If you are generating the depmap data from scratch, you will
## need to run the following code to generate the data correctly.

### `depmap_id_to_name` to add `depmap_id` or `cell_line` to other datasets
depmap_id_to_name_19Q2 <- metadata_19Q2 %>% select(depmap_id, cell_line)

### visual check
head(depmap_id_to_name_19Q2)

##########################################
## EH2555 depmap `mutationCalls_19Q2` dataset
##########################################

## data cleaning of `mutationCalls` dataset

### loading data (downloading .csv file from online source)
j <- "https://ndownloader.figshare.com/files/15023498"
CCLE_mutations_19Q2 <- read_csv(j)

### depmap_19Q1_mutation_calls data renamed to `mutationCalls`
mutationCalls_19Q2 <- CCLE_mutations_19Q2
names(mutationCalls_19Q2)

#### drop superfluous first two rows
mutationCalls_19Q2["X1"] <- NULL
mutationCalls_19Q2["X"] <- NULL

#### rename last column to depmap_id
# head(mutationCalls_19Q2)
# [3] "Hugo_Symbol"            "Entrez_Gene_Id"        
# [5] "NCBI_Build"             "Chromosome"            
# [7] "Start_position"         "End_position"          
# [9] "Strand"                 "Variant_Classification"
# [11] "Variant_Type"           "Reference_Allele"      
# [13] "Tumor_Seq_Allele1"      "dbSNP_RS"              
# [15] "dbSNP_Val_Status"       "Genome_Change"         
# [17] "Annotation_Transcript"  "Tumor_Sample_Barcode"  
# [19] "cDNA_Change"            "Codon_Change"          
# [21] "Protein_Change"         "isDeleterious"         
# [23] "isTCGAhotspot"          "TCGAhsCnt"             
# [25] "isCOSMIChotspot"        "COSMIChsCnt"           
# [27] "ExAC_AF"                "CGA_WES_AC"            
# [29] "SangerWES_AC"           "SangerRecalibWES_AC"   
# [31] "RNAseq_AC"              "HC_AC"                 
# [33] "RD_AC"                  "WGS_AC"                
# [35] "Variant_annotation"     "DepMap_ID"             
names(mutationCalls_19Q2)[1:34] <- c("gene_name", "entrez_id", "ncbi_build",            
                                "chromosome", "start_pos", "end_pos", "strand", 
                                "var_class","var_type", "ref_allele", 
                                "tumor_seq_allele1", "dbSNP_RS", 
                                "dbSNP_val_status", "genome_change",
                                "annotation_transcript", "tumor_sample_barcode", 
                                "cDNA_change", "codon_change", "protein_change",        
                                "is_deleterious", "is_tcga_hotspot","tcga_hsCnt",
                                "is_cosmic_hotspot", "cosmic_hsCnt", "ExAC_AF", 
                                "CGA_WES_AC", "sanger_WES_AC", 
                                "sanger_recalib_WES_AC", "RNAseq_AC", "HC_AC",                 
                                "RD_AC", "WGS_AC", "var_annotation","depmap_id")

### rearrange columns into same column format as other datasets
mutationCalls_19Q2 <- mutationCalls_19Q2 %>%
    select(depmap_id, gene_name, entrez_id, ncbi_build, chromosome, start_pos,
           end_pos, strand, var_class, var_type, ref_allele, tumor_seq_allele1,
           dbSNP_RS, dbSNP_val_status, genome_change, annotation_transcript,
           tumor_sample_barcode, cDNA_change, codon_change, protein_change, 
           is_deleterious, is_tcga_hotspot, tcga_hsCnt, is_cosmic_hotspot,
           cosmic_hsCnt, ExAC_AF, CGA_WES_AC, sanger_WES_AC,
           sanger_recalib_WES_AC, RNAseq_AC, HC_AC, RD_AC, WGS_AC,
           var_annotation)

### visual check
head(mutationCalls_19Q2)

### saving cleaned and converted `mutationCalls` data as .rda file
save(mutationCalls_19Q2, file = "../eh_data/mutationCalls_19Q2.rda",
     compress = "xz", compression_level = 9)

## access the data on ExperimentHub
hub <- ExperimentHub()
x <- query(hub, "depmap")
EH2555 <- x[["EH2555"]]

##########################################
## EH2552 depmap `copyNumber_19Q2` dataset
##########################################

##  data cleaning of `copyNumber` dataset 

### loading data (downloading .csv file from online source)
k <- "https://ndownloader.figshare.com/files/15023495"
CCLE_gene_cn_19Q2 <- read_csv(k)

### public_19Q1_gene_cn.csv data renamed to `copyNumber`
copyNumber_19Q2 <- CCLE_gene_cn_19Q2
#names(copyNumber_19Q2)

### rename column first column to "depmap_id"
names(copyNumber_19Q2)[1] <- "depmap_id"

### gather into long form on columns: `depmap_id`, `gene`, `logCopyNumber`
copyNumber_19Q2_long <- gather(copyNumber_19Q2, gene, log_copy_number,
                               -depmap_id)

### mutate gene column into `gene_name` and `entrez_id`
copyNumber_19Q2_long <- copyNumber_19Q2_long %>% 
    mutate(entrez_id = gsub("&", ";", sub("\\)", "", sub("^.+ \\(", "", gene))),
           gene_name = gsub("&", ";", sub(" \\(.+\\)$", "", gene))) 

### left_join `copyNumber` & `depmap_id_to_name_19Q2` on `depmap_id`, 
## `cell_line`     
copyNumber_19Q2 <- copyNumber_19Q2_long %>% 
    left_join(depmap_id_to_name_19Q2, by = c("depmap_id" = "depmap_id"))

### rearrange columns into same column format as other datasets
copyNumber_19Q2 <- copyNumber_19Q2 %>% select(depmap_id, gene, log_copy_number,
                                              entrez_id, gene_name, cell_line)
### visual check
head(copyNumber_19Q2)

### saving cleaned and converted `copyNumber` data as .rda file
save(copyNumber_19Q2, file = "../eh_data/copyNumber_19Q2.rda",
     compress = "xz", compression_level = 9)

## access the data on ExperimentHub
hub <- ExperimentHub()
x <- query(hub, "depmap")
EH2552 <- x[["EH2552"]]

##########################################
## EH2551 depmap `crispr_19Q2` dataset
##########################################

##  data cleaning of `crispr` dataset`

### loading data (downloading .csv file from online source)
l <- "https://ndownloader.figshare.com/files/15023465"
Achilles_gene_effect_19Q2 <- read_csv(l)

### gene_effect_corrected.csv data renamed to `crispr`
crispr_19Q2 <- Achilles_gene_effect_19Q2

### rename column first column to "depmap_id"
names(crispr_19Q2)[1] <-"depmap_id"

### gather cripsr into long form with columns: `depmap_id`, `gene`, `dependency`
crispr_19Q2_long <- gather(crispr_19Q2, gene, dependency, -depmap_id)

### mutate gene into `gene_name` and `entrez_id`
crispr_19Q2_long <- crispr_19Q2_long %>% 
    mutate(entrez_id = gsub("&", ";", sub("\\)", "", sub("^.+ \\(", "", gene))),
           gene_name = gsub("&", ";", sub(" \\(.+\\)$", "", gene))) 

### left_join `crispr_long` and `depmap_id_to_name` to add `cell_line` column   
crispr_19Q2 <- crispr_19Q2_long %>% left_join(depmap_id_to_name_19Q2, 
                                    by = c("depmap_id" = "depmap_id"))

### rearrange columns into same column format as other datasets
crispr_19Q2 <- crispr_19Q2 %>% select(depmap_id, gene, dependency, entrez_id,
                                      gene_name, cell_line)
### visual check
head(crispr_19Q2)

### saving cleaned and converted `crispr` data as .rda file
save(crispr_19Q2, file = "../eh_data/crispr_19Q2.rda",
     compress = "xz", compression_level = 9)

## access the data on ExperimentHub
hub <- ExperimentHub()
x <- query(hub, "depmap")
EH2551 <- x[["EH2551"]]

##########################################
## EH2554 depmap `TPM_19Q2` dataset
##########################################

## data cleaning of `TPM` dataset

### loading data (downloading .csv file from online source)
m <- "https://ndownloader.figshare.com/files/15023483"
CCLE_expression_full_19Q2 <- read_csv(m)

### CCLE_depMap_19Q1_TPM.csv data renamed to `TPM`
TPM_19Q2 <- CCLE_expression_full_19Q2

### rename column first column to "depmap_id"
names(TPM_19Q2)[1] <-"depmap_id"

### gather `TPM` into long form on columns: `depmap_id`, `gene`, `expression`
TPM_19Q2_long <- gather(TPM_19Q2, gene, expression, -depmap_id)

### mutate gene into gene_name and ensembl_id
TPM_19Q2_long <- TPM_19Q2_long %>% 
    mutate(ensembl_id = gsub("&", ";", sub("\\)", "", sub("^.+ \\(", "",gene))),
           gene_name = gsub("&", ";", sub(" \\(.+\\)$", "", gene))) 

### left_join join `TPM` and `depmap_id_to_name_19Q2` to add `cell_line` column
TPM_19Q2 <- TPM_19Q2_long %>% left_join(depmap_id_to_name_19Q2, 
                              by = c("depmap_id" = "depmap_id"))

### rearrange columns into same column format as other datasets
TPM_19Q2 <- TPM_19Q2 %>% select(depmap_id, gene, expression, ensembl_id,
                                gene_name, cell_line)
### visual check
head(TPM_19Q2)

### saving cleaned and converted `TPM` data as .rda file
save(TPM_19Q2, file = "../eh_data/TPM_19Q2.rda", compress="xz",
     compression_level=9)

## access the data on ExperimentHub
hub <- ExperimentHub()
x <- query(hub, "depmap")
EH2554 <- x[["EH2554"]]

##########################################
## EH2553 depmap `RPPA_19Q2` dataset
##########################################

## data cleaning of `RPPA` dataset

### loading data (downloading .csv file from online source)
n <- "https://depmap.org/portal/download/api/download/external?file_name=ccle%2FCCLE_RPPA_20180123.csv"
CCLE_RPPA_20180123_19Q2 <- read_csv(n)

### CCLE_RPPA_20180123.csv data renamed to `RPPA`
RPPA_19Q2 <- CCLE_RPPA_20180123_19Q2

### rename column first column to "cell_line"
names(RPPA_19Q2)[1] <-"cell_line"

### gather cell line columns and split gene name into gene_name and entrez_id
RPPA_19Q2_long <- RPPA_19Q2 %>% gather(antibody, expression, -cell_line)

### join cell_line name    
RPPA_19Q2 <- RPPA_19Q2_long %>% left_join(depmap_id_to_name_19Q2, 
                                by = c("cell_line" = "cell_line"))

### rearrange columns into same column format as other datasets
RPPA_19Q2 <- RPPA_19Q2 %>% select(cell_line, antibody, expression, depmap_id)

### visual check
head(RPPA_19Q2)

### saving cleaned and converted `RPPA` data as .rda file
save(RPPA_19Q2, file="../eh_data/RPPA_19Q2.rda", compress="xz",
     compression_level=9)

## access the data on ExperimentHub
hub <- ExperimentHub()
x <- query(hub, "depmap")
EH2553 <- x[["EH2553"]]

##########################################
## EH2550 depmap `rnai_19Q2` dataset
##########################################

## data cleaning of `rnai` dataset

### loading data (downloading .csv file from online source)
o <- "https://ndownloader.figshare.com/files/13515395"
D2_combined_gene_dep_scores_19Q2 <- read_csv(o)

### D2_combined_genetic_dependency_scores.csv data renamed to `rnai`
rnai_19Q2 <- D2_combined_gene_dep_scores_19Q2

### rename column first column to "gene"
names(rnai_19Q2)[1] <- "gene"

### gather rnai into long form with columns: depmap_id, gene and dependency
rnai_19Q2 <- gather(rnai_19Q2, key = cell_line, value = dependency, -gene) %>%
    mutate(entrez_id = gsub("&", ";", sub("\\)", "", sub("^.+ \\(", "", gene))),
           gene_name = gsub("&", ";", sub(" \\(.+\\)$", "", gene))) %>%
    left_join(depmap_id_to_name_19Q2, by = c("cell_line" = "cell_line"))

### rearrange columns into same column format as other datasets
rnai_19Q2 <- rnai_19Q2 %>% select(gene, cell_line, dependency, entrez_id,
                                  gene_name, depmap_id)
### visual check
head(rnai_19Q2)

### saving cleaned and converted `rnai` data as .rda file
save(rnai_19Q2, file="../eh_data/rnai_19Q2.rda", compress="xz",
     compression_level=9)

## access the data on ExperimentHub
hub <- ExperimentHub()
x <- query(hub, "depmap")
EH2550 <- x[["EH2550"]]