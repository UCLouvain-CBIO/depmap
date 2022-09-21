#' gene_summary_22Q1
#'
#' The `gene_summary` dataset contains the 22Q1 gene essentiality
#' probabilities for select genes. This dataset can be loaded into the R
#' environment with the `depmap_gene_summary` function.
#'
#' @format A data frame with 69746 rows (cell lines) and 7 variables:
#' \describe{
#'     \item{entrez_id}{Entrez ID# (e.g. 100316904)}
#'     \item{gene_name}{HUGO symbol (e.g. "SAP25")}
#'     \item{dataset}{which dataset this probability derives}
#'     \item{dependent_cell_lines}{number of dependent cell lines}
#'     \item{cell_lines_with_data}{number of cell lines with relevant dependency
#'      data}
#'     \item{strongly_selective}{Gene knockout is selective (not pan-lethal)}
#'     \item{common_essential}{common essential gene dependency}
#' }
#'
#' @details This data represents the `Gene Dependency Profile Summary.csv` file
#' taken from the 22Q1
#' [Broad Institute](https://depmap.org/portal/api/download/gene_dep_summary)
#' release.
#' 
#' @section Change log:
#' 
#' - 22Q1: Initial dataset
#' 
#' - 22Q2: no change, no further releases are scheduled at this time.
#'
#' @docType data
#'
#' @import dplyr
#'
#' @keywords datasets
#' 
#' @examples
#' \dontrun{
#' depmap_gene_summary()
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
#' @source \href{"https://depmap.org/portal/download/"}{DepMap, Broad (2022)}
#'
#' @rdname gene_summary
#' 
#' @aliases gene_summary_22Q1 depmap_gene_summary
gene_summary <- NULL