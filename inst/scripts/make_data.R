## This scripts documents how to download and generate the data files. This
## scipt assumes (!!!) that it is run in ./depmap/inst/scripts/ and saves the 
## resulting .rda files in ./depmap/data  (e.g. *setwd(./depmap/inst/scripts/)*)

library("readr")
library("dplyr")
library("tidyr")


##  data cleaning of `metadata` dataset

### loading data (downloading .csv file from online source)
h <- "https://depmap.org/portal/download/api/download/external?file_name=processed_portal_downloads%2Fdepmap-public-cell-line-metadata-183e.4%2FDepMap-2019q1-celllines_v2.csv"
depmap_19Q1_cell_lines <- read_csv(h)

### DepMap-2019q1-celllines.csv data renamed to `metadata`
metadata <- depmap_19Q1_cell_lines

#### Rename `metadata` columns to contain underscores and be in camel case
names(metadata)[1:9] <- c("depmap_id", "cell_line", "aliases", "cosmic_id", 
                          "sanger_id", "primary_disease", "subtype_disease", 
                          "gender", "source")
### visual check
head(metadata)

### saving cleaned and converted `metadata` data as .rda file
save(metadata, file = "../../data/metadata.rda",
     compress = "xz", compression_level = 9)

### `depmap_id_to_name` to add `depmap_id` or `cell_line` to other datasets
metadata_depmap_id <- metadata[1] #depmap_id
metadata_cell_line <- metadata[2] # cell_line
depmap_id_to_name <- bind_cols(metadata_depmap_id, metadata_cell_line)

### visual check
head(depmap_id_to_name)


## data cleaning of `mutationCalls` dataset

### loading data (downloading .csv file from online source)
f <- "https://depmap.org/portal/download/api/download/external?file_name=ccle%2Fdepmap-mutation-calls-9a1a.7%2Fdepmap_19Q1_mutation_calls.csv"
depmap_19Q1_mutation_calls <- read_csv(f)

### depmap_19Q1_mutation_calls data renamed to `mutationCalls`
mutationCalls <- depmap_19Q1_mutation_calls

#### drop superfluous first row
mutationCalls[[1]] <- NULL

#### rename last column to depmap_id
names(mutationCalls)[1:35] <- c("gene_name", "entrez_id", "ncbi_build",            
                               "chromosome", "start_pos", "end_pos", "strand", 
                               "var_class","var_type", "ref_allele", 
                               "tumor_seq_allele1", "dbSNP_RS", 
                               "dbSNP_val_status", "genome_change",
                               "annotation_transcript", "tumor_sample_barcode", 
                               "cDNA_change", "codon_change", "protein_change",        
                               "is_deleterious", "is_tcga_hotspot","tcga_hsCnt",
                               "is_cosmic_hotspot", "cosmic_hsCnt", "ExAC_AF", 
                               "VA_WES_AC", "CGA_WES_AC", "sanger_WES_AC", 
                               "sanger_recalib_WES_AC", "RNAseq_AC", "HC_AC",                 
                               "RD_AC", "WGS_AC", "var_annotation",
                               "depmap_id")

### rearrange columns into same column format as other datasets
first_mutationCalls_col <- mutationCalls[35] #depmap_id
other_mutationCalls_col <- mutationCalls[1:34] #remaining rows
mutationCalls <- bind_cols(first_mutationCalls_col, other_mutationCalls_col)

### visual check
head(mutationCalls)

### saving cleaned and converted `mutationCalls` data as .rda file
save(mutationCalls, file = "../../data/mutationCalls.rda",
     compress = "xz", compression_level = 9)


##  data cleaning of `copyNumber` dataset 

### loading data (downloading .csv file from online source)
g <- "https://depmap.org/portal/download/api/download/external?file_name=ccle%2Fdepmap-wes-cn-data-97cc.14%2Fpublic_19Q1_gene_cn.csv"
public_19Q1_gene_cn  <- read_csv(g)

### public_19Q1_gene_cn.csv data renamed to `copyNumber`
copyNumber <- public_19Q1_gene_cn

