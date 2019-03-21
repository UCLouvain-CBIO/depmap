#' RPPA
#'
#' Celluar Models dataset: CCLE Reverse Phase Protein Array (RPPA) data which 
#' originates from the `CCLE_RPPA_20180123`. This dataset has been converted 
#' from wide fromat to the long form dataset and contains  214 Genes, 899 Cell 
#' Lines, 28 Primary Diseases, 28 Lineages. First column is the CCLE name a 
#' cancer cell line. The remaining columns are antibody, containing the common 
#' name of the antibody testing for specific proteins, expression, containing 
#' numberical protein expression data and depmapID, which is the of foreign key
#' of the cancer cell lineage.
#' 
#' @format A data frame with 899 rows (cell lines) and 216 variables (genes):
#' \describe{
#'     \item{cellLine}{Name of cancer cell line (i.e. "NIHOVCAR3_OVARY")}
#'     \item{antibody}{Name of antibody targeting protein (i.e. "14-3-3_beta")}
#'     \item{expression}{protein expression}
#'     \item{depmapID}{cell line foreign key (i.e. "ACH-000001")}
#' }
#'
#' @details This data represents the `CCLE_RPPA_20180123` dataset taken from
#' the public depmap portal. This dataset features the addition of a foreign key
#' (depmapID) found in the first column of this dataset, which was added from 
#' the `metadata` dataset. The dataset was converted to the long format and also
#' sorted so that the rows of depmapID were consecutive. 
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
