#' metadata
#'
#' Metadata about cell lines in the 19Q1 release, including mapping
#' between DepMap ID and CCLE names
#'
#' Genes 0
#' Cell Lines 1677
#' Primary Diseases 38
#' Lineages 33
#'
#' @format A data frame with 1677 rows (cell lines) and 9 variables:
#' \describe{
#'   \item{depmapID}{depmapID}
#'   \item{cellLine}{cellLine}
#'   \item{Aliases}{Aliases}
#'   \item{COSMIC_ID}{Catalogue Of Somatic Mutations In Cancer (COSMIC) ID number (e.g. 905933)}
#'   \item{Sanger ID}{Sanger ID (eg. 2201)}
#'   \item{Primary Disease}{Primary Disease (e.g. cancer type)}
#'   \item{Subtype Disease}{Subtype Disease (e.g. Acute Myelogenous Leukemia (AML), M3 (Promyelocytic))}
#'   \item{Gender}{Gender of patient of cell source}
#'   \item{Source}{Organization where the cell was sampled}
#' }
#'
#' @docType data
#'
#' @usage data(metadata)
#'
#' @format An object of class \code{"cross"}; see \code{\link[qtl]{read.cross}}.
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
#' data(metadata)
#' DepMap_ID <- attr(metadata, "DepMap_ID")
#'
#' \dontrun{
#' metadata
#' }
#'
"metadata"
