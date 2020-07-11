### =========================================================================
### Make 20Q2 depmap data
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
## depmap `metadata_20Q2` dataset
##########################################

##  data cleaning of `metadata` dataset

### loading data (downloading .csv file from online source)
url_33 <- "https://ndownloader.figshare.com/files/22629137"
sample_info <- read_csv(url_33)

### DepMap-2020q2-celllines.csv data renamed to `metadata`
metadata_20Q2 <- sample_info
names(metadata_20Q2)

# [1] "DepMap_ID"                 "stripped_cell_line_name"  
# [3] "CCLE_Name"                 "Alias"                    
# [5] "COSMICID"                  "sex"                      
# [7] "source"                    "Achilles_n_replicates"    
# [9] "cell_line_NNMD"            "culture_type"             
# [11] "culture_medium"            "cas9_activity"            
# [13] "RRID"                      "sample_collection_site"   
# [15] "primary_or_metastasis"     "primary_disease"          
# [17] "Subtype"                   "age"                      
# [19] "Sanger_Model_ID"           "depmap_public_comments"   
# [21] "lineage"                   "lineage_subtype"          
# [23] "lineage_sub_subtype"       "lineage_molecular_subtype"

#### Rename `metadata` columns to contain underscores and be in snake case
## note: "metadata_20Q2" has different columns than "metadata_20Q2"
names(metadata_20Q2)[1:24] <-c("depmap_id", "stripped_cell_line_name",
                              "cell_line", "aliases", "cosmic_id", "sex",
                              "source", "Achilles_n_replicates",
                              "cell_line_NNMD", "culture_type",
                              "culture_medium", "cas9_activity", "RRID",
                              "sample_collection_site", "primary_or_metastasis",
                              "primary_disease", "subtype_disease", "age",
                              "sanger_id", "additional_info", "lineage",
                              "lineage_subtype", "lineage_sub_subtype",
                              "lineage_molecular_subtype")

### visual check
# View(metadata_20Q2)

### saving cleaned and converted `metadata` data as .rda file
save(metadata_20Q2, file = "../eh_data/metadata_20Q2.rda",
     compress = "xz", compression_level = 9)

## access the data on ExperimentHub
# hub <- ExperimentHub()
# x <- query(hub, "depmap")

##########################################
## `depmap_id_to_name_20Q2 map `depmap_id` to `cell_line`
##########################################

##  generation of `metadata` subset `depmap_id_to_name_20Q2`

## The subset of `metadata`, `depmap_id_to_name_Q2` is used to map `cell_line`
## and depmap_id via left_join in other depmap datasets that do not contain
## both variables. If you are generating the depmap data from scratch, you will
## need to run the following code to generate the data correctly.

### `depmap_id_to_name` to add `depmap_id` or `cell_line` to other datasets
depmap_id_to_name_20Q2 <- metadata_20Q2 %>% dplyr::select(depmap_id, cell_line)

### visual check
# head(depmap_id_to_name_20Q2)

##########################################
## depmap `mutationCalls_20Q2` dataset
##########################################

## data cleaning of `mutationCalls` dataset

### loading data (downloading .csv file from online source)
url_34 <- "https://ndownloader.figshare.com/files/22629110"
CCLE_mutations_20Q2 <- read_tsv(url_34)

### depmap_20Q2_mutation_calls data renamed to `mutationCalls`
mutationCalls_20Q2 <- CCLE_mutations_20Q2

#### rename last column to depmap_id
# names(mutationCalls_20Q2)
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

