#' copyNumber
#'
#' The `copyNumber` dataset is the depMap WES copy number data for genes from 
#' cancer cell lines. This dataset originates from the `public_19Q1_gene_cn` 
#' file. This dataset contains 23299 Genes, 1604 Cell Lines, 38 Primary 
#' Diseases, 33 Lineages. The first column is the DepMap ID# of the cell lineage
#' and the second column is the CCLE name for that cell line. The remaining 
#' columns consist of the numerical log-fold copy number change measured against
#' copy number baseline of select genes. 
#'
#' @format A data frame with 1604 rows and 23301 variables. Each numeric column 
#' contains copy number for a known gene while each row represents a cell line: 
#' \describe{
#'      \item{depmapID}{cell line foreign key (i.e. "ACH-00001")}
#'      \item{cellLine}{Name of cancer cell line (i.e. "184A1_BREAST")}
#'      \item{Gene}{HUGO symbol (e.g. "SAP25") and Entrez ID# (e.g. 100316904)}
#' }
#' 
#' @details This data represents the `public_19Q1_gene_cn` dataset taken from
#' the public depmap portal. This dataset features the addition of a foreign key
#' (depmapID) found in the first column of this dataset, which was added from 
#' the `metadata` dataset. The dataset was also sorted so that the rows of 
#' depmapID were consecutive. 
#' 
#' @docType data
#'
#' @usage data(copyNumber)
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
#' data(copyNumber)
#' copyNumber
"copyNumber"