#' D2_combined_genetic_dependency_scores
#'
#' Genetic Dependency Combined RNAi dataset (Broad, Novartis, Marcotte)
#'
#' Genes 17309
#' Cell Lines 712
#' Primary Diseases 30
#' Lineages 31
#'
#' @format A data frame with 17309 rows (genes) and 713 variables (cell lines):
#' \describe{
#'    \item{Cell_Line}{Name of cell line (i.e. U87MG_CENTRAL_NERVOUS_SYSTEM)}
#' }
#'
#' @docType data
#'
#' @usage data(D2_combined_genetic_dependency_scores)
#'
#' @format An object of class \code{"cross"}; see \code{\link[qtl]{read.cross}}.
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
#' @examples
#' data(D2_combined_genetic_dependency_scores)
#' SNU216_STOMACH <- attr(D2_combined_genetic_dependency_scores, "SNU216_STOMACH")
#'
#' \dontrun{
#' D2_combined_genetic_dependency_scores
#' }
#'
"D2_combined_genetic_dependency_scores"