### rename column first column to "depmap_id"
names(copyNumber)[1] <- "depmap_id"

### gather into long form on columns: `depmap_id`, `gene`, `logCopyNumber`
copyNumber_long <- gather(copyNumber, gene, log_copy_number, -depmap_id)

### mutate gene column into `gene_name` and `entrez_id`
copyNumber_long <- copyNumber_long %>% 
    mutate(entrez_id = gsub("&", ";", sub("\\)", "", sub("^.+ \\(", "", gene))),
           gene_name = gsub("&", ";", sub(" \\(.+\\)$", "", gene))) 

### left_join `copyNumber` and `depmap_id_to_name` on `depmap_id`, `cell_line`     
copyNumber <- copyNumber_long %>% 
    left_join(depmap_id_to_name, by = c("depmap_id" = "depmap_id"))

### rearrange columns into same column format as other datasets
copyNumCol1 <- copyNumber[1] #depmap_id
copyNumCol3 <- copyNumber[2] #gene
copyNumCol6 <- copyNumber[3] #log_copy_number
copyNumCol5 <- copyNumber[4] #entrez_id
copyNumCol4 <- copyNumber[5] #gene_name
copyNumCol2 <- copyNumber[6] #cell_line
copyNumber <- bind_cols(copyNumCol1, copyNumCol2, copyNumCol3, copyNumCol4, 
                        copyNumCol5, copyNumCol6)

### visual check
head(copyNumber)

### saving cleaned and converted `copyNumber` data as .rda file
save(copyNumber, file = "../../data/copyNumber.rda",
     compress = "xz", compression_level = 9)


##  data cleaning of `crispr` dataset`

### loading data (downloading .csv file from online source)
j <- "https://ndownloader.figshare.com/files/14221385"
gene_effect_corrected <- read_csv(j)

### gene_effect_corrected.csv data renamed to `crispr`
crispr <- gene_effect_corrected

### rename column first column to "depmap_id"
names(crispr)[1] <-"depmap_id"

### gather cripsr into long form with columns: `depmap_id`, `gene`, `dependency`
crispr_long <- gather(crispr, gene, dependency, -depmap_id)

### mutate gene into `gene_name` and `entrez_id`
crispr_long <- crispr_long %>% 
    mutate(entrez_id = gsub("&", ";", sub("\\)", "", sub("^.+ \\(", "", gene))),
           gene_name = gsub("&", ";", sub(" \\(.+\\)$", "", gene))) 

### left_join `crispr_long` and `depmap_id_to_name` to add `cell_line` column   
crispr <- crispr_long %>% left_join(depmap_id_to_name, 
                                    by = c("depmap_id" = "depmap_id"))

### rearrange columns into same column format as other datasets
crisprCol1 <- crispr[1] #depmap_id
crisprCol3 <- crispr[2] #gene
crisprCol6 <- crispr[3] #logcrisprCol
crisprCol5 <- crispr[4] #entrez_id
crisprCol4 <- crispr[5] #gene_name
crisprCol2 <- crispr[6] #cell_line
crispr <- bind_cols(crisprCol1, crisprCol2, crisprCol3, crisprCol4,
                        crisprCol5, crisprCol6)
### visual check
head(crispr)

### saving cleaned and converted `crispr` data as .rda file
save(crispr, file = "../../data/crispr.rda",
     compress = "xz", compression_level = 9)


## data cleaning of `TPM` dataset

### loading data (downloading .csv file from online source)
k <- "https://depmap.org/portal/download/api/download/external?file_name=ccle%2Fdepmap-rnaseq-expression-data-ccd0.12%2FCCLE_depMap_19Q1_TPM.csv"
CCLE_depMap_19Q1_TPM  <- read_csv(k)

### CCLE_depMap_19Q1_TPM.csv data renamed to `TPM`
TPM <- CCLE_depMap_19Q1_TPM

### rename column first column to "depmap_id"
names(TPM)[1] <-"depmap_id"

### gather `TPM` into long form on columns: `depmap_id`, `gene`, `expression`
TPM_long <- gather(TPM, gene, expression, -depmap_id)

