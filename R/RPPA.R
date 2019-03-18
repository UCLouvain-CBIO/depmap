#' RPPA
#'
#' Celluar Models dataset: CCLE Reverse Phase Protein Array (RPPA) data
#'
#' Genes 214
#' Cell Lines 899
#' Primary Diseases 28
#' Lineages 28
#'
#' @format A data frame with 899 rows (cell lines) and 216 variables (genes):
#' \describe{
#'     \item{Gene}{Gene (i.e. "Transglutaminase")}
#' }
#'
#' @docType data
#'
#' @usage data(RPPA)
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
#' data(RPPA)
#' ACTC1_(70) <- attr(RPPA, "ACTC1 (70)")
#'
#' \dontrun{
#' RPPA
#' }
#'
"RPPA"
