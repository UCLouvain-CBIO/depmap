## This scripts documents how to download and generate the data files. This
## scipt assumes (!!!) that it is run in ./depmap/inst/scripts/ and saves the 
## resulting .rda files in ./depmap/data

library("readr")
library("dplyr")
library("tidyr")


##   DepMap-2019q1-celllines.csv data, will be renamed `metadata`
### loading data (downloading .csv file from online source)
h <- "https://depmap.org/portal/download/api/download/external?file_name=processed_portal_downloads%2Fdepmap-public-cell-line-metadata-183e.4%2FDepMap-2019q1-celllines_v2.csv"
depmap_19Q1_cell_lines <- read_csv(h)

### renaming
metadata <- depmap_19Q1_cell_lines

### data cleaning
#### Rename first column of `metadata` to "depmapID" and CCLE_Name to cellLine
names(metadata)[1:2] <- c("depmapID", "cellLine")

#### depmap ID  from `metadata` (this is used as foreign key in other datasets)
depIDtoName <- data.frame(metadata$depmapID, metadata$cellLine)

#### add correct col names to depIDtoName
colnames(depIDtoName, do.NULL = FALSE)
colnames(depIDtoName) <- c("depmapID","cellLine")

### saving cleaned and converted data as .rda file

save(metadata, file = "../../data/metadata.rda",
     compress = "xz", compression_level = 9)


## depmap_19Q1_mutation_calls data, will be renamed `mutationCalls`
### loading data (downloading .csv file from online source)
f <- "https://depmap.org/portal/download/api/download/external?file_name=ccle%2Fdepmap-mutation-calls-9a1a.7%2Fdepmap_19Q1_mutation_calls.csv"
depmap_19Q1_mutation_calls <- read_csv(f)

### renaming
mutationCalls <- depmap_19Q1_mutation_calls

### data cleaning
#### eliminate superfluous first row
mutationCalls[[1]] <- NULL

#### rename 35th column
names(mutationCalls)[35] <- "depmapID"

### rearrange columns so depmapID is the first column like all other datasets
mutCallID <- mutationCalls$depmapID
mutCallNoID <- subset(mutationCalls, select = -c(depmapID))
mutationCalls <- cbind(mutCallID, mutCallNoID)

#### Rename `mutationCalls` first column to "depmapID"
names(mutationCalls)[1] <-"depmapID"

### saving cleaned and converted data as .rda file
save(mutationCalls, file = "../../data/mutationCalls.rda",
     compress = "xz", compression_level = 9)


##  public_19Q1_gene_cn.csv data, will be renamed `copyNumber`
### loading data (downloading .csv file from online source)
g <- "https://depmap.org/portal/download/api/download/external?file_name=ccle%2Fdepmap-wes-cn-data-97cc.14%2Fpublic_19Q1_gene_cn.csv"
public_19Q1_gene_cn  <- read_csv(g)

### initial data cleaning (rename column)
names(public_19Q1_gene_cn)[1] <-"depmapID"

### gather cell line columns and split gene name into gene_name and entrez_id
copyNumber_long <- gather(public_19Q1_gene_cn, gene, logCopyNumber, -depmapID)

### mutate gene into gene_name and entrez_id
copyNumber_long <- copyNumber_long %>% 
    mutate(entrez_id = gsub("&", ";", sub("\\)", "", sub("^.+ \\(", "", gene))),
           gene_name = gsub("&", ";", sub(" \\(.+\\)$", "", gene))) 

### join cell_line name    
copyNumber <- copyNumber_long %>% 
    left_join(depIDtoName, by = c("depmapID" = "depmapID"))

### saving cleaned and converted data as .rda file
save(copyNumber, file = "../../data/copyNumber.rda",
     compress = "xz", compression_level = 9)


##  gene_effect_corrected.csv data, will be renamed `crispr`

### loading data (downloading .csv file from online source)
j <- "https://ndownloader.figshare.com/files/14221385"
gene_effect_corrected <- read_csv(j)

