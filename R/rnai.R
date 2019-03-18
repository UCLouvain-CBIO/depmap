#' rnai
#'
#' Genetic Dependency Combined RNAi dataset (Broad, Novartis, Marcotte) 
#' originating from the `D2_combined_genetic_dependency_scores` file. Data from 
#' RNAi dataset including 17309 Genes, 712 Cell Lines 712, 30 Primary Diseases
#' and 31 Lineages. The first column is the DepMap ID# of the cell lineage and 
#' the second column is the CCLE name for that cell line. The remaining columns 
#' consist of the numerical dependency score values of the select genes. 
#'
#' @format A data frame with 713 rows (cell lines) and 17309 variables (genes):
#' \describe{
#'    \item{depmapID}{cell line foreign key (i.e. "ACH-00001")}
#'    \item{cellLine}{Name of cancer cell line (i.e. "184A1_BREAST")}
#'    \item{gene}{Name of gene (i.e. "SF3B1 (23451)")}
#' }
#'
#' @docType data
#'
#' @usage data(rnai)
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