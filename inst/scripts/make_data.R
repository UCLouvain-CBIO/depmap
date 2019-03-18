## This scripts documents how to download and generate the data files. This
## scipt assumes it is run in ./depmap/inst/scripts/ and saves the resulting rda
## files in ./depmap/data

library("readr")

## depmap_19Q1_mutation_calls data, will be renamed mutationCalls

### loading
f <- "https://depmap.org/portal/download/api/download/external?file_name=ccle%2Fdepmap-mutation-calls-9a1a.7%2Fdepmap_19Q1_mutation_calls.csv"
depmap_19Q1_mutation_calls <- read_csv(f)
### renaming
mutationCalls <- depmap_19Q1_mutation_calls
### data cleaning
mutationCalls[[1]] <- NULL
### saving
save(mutationCalls, file = "../../data/mutationCalls.rda",
     compress = "xz", compression_level = 9)
