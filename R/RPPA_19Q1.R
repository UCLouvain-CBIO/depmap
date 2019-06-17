#' RPPA_19Q1
#'
#' The `RPPA` dataset contains the 19Q1 CCLE Reverse Phase Protein Array (RPPA)
#' cellular model expression data. This dataset includes data from 214 genes,
#' 899 cancer cell lines, 28 primary diseases, 28 lineages. The columns of
#' `RPPA` are: `depmap_id`, a foreign key corresponding to the cancer cell
#' lineage, `cell_line` which contains the common CCLE name of the cancer cell
#' lines, `gene` which contains the knockdown gene expression, `antibody`
#' containing the name of knocked down gene and `expression` containing
#' numerical protein expression data.
#'
#' @format A data frame with 192386 rows and 4 variables:
#' \describe{
#'     \item{depmap_id}{cancer cell line foreign key (i.e. "ACH-000001")}
#'     \item{cell_line}{CCLE name of cancer cell line (i.e. "NIHOVCAR3_OVARY")}
#'     \item{antibody}{Name of antibody targeting protein (i.e. "14-3-3_beta")}
#'     \item{expression}{Observed expression via RPPA of protein coding genes}
#' }
#'
#' @details This data represents the `CCLE_RPPA_20180123` file taken from the
#' 19Q1 [Broad Institute](https://depmap.org/portal/download/) cancer
#' depenedency study. This dataset features the addition of a foreign key
#' `depmap_id` found in the first column of this dataset, which was added from
#' the `metadata` dataset. This dataset has been converted to a long format
#' tibble. Variables names from the original dataset were converted to lower
#' case, put in snake case, and abbreviated where feasible.
#' 
#' @section Change log:
#' 
#' - 19Q1: none
#'
#' @docType data
#'
#' @import dplyr
#'
#' @keywords datasets
#'
#' @references Tsherniak, A., Vazquez, F., Montgomery, P. G., Weir, B. A.,
#' Kryukov, G., Cowley, G. S., ... & Meyers, R. M. (2017). Defining a cancer
#' dependency map. Cell, 170(3), 564-576.
#' (\href{"https://www.ncbi.nlm.nih.gov/pubmed/28753430"}{PubMed})
#'
#' @source \href{"https://depmap.org/portal/download/"}{DepMap, Broad (2019)}
#'
#' @rdname RPPA
#'
#' @aliases RPPA_19Q1 RPPA_19Q2
RPPA <- NULL
