#' copyNumber
#'
#' The `copyNumber` dataset is the depMap WES copy number data for genes from
#' cancer cell lines. This dataset originates from the `public_19Q1_gene_cn`
#' file and has been converted from wide to the long form dataset. This dataset
#' contains 23299 Genes, 1604 Cell Lines, 38 Primary Diseases ans 33 Lineages.
#' The first column `depmap_id` is a foreign key relating to the cell lineage,
#' followed by `cell_line` which contains the common CCLE name of the cancer
#' cell lines, `gene` which contains both the HUGO gene name of the knockdown
#' gene along with entrez ID#, followed by the column `gene_name` which only
#' contains HUGO gene name and `entrez_id` which contains only the entrez ID#.
#' The last column `log_copy_number` contains the numerical dependency score
#' values for each pair of genes and cell lines.
#'
#' @format A long format data frame with 37371596 rows and 6 variables. The
#' numeric column `log_copy_number` contains the log-fold change in copy number
#' for a known gene and for a given cell line.
#'
#' \describe{
#'      \item{depmap_id}{cell line foreign key (i.e. "ACH-00001")}
#'      \item{cell_line}{Name of cancer cell line (i.e. "184A1_BREAST")}
#'      \item{gene}{HUGO symbol (e.g. "SAP25") and Entrez ID# (e.g. 100316904)}
#'      \item{gene_name}{HUGO symbol (e.g. "SAP25")}
#'      \item{entrez_id}{Entrez ID# (e.g. 100316904}
#'      \item{log_copy_number}{numerical log fold change in copy number for a
#'      given gene and cell line}
#' }
#'
#' @details This data represents the `public_19Q1_gene_cn` dataset taken from
#' the public depmap portal. This dataset features the addition of a foreign key
#' `depmap_id` found in the first column of this dataset, which was added from
#' the `metadata` dataset. The dataset has been converted to the long format.
#'
#' @docType data
#'
#' @usage data(copyNumber)
#'
#' @import dplyr
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