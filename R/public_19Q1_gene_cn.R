#' public_19Q1_gene_cn
#'
#' Data from DepMap WES Copy Number Data
#'
#' Genes 23299
#' Cell Lines 1604
#' Primary Diseases 38
#' Lineages 33
#'
#' @format A data frame with 1604 rows and 23300 variables. Each variable
#' column contains copy number for a known gene while each row represents a cell
#' line:
#' \describe{
#'     \item{Gene}{HUGO symbol (e.g. "SAP25") and Entrez ID# (e.g. 100316904)}
#' }
#'
#' @docType data
#'
#' @usage data(public_19Q1_gene_cn)
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
#' data(public_19Q1_gene_cn)
#' A1BG_(1) <- attr(public_19Q1_gene_cn, "A1BG (1)")
#'
#' \dontrun{
#' public_19Q1_gene_cn
#' }
#'
"public_19Q1_gene_cn"
