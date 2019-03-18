#' crispr
#'
#' The `crispr` dataset is the genetic dependency of CRISPR-Cas9 gene knockout 
#' of select genes in various cancer cell lines. This data originates from the 
#' `gene_effect_corrected` file, which was generated from the (Avana) Public 
#' 19Q1 from batch corrected CERES inferred gene effect matrix. This dataset 
#' contains 17634 Genes, 558 Cell Lines, 26 Primary Diseases, 28 Lineages. The 
#' first column is the DepMap ID# of the cell lineage and the second column is 
#' the CCLE name for that cell line. The remaining columns consist of the 
#' numerical dependency score values of the select genes. 
#'
#' @format A data frame with 558 rows (cell lines) and 17631 variables (genes):
#' \describe{
#'     \item{depmapID}{cell line foreign key (i.e. "ACH-00001")}
#'     \item{cellLine}{Name of cancer cell line (i.e. "184A1_BREAST")}
#'     \item{gene}{HUGO symbol (e.g. "SAP25") and Entrez ID# (e.g. 100316904)}
#' }
#'
#' @docType data
#'
#' @usage data(crispr)
#'
#' @keywords datasets
#'
#' @references Tsherniak, A., Vazquez, F., Montgomery, P. G., Weir, B. A.,
#' Kryukov, G., Cowley, G. S., ... & Meyers, R. M. (2017). Defining a cancer
#' dependency map. Cell, 170(3), 564-576.
#' (\href{"https://www.ncbi.nlm.nih.gov/pubmed/28753430"}{PubMed})
#'
#' @source \href{"https://ndownloader.figshare.com/files/14221385"}{DepMap, 
#' Broad (2019)}
#'
#' @examples
#' data(crispr)
#' crispr
"crispr"