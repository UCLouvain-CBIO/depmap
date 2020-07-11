# The `depmap` package

[**depmap**](https://github.com/UCLouvain-CBIO/depmap/) is an R data 
package that disseminates cancer dependency omics datasets from the
Broad Institute website
[depmap](https://depmap.org/portal/download/). As the DepMap screening
efforts continue, the
[**depmap**](https://github.com/UCLouvain-CBIO/depmap/) package will
updated on a quarterly basis, in line with the Broad Institute
[depmap](https://depmap.org/portal/download/) cancer dependency
mapping initiative.

- Portal: https://depmap.org/portal/
- Selected publications: see https://depmap.org/portal/depmap/

The [github page](https://github.com/UCLouvain-CBIO/depmap) page is for
active development, issue tracking and forking/pulling purposes.

## Introduction

The [depmap](https://github.com/UCLouvain-CBIO/depmap/) package aims to
provide a reproducible research framework to cancer dependency data
described by [Tsherniak, Aviad, et al. "Defining a cancer dependency
map." Cell 170.3 (2017):
564-576.](https://www.ncbi.nlm.nih.gov/pubmed/28753430). The
[depmap](https://github.com/UCLouvain-CBIO/depmap/) package should allow a
researcher to easily mine dependency data taken from this cancer
genomic study, explore and mine the data.

To get an overview of the package, see the depmap vignette.

## Installation

To install [depmap](https://github.com/UCLouvain-CBIO/depmap/), the
[BiocManager](https://cran.r-project.org/web/packages/BiocManager/index.html)
Bioconductor Project Package Manager is required. If
[BiocManager](https://cran.r-project.org/web/packages/BiocManager/index.html)
is not already installed, it will need to be done so beforehand with
(within R) `install.packages("BiocManager")`. Once it is installed, `depmap` 
can be installed from Biocondctor:

```r
install.packages("BiocManager")
BiocManager::install("depmap")
```

To install the version from GitHub, use

```r
install.packages("BiocManager")
BiocManager::install("uclouvain-cbio/depmap")
```

## Questions

Feel also free to open a GitHub
[issue](https://github.com/UCLouvain-CBIO/depmap/issues), in
particular for bug reports.

## Contributing

Contributions to the package are more than welcome. If you want to
contribute to this package, you should follow the same conventions as
the rest of the functions. Please do get in touch (preferable opening
a [github issue](https://github.com/UCLouvain-CBIO/depmap/issues/)) to
discuss any suggestions.

Please note that this project is released with a
[Contributor Code of Conduct](https://github.com/UCLouvain-CBIO/depmap/blob/master/CONDUCT.md).
By participating in this project you agree to abide by its terms.