### mutate gene into gene_name and ensembl_id
TPM_long <- TPM_long %>% 
    mutate(ensembl_id = gsub("&", ";", sub("\\)", "", sub("^.+ \\(", "",gene))),
           gene_name = gsub("&", ";", sub(" \\(.+\\)$", "", gene))) 

### left_join join `TPM` and `depmap_id_to_name` to add `cell_line` column
TPM <- TPM_long %>% left_join(depmap_id_to_name, 
                              by = c("depmap_id" = "depmap_id"))

### rearrange columns into same column format as other datasets
tpmCol1 <- TPM[1] #depmap_id
tpmCol3 <- TPM[2] #gene
tpmCol6 <- TPM[3] #expression
tpmCol5 <- TPM[4] #ensembl_id
tpmCol4 <- TPM[5] #gene_name
tpmCol2 <- TPM[6] #cell_line
TPM <- bind_cols(tpmCol1, tpmCol2, tpmCol3, tpmCol4, tpmCol5, tpmCol6)

### visual check
head(TPM)

### saving cleaned and converted `TPM` data as .rda file
save(TPM, file = "../../data/TPM.rda", compress = "xz", compression_level = 9)


## data cleaning of `RPPA` dataset

### loading data (downloading .csv file from online source)
l <- "https://depmap.org/portal/download/api/download/external?file_name=ccle%2FCCLE_RPPA_20180123.csv"
CCLE_RPPA_20180123  <- read_csv(l)

### CCLE_RPPA_20180123.csv data renamed to `RPPA`
RPPA <- CCLE_RPPA_20180123

### rename column first column to "cell_line"
names(RPPA)[1] <-"cell_line"

### gather cell line columns and split gene name into gene_name and entrez_id
RPPA_long <- gather(RPPA, antibody, expression, -cell_line)

### join cell_line name    
RPPA <- RPPA_long %>% left_join(depmap_id_to_name, 
                                     by = c("cell_line" = "cell_line"))

### rearrange columns into same column format as other datasets
rppaCol2 <- RPPA[1] #cell_line
rppaCol3 <- RPPA[2] #antibody
rppaCol4 <- RPPA[3] #expression
rppaCol1 <- RPPA[4] #depmap_id
RPPA <- bind_cols(rppaCol1, rppaCol2, rppaCol3, rppaCol4)

### visual check
head(RPPA)

### saving cleaned and converted `RPPA` data as .rda file
save(RPPA, file = "../../data/RPPA.rda", compress = "xz", compression_level = 9)


## data cleaning of `rnai` dataset

### loading data (downloading .csv file from online source)
m <- "https://ndownloader.figshare.com/files/13515395"
D2_combined_genetic_dependency_scores  <- read_csv(m)

### D2_combined_genetic_dependency_scores.csv data renamed to `rnai`
rnai <- D2_combined_genetic_dependency_scores

### rename column first column to "gene"
names(rnai)[1] <- "gene"

### gather rnai into long form with columns: depmap_id, gene and dependency
rnai<- gather(rnai, key = cell_line, value = dependency, -gene) %>%
                mutate(entrez_id = gsub("&", ";", sub("\\)", "", sub("^.+ \\(", "", gene))),
                gene_name = gsub("&", ";", sub(" \\(.+\\)$", "", gene))) %>%
                left_join(depmap_id_to_name, by = c("cell_line" = "cell_line"))

### rearrange columns into same column format as other datasets
rnaiCol3 <- rnai[1] #gene 
rnaiCol2 <- rnai[2] #cell_line
rnaiCol6 <- rnai[3] #dependency
rnaiCol5 <- rnai[4] #entrez_id
rnaiCol4 <- rnai[5] #gene_name
rnaiCol1 <- rnai[6] #depmap_id 
rnai <- bind_cols(rnaiCol1, rnaiCol2, rnaiCol3, rnaiCol4, rnaiCol5, rnaiCol6)

### visual check
head(rnai)

### saving cleaned and converted `rnai` data as .rda file
save(rnai, file = "../../data/rnai.rda", compress = "xz", compression_level = 9)
