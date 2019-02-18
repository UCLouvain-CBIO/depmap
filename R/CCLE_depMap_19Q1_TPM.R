#' CCLE_depMap_19Q1_TPM
#'
#' CCLE RNAseq gene expression data at scale (log2(TPM+1)). The portal shows
#' expression data for only protein coding genes.
#'
#' Genes 57820
#' Cell Lines 1165
#' Primary Diseases 33
#' Lineages 32
#'
#' @format A data frame with 1165 rows (cell lines) and 57821 variables (genes):
#' \describe{
#'      \item{Gene}{HUGO symbol (e.g. "HSPA5") and Ensembl gene ID (e.g. ENSG00000044574)}
#' }
#'
#' @docType data
#'
#' @usage data(CCLE_depMap_19Q1_TPM)
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
#' data(CCLE_depMap_19Q1_TPM)
#' ACTC1_(70) <- attr(CCLE_depMap_19Q1_TPM, "ACTC1 (70)")
#'
#' \dontrun{
#' CCLE_depMap_19Q1_TPM
#' }
#'
"CCLE_depMap_19Q1_TPM"
