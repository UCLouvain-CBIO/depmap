#' gene_effect_corrected
#'
#' Genetic dependency of CRISPR (Avana) Public 19Q1 from batch corrected CERES
#' inferred gene effect matrix. CERES is a computational method to estimate gene
#' dependency levels from CRISPR-Cas9 essentiality screens while accounting for
#' the copy-number-specific effect.
#'
#' Genes 17634
#' Cell Lines 558
#' Primary Diseases 26
#' Lineages 28
#'
#' @format A data frame with 558 rows (cell lines) and 17635 variables (genes):
#' \describe{
#'     \item{Gene}{HUGO symbol (e.g. "SAP25") and Entrez ID# (e.g. 100316904)}
#' }
#'
#' @docType data
#'
#' @usage data(gene_effect_corrected)
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
#' @source \href{"https://ndownloader.figshare.com/files/14221385"}{DepMap, Broad (2019)}
#'
#' @examples
#' data(gene_effect_corrected)
#' A1CF_(29974) <- attr(gene_effect_corrected, "A1CF (29974)")
#'
#' \dontrun{
#' gene_effect_corrected
#' }
#'
"gene_effect_corrected"
