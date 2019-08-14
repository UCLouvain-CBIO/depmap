The .csv files in this package originate from the Broad Institute Depmap Data 
Portal: https://depmap.org/portal/download/

These datafiles have been put in long format via dplyr for usage with R packages
such as ggplot2. The only modification of the datasets is that the datasets have
been renamed to shorter names (such as "metadata") and the column names have
been changed to snake case. The data has been put on ExperimentHub AWS for easy
access and to keep this package lightweight. 

If the need arises to reproduce the data files manually, they can be generated
by running the make-data.R scripts (of the appropriate version) found in this
directory. In order to generate the .rda data files correctly, it is necessary
to create an empty directory ./inst/eh_data to generate the data per the
make-data.R scripts. 

In this directory, save ./inst/scripts/data.R that load the csv files and 
save the rda files directly in ./data/.

```
## example
ccle_depmap <- read.csv("../extdata/CCLE_depMap_19Q1_TPM.zip")
## cleaning, ...
save(ccle_depmap, file = "../../data/ccle_depmap.rda", 
     compress = "xz", compression_level = 9)
```

