Describe here where the csv data comes from. For the script files, assume the 
data are in ./inst/extdata (even if they are too large to store on githuh).

In this directory, save ./inst/scripts/data.R that load the csv files and 
save the rda files directly in ./data/.

```
## example
ccle_depmap <- read.csv("../extdata/CCLE_depMap_19Q1_TPM.zip")
## cleaning, ...
save(ccle_depmap, file = "../../data/ccle_depmap.rda", 
     compress = "xz", compression_level = 9)
```

