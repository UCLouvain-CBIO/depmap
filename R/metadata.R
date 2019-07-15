#' metadata_19Q2
#'
#' The `metadata` dataset contains the metadata about cell lines in the 19Q2
#' Broad Institute DepMap release, which includes mapping between `depmap_id`
#' and `cell_line` name for cancer cell lines. This dataset does not contain any
#' dependency data but contains the metadata for 0 genes, 1714 cell lines, 39
#' primary diseases and 34 lineages. The columns of `metadata` are: `depmap_id`,
#' `stripped_cell_line_name`, `cell_line`, `aliases`, `cosmic_id`, `sanger_id`,
#' `primary_disease`, `subtype_disease`, `sub_subtype_disease`, `gender`,
#' `source`, `Achilles_n_replicates`, `cell_line_NNMD`, `culture_type`,
#' `culture_medium`, and `cas9_activity`.
#'
#' @format A data frame with 1714 rows (cell lines) and 16 variables:
#' \describe{
#'   \item{depmap_id}{Cancer cell line primary key, used in other datasets as
#'   foreign key (i.e. "ACH-00001")}
#'   \item{stripped_cell_line_name}{Name of stripped cell line}
#'   \item{cell_line}{CCLE name of cancer cell line (i.e. "184A1_BREAST")}
#'   \item{aliases}{Aliases of cancer cell line}
#'   \item{cosmic_id}{Catalogue Of Somatic Mutations In Cancer (COSMIC) ID
#'   number (e.g. 905933)}
#'   \item{sanger_id}{Sanger ID (eg. 2201)}
#'   \item{primary_disease}{Primary Disease (e.g. cancer type)}
#'   \item{subtype_disease}{Subtype Disease (e.g. Acute Myelogenous Leukemia
#'   (AML), M3 (Promyelocytic))}
#'   \item{sub_subtype_disease}{Sub-subtype Disease)}
#'   \item{gender}{Gender of tissue sample)}
#'   \item{source}{Source of tissue sample)}
#'   \item{Achilles_n_replicates}{Number of replicates)}
#'   \item{cell_line_NNMD}{Cell line NNMD)}
#'   \item{culture_type}{Culture type of tissue sample)}
#'   \item{culture_medium}{Culture medium of tissue sample)}
#'   \item{cas9_activity}{Cas9 activity)}
#' }
#'
#' @details This data represents the `sample_info.csv` file taken from the 19Q2
#' [Broad Institute](https://depmap.org/portal/download/) cancer depenedency
#' study. This dataset features the a primary key `depmap_id` which is a unique
#' ID given to each cell line and is found in the first column of this dataset.
#' The `depmap_id` attribute is used as a foreign key in all other datasets in
#' the package. This dataset has been converted to a long format tibble. This
#' dataset does not contain any expression or dependency data but rather
#' contains the metadata for all cancer cell lines used in the depmap project.
#' Variables names were converted to lower case, put in snake case, and
#' abbreviated where feasible (e.g. "Sanger ID" was changed to "sanger_id").
#'
#' @section Change log: 
#' 
#' - 19Q1: Initial dataset consisted of data frame with 1677 rows (cell lines)
#' and 9 variables, representing 0 genes, 1677 cell lines, 38 primary diseases
#' and 33 lineages
#' 
#' - 19Q2: adds 37 new cell lines, 1 primary disease and 1 lineage. This version
#' of the metadata dataset contains 6 variables not found in previous versions,
#' including: `Achilles_n_replicates`, `cell_line_NNMD`, `culture_type`,
#' `culture_medium`, and `cas9_activity`.
#'
#' @docType data
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
#' @rdname metadata
#'
#' @aliases metadata_19Q1 metadata_19Q2
metadata <- NULL
