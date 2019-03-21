#' rnai
#'
#' Genetic Dependency Combined RNAi dataset (Broad, Novartis, Marcotte) 
#' originating from the `D2_combined_genetic_dependency_scores` file and has 
#' been converted from wide to the long form dataset. Data from RNAi dataset 
#' includes 17309 Genes, 711 Cell Lines 711, 30 Primary Diseases and 31 
#' Lineages. The first column is the DepMap ID# of the cell lineage and the 
#' second column is the CCLE name for that cell line. The remaining columns 
#' consist of the numerical dependency score values of the select genes. 
#'
#' @format A data frame with 12324008 rows (each corresponding to an attribute 
#' of a given cell lines) and 6 columns:
#' \describe{
#'     \item{gene}{HUGO symbol (e.g. "SAP25") and Entrez ID# (e.g. 100316904)}
#'     \item{cellLine}{Name of cancer cell line (i.e. "184A1_BREAST")}
#'     \item{dependency}{numerical depenency score of a gene for a cell line}
#'     \item{entrez_id}{Entrez ID# (e.g. 100316904}
#'     \item{gene_name}{HUGO symbol (e.g. "SAP25")}
#'     \item{depmapID}{cell line foreign key (i.e. "ACH-00001")}
#' }
#' 
#' @details This data represents the `D2_combined_genetic_dependency_scores` 
#' dataset taken from the public depmap portal. This dataset features the 
#' addition of a foreign key (depmapID), which was added from the `metadata` 
#' dataset. The dataset was converted to the long format and also sorted so that
#' the rows of depmapID were consecutive. 
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