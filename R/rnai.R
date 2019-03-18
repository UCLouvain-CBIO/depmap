#' rnai
#'
#' Genetic Dependency Combined RNAi dataset (Broad, Novartis, Marcotte)
#'
#' Genes 17309
#' Cell Lines 712
#' Primary Diseases 30
#' Lineages 31
#'
#' @format A data frame with 713 rows (cell lines) and 17309 variables (genes):
#' \describe{
#'    \item{Gene}{Name of gene (i.e. "SF3B1 (23451)")}
#' }
#'
#' @docType data
#'
#' @usage data(rnai)
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
#' data(rnai)
#' SF3B1_(23451) <- attr(rnai, "SF3B1 (23451)")
#'
#' \dontrun{
#' rnai
#' }
#'
"rnai"
