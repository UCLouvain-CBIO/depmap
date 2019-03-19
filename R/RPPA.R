#' RPPA
#'
#' Celluar Models dataset: CCLE Reverse Phase Protein Array (RPPA) data which 
#' originates from the `CCLE_RPPA_20180123`. This dataset contains: 214 Genes, 
#' 899 Cell Lines, 28 Primary Diseases, 28 Lineages. First column is the DepMap 
#' ID# of the cell lineage and the second column is the CCLE name for that cell 
#' line. The remaining columns are the numerical RPPA data of select genes. 
#'
#' @format A data frame with 899 rows (cell lines) and 216 variables (genes):
#' \describe{
#'     \item{depmapID}{cell line foreign key (i.e. "ACH-000001")}
#'     \item{cellLine}{Name of cancer cell line (i.e. "NIHOVCAR3_OVARY")}
#'     \item{gene}{Gene (i.e. "Transglutaminase")}
#' }
#'
#' @details This data represents the `CCLE_RPPA_20180123` dataset taken from
#' the public depmap portal. This dataset features the addition of a foreign key
#' (depmapID) found in the first column of this dataset, which was added from 
#' the `metadata` dataset. The dataset was also sorted so that the rows of 
#' depmapID were consecutive. 
#' 
#' @docType data
#'
#' @usage data(RPPA)
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
#' data(RPPA)
#' RPPA
"RPPA"