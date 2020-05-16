#' rnai_19Q3
#'
#' The `rnai` dataset contains the 19Q3 cancer dependency of select cancer cell
#' lines for genes found by RNAi gene knockdown. This dataset includes data from
#' 17309 genes, 712 cancer cell lines, 31 primary diseases and 31 lineages.
#' The columns of `rnai` are: `depmap_id`, a foreign key corresponding to the
#' cancer cell lineage, `cell_line` containing the common CCLE name of the
#' cancer cell lines, `gene` containing both the HUGO gene name of the knockdown
#' gene along with entrez ID#, `gene_name` which only contains HUGO gene name,
#' `entrez_id` which contains only the entrez ID# and `dependency` which
#' contains the numerical dependency score values for each pair of genes and
#' cell lines. This dataset can be loaded into the R environment with the
#' `depmap_rnai` function.
#'
#' @format A data frame with 12324008 rows (cell lines) and 6 variables:
#' \describe{
#'     \item{depmap_id}{cancer cancer cell line foreign key (i.e. "ACH-00001")}
#'     \item{cell_line}{CCLE name of cancer cell line (i.e. "184A1_BREAST")}
#'     \item{gene}{HUGO symbol (e.g. "SAP25") and Entrez ID# (e.g. 100316904)}
#'     \item{gene_name}{HUGO symbol (e.g. "SAP25")}
#'     \item{entrez_id}{Entrez ID# (e.g. 100316904)}
#'     \item{dependency}{numerical depenency score of a gene for a cell line}
#' }
#'
#' @details This data represents the `D2_combined_genetic_dependency_scores`
#' file taken from the 19Q3 [Broad Institute](https://depmap.org/portal/download/)
#' cancer depenedency study. The derived dataset found in the `depmap` package
#' features the addition of a foreign key `depmap_id` found in the first column
#' of this dataset, which was added from the `metadata` dataset. This dataset
#' has been converted to a long format tibble. Variables names from the original
#' dataset were converted to lower case, put in snake case, and abbreviated
#' where feasible.
#' 
#' @section Change log:
#' 
#' - 19Q1: Initial dataset consisted of a data frame with 12324008 rows (cell
#' lines) and 6 variables representing 17309 genes, 711 cancer cell lines, 30
#' primary diseases and 31 lineages.
#' 
#' - 19Q2: adds 1 cell line
#' 
#' - 19Q3: adds 1 primary disease
#' 
#' - 19Q4: no change, no further releases are scheduled at this time. NOTE:
#' as of this release, the crispr dataset replaces the rnai dataset for
#' dependency measurements in all future releases.
#' 
#' - 20Q1: no change, no further releases are scheduled at this time.
#' 
#' - 20Q2: no change, no further releases are scheduled at this time.
#'
#' @docType data
#'
#' @import dplyr
#'
#' @keywords datasets
#' 
#' @examples
#' \dontrun{
#' depmap_rnai()
#' }
#'
#' @references Tsherniak, A., Vazquez, F., Montgomery, P. G., Weir, B. A.,
#' Kryukov, G., Cowley, G. S., ... & Meyers, R. M. (2017). Defining a cancer
#' dependency map. Cell, 170(3), 564-576.
#' (\href{"https://www.ncbi.nlm.nih.gov/pubmed/28753430"}{PubMed})
#' 
#' James M. McFarland, Zandra V. Ho, Guillaume Kugener, Joshua M. Dempster,
#' Phillip G. Montgomery, Jordan G. Bryan, John M. Krill-Burger, Thomas M.
#' Green, Francisca Vazquez, Jesse S. Boehm, Todd R. Golub, William C. Hahn,
#' David E. Root, Aviad Tsherniak. (2018). Improved estimation of cancer
#' dependencies from large-scale RNAi screens using model-based normalization
#' and data integration. Nature Communications 9, 1.
#' (\href{"https://www.nature.com/articles/s41467-018-06916-5"}{Nature})
#'
#' @source \href{"https://depmap.org/portal/download/"}{DepMap, Broad (2019)}
#'
#' @rdname rnai
#' 
#' @aliases rnai_19Q3 rnai_19Q2 rnai_19Q1 depmap_rnai
rnai <- NULL