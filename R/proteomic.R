#' proteomic_20Q2
#'
#' The `proteomic` dataset contains the 20Q2 quantitative profiling of proteins
#' via mass spectrometry from the Gygi lab. This dataset contains 12399 proteins
#' tested in 375 cell lines, including 24 primary diseases and 27 lineages. The
#' columns of this dataset are: `depmap_id`, a foreign key corresponding to the
#' cancer cell lineage, `cell_line` the common CCLE name of the cancer cell
#' lines, `gene_name` containing the HUGO gene name and `entrez_id` containing
#' only the entrez ID# and `protein_expression` which contains the normalized
#' protein expression for cancer cell lines. This dataset can be loaded into R
#' environment with the `depmap_proteomic` function.
#'
#' @format A data frame with 24963776 rows (cell lines) and 12 variables:
#' \describe{
#'      \item{depmap_id}{Cell line foreign key (i.e. "ACH-000956")}
#'      \item{cell_line}{Name of cancer cell line (i.e. "22RV1_PROSTATE")}
#'      \item{gene_name}{HUGO symbol (e.g. "TSPAN6")}
#'      \item{entrez_id}{Ensembl ID (e.g. ENSG00000044574)}
#'      \item{protein_expression}{normalized protein expression}
#'      \item{protein}{protein name with TenPx (e.g. MDAMB468_BREAST_TenPx01)}
#'      \item{protein_id}{Protein ID (e.g. sp|P55011|S12A2_HUMAN)}
#'      \item{desc}{Description (e.g. S12A2_HUMAN Solute carrier family 12 member 2)}
#'      \item{group_id}{Group ID}
#'      \item{uniprot}{Uniprot ID (e.g. S12A2_HUMAN)}
#'      \item{uniprot_acc}{Uniprot accession ID (e.g. P55011)}
#'      \item{TenPx}{TenPx number (e.g. TenPx01)}
#' }
#'
#' @details This data originates from the `protein_quant_current_normalized.csv`
#' file taken from the 20Q2 [Broad Institute](https://depmap.org/portal/download/)
#' cancer depenedency study. The derived dataset found in the `depmap` package
#' features the addition of a foreign key `depmap_id` found in the first column
#' of this dataset, which was added from the `metadata` dataset. This dataset
#' has been converted to a long format tibble. Variables names from the original
#' dataset were converted to lower case, put in snake case, and abbreviated
#' where feasible. 
#'
#' @section Change log:
#' 
#' - 20Q2: Initial dataset consisted of a data frame with 24963776 rows
#' (cell lines) and 12 variables
#'
#' @docType data
#'
#' @import dplyr
#'
#' @keywords datasets
#'
#' @examples
#' \dontrun{
#' depmap_proteomic()
#' }
#'
#' @references David P. Nusinow, John Szpyt, Mahmoud Ghandi, Christopher M.
#' Rose, E. Robert McDonald III, Marian Kalocsay, Judit Jané-Valbuena, Ellen
#' Gelfand, Devin K. Schweppe, Mark Jedrychowski, Javad Golji, Dale A. Porter,
#' Tomas Rejtar, Y. Karen Wang, Gregory V. Kryukov, Frank Stegmeier, Brian K.
#' Erickson, Levi A. Garraway, William R. Sellers, Steven P. Gygi (2020).
#' Quantitative Proteomics of the Cancer Cell Line Encyclopedia. Cell 180, 2.
#' (\href{"https://doi.org/10.1016/j.cell.2019.12.023"}{Elsevier})
#'
#' @source \href{"https://depmap.org/portal/download/"}{DepMap, Broad (2020)}
#'
#' @rdname proteomic
#'
#' @aliases proteomic_20Q2 depmap_proteomic
#' 
proteomic <- NULL