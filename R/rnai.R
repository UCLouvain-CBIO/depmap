#' rnai
#'
#' The `rnai` dataset contains cancer dependency of select cancer cell lines for
#' genes found by gene RNAi gene knockdown. Data from RNAi dataset includes data
#' from {r,length(unique(rnai$gene))} genes, {r, length(unique(rnai$cell_line))}
#' cancer cell lines, 30 primary diseases and 31 lineages. The columns of `rnai`
#' are: `depmap_id`, a foreign key corresponding to the cancer cell lineage,
#' `cell_line` containing the common CCLE name of the cancer cell lines, `gene`
#' containing both the HUGO gene name of the knockdown gene along with entrez 
#' ID#, `gene_name` which only contains HUGO gene name, `entrez_id` which
#' contains only the entrez ID# and `dependency` which contains the numerical
#' dependency score values for each pair of genes and cell lines.
#'
#' @format A long format tibble data frame with 12324008 rows and 6 columns:
#' \describe{
#'     \item{depmap_id}{cancer cancer cell line foreign key (i.e. "ACH-00001")}
#'     \item{cell_line}{CCLE name of cancer cell line (i.e. "184A1_BREAST")}
#'     \item{gene}{HUGO symbol (e.g. "SAP25") and Entrez ID# (e.g. 100316904)}
#'     \item{gene_name}{HUGO symbol (e.g. "SAP25")}
#'     \item{entrez_id}{Entrez ID# (e.g. 100316904)}
#'     \item{dependency}{numerical depenency score of a gene for a cell line}
#' }
#'
#' @details This data represents the `D2_combined_genetic_dependency_scores`
#' file taken from 19Q1 [Broad Institute](https://depmap.org/portal/download/)
#' cancer depenedency study. This dataset features the addition of a foreign key
#' `depmap_id` which is a unique ID given to each cell line and is found in the
#' first column of this dataset, which was added from the `metadata` dataset.
#' This dataset has been converted to a long format tibble. Variables names from
#' the original dataset were converted to lower case, put in snake case, and
#' abbreviated where feasible.
#'
#' @docType data
#'
#' @usage data(rnai)
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
#' data(rnai)
#' rnai
"rnai"