## note: "mutationCalls_20Q2" has different columns than "mutationCalls_19Q1"
## the variable "VA_WES_AC" is no longer present in this dataset, unlike
## previous releases (e.g. 19Q1)! 
names(mutationCalls_20Q2)[1:34] <- c("gene_name", "entrez_id", "ncbi_build",
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
mutationCalls_20Q2 <- mutationCalls_20Q2 %>%
    dplyr::select(depmap_id, everything())

### visual check
# View(mutationCalls_20Q2)

### saving cleaned and converted `mutationCalls` data as .rda file
save(mutationCalls_20Q2, file = "../eh_data/mutationCalls_20Q2.rda",
     compress = "xz", compression_level = 9)

## access the data on ExperimentHub
# hub <- ExperimentHub()
# x <- query(hub, "depmap")

##########################################
## depmap `copyNumber_20Q2` dataset
##########################################

##  data cleaning of `copyNumber` dataset 
### loading data (downloading .csv file from online source)
url_35 <- "https://ndownloader.figshare.com/files/22629107"
CCLE_gene_cn_20Q2 <- read_csv(url_35)

### public_20Q2_gene_cn.csv data renamed to `copyNumber`
copyNumber_20Q2 <- CCLE_gene_cn_20Q2

### rename column first column to "depmap_id"
names(copyNumber_20Q2)[1] <- "depmap_id"

### gather into long form on columns: `depmap_id`, `gene`, `logCopyNumber`
copyNumber_20Q2_long <- gather(copyNumber_20Q2, gene, log_copy_number,
                               -depmap_id)

### mutate gene column into `gene_name` and `entrez_id`
copyNumber_20Q2_long <- copyNumber_20Q2_long %>% 
    mutate(entrez_id = gsub("&", ";", sub("\\)", "", sub("^.+ \\(", "", gene))),
           gene_name = gsub("&", ";", sub(" \\(.+\\)$", "", gene))) 

### left_join `copyNumber` & `depmap_id_to_name_20Q2` on `depmap_id`, 
## `cell_line`     
copyNumber_20Q2 <- copyNumber_20Q2_long %>% 
    left_join(depmap_id_to_name_20Q2, by = c("depmap_id" = "depmap_id"))

### rearrange columns into same column format as other datasets
copyNumber_20Q2 <- copyNumber_20Q2 %>% 
                        dplyr::select(depmap_id, gene, log_copy_number,
                                      entrez_id, gene_name, cell_line) %>%
                                      type_convert(cols(entrez_id = "i"))
### visual check
head(copyNumber_20Q2)

### saving cleaned and converted `copyNumber` data as .rda file
save(copyNumber_20Q2, file = "../eh_data/copyNumber_20Q2.rda",
     compress = "xz", compression_level = 9)

## access the data on ExperimentHub
# hub <- ExperimentHub()
# x <- query(hub, "depmap")

##########################################
## depmap `crispr_20Q2` dataset
##########################################

##  data cleaning of `crispr` dataset`

### loading data (downloading .csv file from online source)
url_36 <- "https://ndownloader.figshare.com/files/22629068"
Achilles_gene_effect_20Q2 <- read_csv(url_36)

### gene_effect_corrected.csv data renamed to `crispr`
crispr_20Q2 <- Achilles_gene_effect_20Q2

### visual check
# head(crispr_20Q2)

### rename column first column to "depmap_id"
names(crispr_20Q2)[1] <-"depmap_id"

### gather cripsr into long form with columns: `depmap_id`, `gene`, `dependency`
crispr_20Q2_long <- gather(crispr_20Q2, gene, dependency, -depmap_id)

### mutate gene into `gene_name` and `entrez_id`
crispr_20Q2_long <- crispr_20Q2_long %>% 
    mutate(entrez_id = gsub("&", ";", sub("\\)", "", sub("^.+ \\(", "", gene))),
           gene_name = gsub("&", ";", sub(" \\(.+\\)$", "", gene))) 

### left_join `crispr_long` and `depmap_id_to_name` to add `cell_line` column   
crispr_20Q2 <- crispr_20Q2_long %>% left_join(depmap_id_to_name_20Q2, 
                                    by = c("depmap_id" = "depmap_id"))

### rearrange columns into same column format as other datasets
crispr_20Q2 <- crispr_20Q2 %>% dplyr::select(depmap_id, gene,
                                             dependency, entrez_id,
                                             gene_name, cell_line) %>%
                                             type_convert(cols(entrez_id = "i"))
### visual check
head(crispr_20Q2)

### saving cleaned and converted `crispr` data as .rda file
save(crispr_20Q2, file = "../eh_data/crispr_20Q2.rda",
     compress = "xz", compression_level = 9)

## access the data on ExperimentHub
# hub <- ExperimentHub()
# x <- query(hub, "depmap")

##########################################
## depmap `TPM_20Q2` dataset
##########################################

## data cleaning of `TPM` dataset

### loading data (downloading .csv file from online source)
url_37 <- "https://ndownloader.figshare.com/files/22629092"
CCLE_expression_full_20Q2 <- read_tsv(url_37)

### CCLE_depMap_20Q2_TPM.csv data renamed to `TPM`
TPM_20Q2 <- CCLE_expression_full_20Q2
# names(TPM_20Q2)

### rename column first column to "depmap_id"
names(TPM_20Q2)[1] <-"depmap_id"

### gather `TPM` into long form on columns: `depmap_id`, `gene`, `expression`
TPM_20Q2_long <- gather(TPM_20Q2, gene, rna_expression, -depmap_id)

### mutate gene into gene_name and ensembl_id
TPM_20Q2_long <- TPM_20Q2_long %>% 
    mutate(ensembl_id = gsub("&", ";", sub("\\)", "", sub("^.+ \\(", "",gene))),
           gene_name = gsub("&", ";", sub(" \\(.+\\)$", "", gene))) 

### left_join join `TPM` and `depmap_id_to_name_20Q2` to add `cell_line` column
TPM_20Q2 <- TPM_20Q2_long %>% left_join(depmap_id_to_name_20Q2, 
                              by = c("depmap_id" = "depmap_id"))

### rearrange columns into same column format as other datasets
TPM_20Q2 <- TPM_20Q2 %>% dplyr::select(depmap_id, gene, rna_expression, ensembl_id,
                                gene_name, cell_line) %>%
                                type_convert(cols(ensembl_id = "i"))
### visual check
# View(TPM_20Q2[1:10, ])

### saving cleaned and converted `TPM` data as .rda file
save(TPM_20Q2, file = "../eh_data/TPM_20Q2.rda", compress = "xz",
     compression_level = 9)

##########################################
## depmap `proteomic_20Q2` dataset
##########################################

## data cleaning of `TPM` dataset
### loading data (downloading .csv file from online source)
url_38 <- "https://gygi.med.harvard.edu/sites/gygi.med.harvard.edu/files/documents/protein_quant_current_normalized.csv.gz"
protein_quant_current_normalized_20Q2 <- read_csv(url_38)

### protein_quant_current_normalized_TPM.csv data renamed to `TPM`
proteomic_20Q2 <- protein_quant_current_normalized_20Q2
# names(proteomic_20Q2)

### gather `proteomic` into long form on columns: `depmap_id`, `gene`, `expression`
proteomic_20Q2_long <- proteomic_20Q2 %>%
    dplyr::select(-starts_with("TenPx")) %>%
    pivot_longer(names_to = "Protein", values_to = "protein_expression", 7:384)

### mutate gene into gene_name and ensembl_id
proteomic_20Q2_long <- proteomic_20Q2_long %>% 
    mutate(TenPx = gsub("^.*?TenPx", "TenPx", Protein)) %>% 
    mutate(cell_line = sub("_[^_]+$", "", Protein))

### left_join join proteomic & depmap_id_to_name_20Q2, add cell_line column
proteomic_20Q2 <- proteomic_20Q2_long %>%
    dplyr::left_join(depmap_id_to_name_20Q2, by = c("cell_line" = "cell_line"))

names(proteomic_20Q2) <- c("protein_id", "gene_name", "desc",
                           "group_id", "uniprot", "uniprot_acc", "protein",
                           "protein_expression", "TenPx", "cell_line" , "depmap_id")

proteomic_20Q2 <- proteomic_20Q2 %>%
    dplyr::left_join(unique(dplyr::select(mutationCalls_20Q2, gene_name, entrez_id)),
                     by = c("gene_name" = "gene_name"))

### rearrange columns into same column format as other datasets
proteomic_20Q2 <- proteomic_20Q2 %>%
    dplyr::select(depmap_id, gene_name, entrez_id, protein, protein_expression,
                  everything()) %>%
    type_convert(cols(entrez_id = "i"))

### visual check
# View(proteomic_20Q2)

### saving cleaned and converted `proteomic` data as .rda file
save(proteomic_20Q2, file = "../eh_data/proteomic_20Q2.rda", compress = "xz",
     compression_level = 9)
