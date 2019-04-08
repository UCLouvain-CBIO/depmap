#' copyNumber
#'
#' The `copyNumber` dataset contains WES copy number data for genes and cancer 
#' cell lines. This dataset includes data from 23299 genes, 1604 cell lines, 38 
#' primary diseases and 33 lineages. The columns of `copyNumber` are: 
#' `depmap_id`, a foreign key corresponding to the cancer cell lineage, 
#' `cell_line` containing the common CCLE name of the cancer cell lines, 
#' `gene` containing both the HUGO gene name of the knockdown gene along with 
#' entrez ID#, `gene_name` containing only the HUGO gene name, `entrez_id` 
#' containing only the entrez ID#, and `log_copy_number` containing the 
#' numerical dependency score values for each pair of genes and cell lines.
#'
#' @format A long format tibble data frame with 37371596 rows and 6 variables.
#' \describe{
#'      \item{depmap_id}{Cancer cell line foreign key (i.e. "ACH-00001")}
#'      \item{cell_line}{CCLE name of cancer cell line (i.e. "184A1_BREAST")}
#'      \item{gene}{HUGO symbol (e.g. "SAP25") and Entrez ID# (e.g. 100316904)}
#'      \item{gene_name}{HUGO symbol (e.g. "SAP25")}
#'      \item{entrez_id}{Entrez ID# (e.g. 100316904)}
#'      \item{log_copy_number}{numerical log fold change in copy number for a 
#'      given gene and cell line}
#' }
#' 
#' @details This data represents the `public_19Q1_gene_cn` file taken from the 
#' 19Q1 [Broad Institute](https://depmap.org/portal/download/) 
#' cancer depenedency study. This dataset features the addition of a foreign key
#' `depmap_id` found in the first column of this dataset, which was added from 
#' the `metadata` dataset. The dataset has been converted to a long format 
#' tibble. Variables names from the original dataset were converted to lower 
#' case, put in snake case, and abbreviated where feasible.
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