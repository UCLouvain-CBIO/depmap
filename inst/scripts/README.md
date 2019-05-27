The .csv files in this package originate from the Broad Institute Depmap Data 
Portal: https://depmap.org/portal/download/

The data from the Broad Institute Depmap study is released quarterly. The Broad
Institute Depmap Data Portal webpage is checked on quarterly basis to locate new
updated data releases to incorporate into future depmap package versions.

The Broad Institute Depmap data files are downloaded and processed via the
appropriate make-data.R script found in this directory. For example the
make-data_19Q2.R would be used to generate the data for 19Q2 release. (Note: if
running these script files to recreate the datasets, the data will be generated
in ./inst/extdata)

These scripts perform the following operations on the data:
1. datafiles are downloaded from urls from the Broad Institute Depmap website as
tibbles using the read_csv function 
```
### loading data (downloading .csv file from online source)
h <- "https://ndownloader.figshare.com/files/13515395"
D2_combined_genetic_dependency_scores  <- read_csv(h)
```
2. datasets are renamed to shorter name (e.g, 'D2_combined_gene_dep_scores.csv'
renamed to 'rnai')
```
### D2_combined_genetic_dependency_scores.csv data renamed to `rnai`
rnai_19Q1 <- D2_combined_genetic_dependency_scores
```
3. blank column headers are filled in with the appropriate name, (e.g. 'gene')
```
### rename column first column to "gene"
names(rnai_19Q1)[1] <- "gene"
```
4. column headers are converted to snake case where appropriate (e.g. 
'Entrez_Gene_Id' is converted to 'entrez_gene_id'). 

5. data is converted to long format via dplyr function gather columns into 
key-value pairs, and strip the columns with both entrez ID and common gene name
in order to create new columns with those variables. 
```
### gather rnai into long form with columns: depmap_id, gene and dependency
rnai_19Q1 <- gather(rnai_19Q1, key = cell_line, value = dependency, -gene) %>%
    mutate(entrez_id = gsub("&", ";", sub("\\)", "", sub("^.+ \\(", "", gene))),
           gene_name = gsub("&", ";", sub(" \\(.+\\)$", "", gene))) %>%
    left_join(depmap_id_to_name_19Q1, by = c("cell_line" = "cell_line"))
```
6. The order of the data headers may be rearranged in order to be consistent 
across all datasets
```
### rearrange columns into same column format as other datasets
rnai_19Q1 <- rnai_19Q1 %>% select(gene, cell_line, dependency, entrez_id,
                                  gene_name, depmap_id)
```
7. Data is saved as .rda file
```
### saving cleaned and converted `rnai` data as .rda file
save(rnai_19Q1, file="../eh_data/rnai_19Q1.rda", compress="xz",
     compression_level=9)
```

The data thus generate, was uploaded to AWS via ExperimentHub AWS, as per the
instructions outlined in the ExperimentHub vignette: 
http://bioconductor.org/packages/release/bioc/vignettes/ExperimentHub/inst/doc/CreateAnExperimentHubPackage.html

