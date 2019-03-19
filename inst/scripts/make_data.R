## This scripts documents how to download and generate the data files. This
## scipt assumes it is run in ./depmap/inst/scripts/ and saves the resulting rda
## files in ./depmap/data

library("readr")
library("dplyr")

##   DepMap-2019q1-celllines.csv data, will be renamed `metadata`

### loading data
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
### saving 
save(metadata, file = "../../data/metadata.rda",
     compress = "xz", compression_level = 9)

## depmap_19Q1_mutation_calls data, will be renamed `mutationCalls`

### loading
f <- "https://depmap.org/portal/download/api/download/external?file_name=ccle%2Fdepmap-mutation-calls-9a1a.7%2Fdepmap_19Q1_mutation_calls.csv"
depmap_19Q1_mutation_calls <- read_csv(f)
### renaming
mutationCalls <- depmap_19Q1_mutation_calls
### data cleaning
#### eliminate superfluous first row 
mutationCalls[[1]] <- NULL
### rearrange columns so depmapID is the first column like all other datasets
mutCallID <- mutationCalls$depmapID
mutCallNoID <- subset(mutationCalls, select = -c(depmapID))
mutationCalls <- cbind(mutCallID, mutCallNoID)
#### Rename `mutationCalls` first column to "depmapID" 
names(mutationCalls)[1] <-"depmapID"
### saving
save(mutationCalls, file = "../../data/mutationCalls.rda",
     compress = "xz", compression_level = 9)

##  public_19Q1_gene_cn.csv data, will be renamed `copyNumber`

### loading data
g <- "https://depmap.org/portal/download/api/download/external?file_name=ccle%2Fdepmap-wes-cn-data-97cc.14%2Fpublic_19Q1_gene_cn.csv"
public_19Q1_gene_cn  <- read_csv(g)
### renaming 
copyNumber <- public_19Q1_gene_cn
### data cleaning
#### Rename first column of `copyNumber` to "depmapID" 
names(copyNumber)[1] <-"depmapID"
#### add 'cellLine' to 'copyNumber'
cnJoin <- left_join(copyNumber, depIDtoName, all=TRUE)
#### for cnJoin (copyNumber)
cnDepID <- as.data.frame(cnJoin$depmapID)
cnCell <- as.data.frame(cnJoin$cellLine)
cnJoinCols <- subset(cnJoin, select = -c(depmapID, cellLine))
df2 <- cbind(cnDepID, cnCell, cnJoinCols)
#### column names need to be changed
names(df2)[1:2] <-c("depmapID", "cellLine")
copyNumber <- df2
#### remove all NAs from column copyNumber$depmapID 
copyNumber <- subset(copyNumber, !is.na(depmapID))
#### sort copyNumber by depmapID
copyNumber <- copyNumber[order(copyNumber$depmapID),] 
### saving 
save(copyNumber, file = "../../data/copyNumber.rda",
     compress = "xz", compression_level = 9)

##  gene_effect_corrected.csv data, will be renamed `crispr`

### loading data
j <- "https://ndownloader.figshare.com/files/14221385"
gene_effect_corrected <- read_csv(j)
### renaming
crispr <- gene_effect_corrected
### data cleaning
#### Rename first column of `crispr` to "depmapID" 
names(crispr)[1] <-"depmapID"
#### add 'cellLine' to 'crispr' via left join
cripsrJoin <- left_join(crispr, depIDtoName, all=TRUE)
#### crisprJoin (crispr) clean up 
crisprDepID <- as.data.frame(cripsrJoin$depmapID)
crisprCell <- as.data.frame(cripsrJoin$cellLine)
cripsrJoinCols <- subset(cripsrJoin, select = -c(depmapID, cellLine))
df1 <- cbind(crisprDepID, crisprCell, cripsrJoinCols)
#### column names need to be changed
names(df1)[1:2] <-c("depmapID", "cellLine")
crispr <- df1
#### remove all NAs from column crispr$depmapID 
crispr <- subset(crispr, !is.na(depmapID))
### saving 
save(crispr, file = "../../data/crispr.rda",
     compress = "xz", compression_level = 9)

##   CCLE_depMap_19Q1_TPM.csv data, will be renamed `TPM`
 
### loading data
k <- "https://depmap.org/portal/download/api/download/external?file_name=ccle%2Fdepmap-rnaseq-expression-data-ccd0.12%2FCCLE_depMap_19Q1_TPM.csv"
CCLE_depMap_19Q1_TPM  <- read_csv(k)
### renaming
TPM <- CCLE_depMap_19Q1_TPM
### data cleaning
#### Rename first column of `TPM` to "depmapID" 
names(TPM)[1] <-"depmapID"
#### add 'cellLine' to 'TPM' via left join
tpmJoin <- left_join(TPM, depIDtoName, all=TRUE)
#### tpmJoin (TPM) clean up 
tpmDepID <- tpmJoin$depmapID
tpmCell <- tpmJoin$cellLine
tpmJoinCols <- subset(tpmJoin, select = -c(depmapID, cellLine))
df4 <- cbind(tpmDepID, tpmCell, tpmJoinCols)
#### column names need to be changed
names(df4)[1:2] <-c("depmapID", "cellLine")
TPM <- df4
#### remove all NAs from column TPM$depmapID 
TPM <- subset(TPM, !is.na(depmapID))
#### sort TPM by depmapID
TPM <- TPM[order(TPM$depmapID),] 
### saving 
save(TPM, file = "../../data/TPM.rda",
     compress = "xz", compression_level = 9)

