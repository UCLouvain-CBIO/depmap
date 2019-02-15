#' depmap_19Q1_cell_lines
#'
#' Metadata about cell lines in the 19Q1 release, including mapping
#' between DepMap ID and CCLE names
#'
#' Genes 0
#' Cell Lines 1677
#' Primary Diseases 38
#' Lineages 33
#'
#' @format A data frame with 1677 rows and 9 variables:
#' \describe{
#'   \item{DepMap_ID}{DepMap_ID}
#'   \item{CCLE_Name}{CCLE_Name}
#'   \item{Aliases}{Aliases}
#'   \item{COSMIC_ID}{Catalogue Of Somatic Mutations In Cancer (COSMIC) ID number}
#'   \item{Sanger ID}{Sanger ID}
#'   \item{Primary Disease}{Primary Disease (e.g. cancer type)}
#'   \item{Subtype Disease}{Subtype Disease (e.g. Acute Myelogenous Leukemia (AML), M3 (Promyelocytic))}
#'   \item{Gender}{Gender of patient of cell source}
#'   \item{Source}{Organization where the cell was sampled}
#' }
#'
#' @docType data
#'
#' @usage data(depmap_19Q1_cell_lines)
#'
#' @format An object of class \code{"cross"}; see \code{\link[qtl]{read.cross}}.
#'
#' @keywords datasets
#'
#' @references Tsherniak, A., Vazquez, F., Montgomery, P. G., Weir, B. A.,
#' Kryukov, G., Cowley, G. S., ... & Meyers, R. M. (2017). Defining a cancer
#' dependency map. Cell, 170(3), 564-576.
#' (\href{https://www.ncbi.nlm.nih.gov/pubmed/28753430}{PubMed})
#'
#' @source \href{https://depmap.org/portal/download/api/download/external?file_name=processed_portal_downloads%2Fdepmap-public-cell-line-metadata-183e.3%2FDepMap-2019q1-celllines.csv}{DepMap, Broad (2019)}
#'
#' @examples
#' data(depmap_19Q1_cell_lines)
#' DepMap_ID <- attr(depmap_19Q1_cell_lines, "DepMap_ID")
#'
#' \dontrun{
#' depmap_19Q1_cell_lines
#' }
#'
"depmap_19Q1_cell_lines"