### initial data cleaning (rename column)
names(gene_effect_corrected)[1] <-"depmapID"

### gather cell line columns and split gene name into gene_name and entrez_id
crispr_long <- gather(gene_effect_corrected, gene, dependency, -depmapID)

### mutate gene into gene_name and entrez_id
crispr_long <- crispr_long %>% 
    mutate(entrez_id = gsub("&", ";", sub("\\)", "", sub("^.+ \\(", "", gene))),
           gene_name = gsub("&", ";", sub(" \\(.+\\)$", "", gene))) 

### join cell_line name    
crispr <- crispr_long %>% 
    left_join(depIDtoName, by = c("depmapID" = "depmapID"))

### saving cleaned and converted data as .rda file
save(crispr, file = "../../data/crispr.rda",
     compress = "xz", compression_level = 9)


##   CCLE_depMap_19Q1_TPM.csv data, will be renamed `TPM`

### loading data (downloading .csv file from online source)
k <- "https://depmap.org/portal/download/api/download/external?file_name=ccle%2Fdepmap-rnaseq-expression-data-ccd0.12%2FCCLE_depMap_19Q1_TPM.csv"
CCLE_depMap_19Q1_TPM  <- read_csv(k)

### initial data cleaning (rename column)
names(CCLE_depMap_19Q1_TPM)[1] <-"depmapID"

### gather cell line columns and split gene name into gene_name and entrez_id
TPM_long <- gather(CCLE_depMap_19Q1_TPM, gene, expression, -depmapID)

### mutate gene into gene_name and entrez_id
TPM_long <- TPM_long %>% 
    mutate(ensembl_id = gsub("&", ";", sub("\\)", "", sub("^.+ \\(", "",gene))),
           gene_name = gsub("&", ";", sub(" \\(.+\\)$", "", gene))) 

### join cell_line name    
TPM <- TPM_long %>% left_join(depIDtoName, by = c("depmapID" = "depmapID"))

### saving cleaned and converted data as .rda file
save(TPM, file = "../../data/TPM.rda",
     compress = "xz", compression_level = 9)

##  CCLE_RPPA_20180123.csv data, will be renamed `RPPA`

### loading data (downloading .csv file from online source)
l <- "https://depmap.org/portal/download/api/download/external?file_name=ccle%2FCCLE_RPPA_20180123.csv"
CCLE_RPPA_20180123  <- read_csv(l)

## initial data cleaning (rename column)
names(CCLE_RPPA_20180123)[1] <-"cellLine"

### gather cell line columns and split gene name into gene_name and entrez_id
RPPA_long <- gather(CCLE_RPPA_20180123, antibody, expression, -cellLine)

### join cell_line name    
RPPA <- RPPA_long %>% left_join(depIDtoName, 
                                     by = c("cellLine" = "cellLine"))

### saving cleaned and converted data as .rda file
save(RPPA, file = "../../data/RPPA.rda",
     compress = "xz", compression_level = 9)


##   D2_combined_genetic_dependency_scores.csv data, will be renamed `rnai`

### loading data (downloading .csv file from online source)
m <- "https://ndownloader.figshare.com/files/13515395"
D2_combined_genetic_dependency_scores  <- read_csv(m)

### initial data cleaning (rename column)
names(D2_combined_genetic_dependency_scores)[1] <- "gene"

### gather cell line columns and split gene name into gene_name and entrez_id
rnai <- gather(D2_combined_genetic_dependency_scores, key = cell_line, 
               value = dependency, -gene) %>%
    mutate(entrez_id = gsub("&", ";", sub("\\)", "", sub("^.+ \\(", "", gene))),
           gene_name = gsub("&", ";", sub(" \\(.+\\)$", "", gene))) %>%
    left_join(depIDtoName, by = c("cell_line" = "cellLine"))

### saving cleaned and converted data as .rda file
save(rnai, file = "../../data/rnai.rda",
     compress = "xz", compression_level = 9)