##  CCLE_RPPA_20180123.csv data, will be renamed `RPPA`

### loading data
l <- "https://depmap.org/portal/download/api/download/external?file_name=ccle%2FCCLE_RPPA_20180123.csv"
CCLE_RPPA_20180123  <- read_csv(l)
### renaming
RPPA <- CCLE_RPPA_20180123
### data cleaning
#### Rename first column of `RPPA` to "cellLine" 
names(RPPA)[1] <-"cellLine"
#### add 'depmapID' to 'RPPA' via left join
rppaJoin <- left_join(RPPA, depIDtoName, all=TRUE)
#### rppaJoin (RPPA) clean up 
rppaDepID <- rppaJoin$depmapID
rppaJoinCols <- subset(rppaJoin, select = -c(depmapID))
df3 <- cbind(rppaDepID, rppaJoinCols)
#### column name needs to be renamed
names(df3)[1] <-"depmapID"
RPPA <- df3
#### remove all NAs from column RPPA$depmapID 
RPPA <- subset(RPPA, !is.na(depmapID))
#### sort RPPA by depmapID
RPPA <- RPPA[order(RPPA$depmapID),] 
### saving 
save(RPPA, file = "../../data/RPPA.rda",
     compress = "xz", compression_level = 9)

##   D2_combined_genetic_dependency_scores.csv data, will be renamed `rnai`

### loading data
m <- "https://ndownloader.figshare.com/files/13515395"
D2_combined_genetic_dependency_scores  <- read_csv(m)
### renaming
rnai <- D2_combined_genetic_dependency_scores
### data cleaning
#### rename first 14 columns of `D2_combined_genetic_dependency_scores` 
d2WrongName<-names(D2_combined_genetic_dependency_scores)[c(2:15)]
d2RightNames <- c("127399_SOFT_TISSUE", "1321N1_CENTRAL_NERVOUS_SYSTEM",
                  "143B_BONE", "184A1_BREAST", "184B5_BREAST", "22RV1_PROSTATE",
                  "2313287_STOMACH", "600MPE_BREAST",
                  "697_HAEMATOPOIETIC_AND_LYMPHOID_TISSUE", "769P_KIDNEY",
                  "786O_KIDNEY", "8305C_THYROID", "8505C_THYROID", "921_UVEA")
names(D2_combined_genetic_dependency_scores)[c(2:15)] <- d2RightNames
#### subset D2 column names (cellLines) 
d2CellLines <- as.data.frame(colnames(D2_combined_genetic_dependency_scores))
#### subset D2 first row (genes) which will become colNames of transposed matrix
d2Genes <-D2_combined_genetic_dependency_scores$X
#### remove first column, leaving only numeric columns
rnaiNum <- subset(D2_combined_genetic_dependency_scores, select = -c(X))
#### transpose `rnaiNum matrix 
tranD2 <- t(rnaiNum) 
#### coerce into df because tranD2 is currently a matrix
tranD2 <- as.data.frame(tranD2, row.names = NULL, col.names = TRUE) 
#### select first column of tranD2, make it the colnames
colnames(tranD2) <- as.character(unlist(d2Genes))
#### drop X1 row (not necessary) to make dimensions match original matrix
d2CellLines <- d2CellLines[-1, ]
#### merge cell lines with transposed D2 dataframe
cellLine1stColD2 <- cbind(d2CellLines, tranD2)
#### Rename first column to "cellLine" to it can be merged with `metadata`
names(cellLine1stColD2)[1] <- "cellLine"
#### map DepmapID onto cellLine (CCLE name) for cellToID2 
joinDepIDcellLine <- left_join(cellLine1stColD2, depIDtoName, all=TRUE)
#### tidy up dataframe to make depmapID appear as the first column
depmapID <- joinDepIDcellLine$depmapID
cellToIdCols <- subset(joinDepIDcellLine, select = -c(depmapID))
cellToID4 <- cbind(depmapID, cellToIdCols)
#### assign correct depmapID
cellToID4[40,1] <- "ACH-001015"
#### assign AZ521_STOMACH -> AZ521_SMALL_INTESTINE
cellToID4[40,2] <- "AZ521_SMALL_INTESTINE"
#### turn depmapId from factor to character so values can be correctly edited 
firstColtoChar <- as.character(cellToID4$depmapID)
#### SW527_BREAST manually given correct depmapID (ACH-001825)
firstColtoChar[649] <- "ACH-001825"
#### tidy up dataframe to make depmapID appear as the first column
firstColtoChar <- as.factor(firstColtoChar)
cellToIdCols <- subset(cellToID4, select = -c(depmapID))
cellToID5 <- cbind(firstColtoChar, cellToIdCols)
names(cellToID5)[1] <- "depmapID"
cellToID5 <- as.data.frame(cellToID5)
#### remove all NAs from column cellToID4$depmapID and rename to `noNAdepIDrnai`
noNAdepIDrnai <- subset(cellToID5, !is.na(depmapID))
#### cleaned rnai dataset
rnai <- noNAdepIDrnai
#### sort `rnai` by depmapID
rnai <- rnai[order(rnai$depmapID),] 
### saving data
save(rnai, file = "../../data/rnai.rda",
     compress = "xz", compression_level = 9)
