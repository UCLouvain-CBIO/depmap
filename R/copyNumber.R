#' copyNumber
#'
#' The `copyNumber` dataset is the depMap WES copy number data for genes from 
#' cancer cell lines. This dataset originates from the `public_19Q1_gene_cn` 
#' file and has been converted from wide to the long form dataset. This dataset 
#' contains 23299 Genes, 1604 Cell Lines, 38 Primary Diseases ans 33 Lineages. 
#' The first column is the depMapID of the cell lineage and the second column 
#' is the gene being tested for that cell line. Other columns are cellLine, 
#' gene_name and entrez_Id and logCopyNumber, the numerical log-fold copy number 
#' change measured against copy number baseline of select genes. 
#'
#' @format A long format data frame with 37371596 rows and 6 variables. The 
#' numeric column longCopyNumber contains the log-fold change in copy number for
#' a known gene and for a given cell line. 
#' 
#' \describe{
#'      \item{depmapID}{cell line foreign key (i.e. "ACH-00001")}
#'      \item{gene}{HUGO symbol (e.g. "SAP25") and Entrez ID# (e.g. 100316904)}
#'      \item{longCopyNumber}{numerical log fod change in copy number for a gene
#'      and a given cell line}
#'      \item{gene_name}{HUGO symbol (e.g. "SAP25")}
#'      \item{entrez_id}{Entrez ID# (e.g. 100316904}
#'      \item{cellLine}{Name of cancer cell line (i.e. "184A1_BREAST")}
#' }
#' 
#' @details This data represents the `public_19Q1_gene_cn` dataset taken from
#' the public depmap portal. This dataset features the addition of a foreign key
#' (depmapID) found in the first column of this dataset, which was added from 
#' the `metadata` dataset. The dataset was converted to the long format and also
#' sorted so that the rows of depmapID were consecutive. 
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