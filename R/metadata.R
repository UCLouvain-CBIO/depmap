#' metadata_20Q4
#'
#' The `metadata` dataset contains the metadata about cell lines in the 20Q4
#' Broad Institute DepMap release, which includes mapping between `depmap_id`
#' and `cell_line` name for cancer cell lines. This dataset does not contain any
#' dependency data but contains the metadata for 0 genes, 1812 cell lines, 35
#' primary diseases and 39 lineages. The columns of `metadata` are: `depmap_id`,
#' `stripped_cell_line_name`, `cell_line`, `aliases`, `cosmic_id`, `sanger_id`,
#' `WTSI_master_cell_ID`, `primary_disease`, `subtype_disease`,
#' `sub_subtype_disease`, `gender`, `source`, `Achilles_n_replicates`,
#' `cell_line_NNMD`, `culture_type`, `culture_medium`, and `cas9_activity`.
#' This dataset can be loaded into the R  environment with the
#' `depmap_copyNumber` function.
#'
#' @format A data frame with 1812 rows (cell lines) and 26 variables:
#' \describe{
#'   \item{depmap_id}{Cancer cell line primary key (i.e. "ACH-00001")}
#'   \item{stripped_cell_line_name}{Name of stripped cell line}
#'   \item{cell_line}{CCLE name of cancer cell line (i.e. "184A1_BREAST")}
#'   \item{cell_line_name}{Abbreviated name of cancer cell line (i.e. "NIH:OVCAR-3")}
#'   \item{aliases}{Aliases of cancer cell line}
#'   \item{cosmic_id}{Catalogue Of Somatic Mutations In Cancer ID number (e.g. 905933)}
#'   \item{sex}{Sex of tissue sample)}
#'   \item{source}{Source of tissue sample)}
#'   \item{Achilles_n_replicates}{Number of replicates)}
#'   \item{cell_line_NNMD}{Cell line NNMD)}
#'   \item{culture_type}{Culture type of tissue sample)}
#'   \item{culture_medium}{Culture medium of tissue sample)}
#'   \item{cas9_activity}{Cas9 activity)}
#'   \item{RRID}{Resource Identification Portal ID}
#'   \item{sample_collection_site}{Site of sample collection (AML), M3 (Promyelocytic))}
#'   \item{primary_or_metastasis}{Primary cancer cell line or metastatic}
#'   \item{primary_disease}{Primary Disease (e.g. cancer type)}
#'   \item{subtype_disease}{Subtype Disease (e.g. Acute Myelogenous Leukemia)}
#'   \item{age}{Age of individual sample of cell line was derived}
#'   \item{sanger_id}{Sanger ID (eg. 2201)}
#'   \item{WTSI_master_cell_ID}{Wellcome Trust Sanger Institute ID (eg. 1369)}
#'   \item{additional_info}{Additional information about samples}
#'   \item{lineage}{Lineage of cancer cell line}
#'   \item{lineage_subtype}{Subtype of lineage of cancer cell line}
#'   \item{lineage_sub_subtype}{Subtype of subtype of Lineage of cancer cell line}
#'   \item{lineage_molecular_subtype}{Molecular type of Lineage of cancer cell line}
#' }
#'
#' @details This data represents the `sample_info.csv` file taken from the 20Q4
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
#' - 19Q3: adds 30 cell lines, 2 primary diseases and 2 lineages
#' 
#' - 19Q4: adds 42 cell lines, 0 primary diseases and 3 lineages
#' 
#' - 20Q1: adds 19 cell lines, `gender` was changed to `sex`, `age`,
#' `primary_or_metastasis` and `sample_collection_site`` were added
#' 
#' - 20Q2: adds 30 cell lines and 1 lineage
#'
#' - 20Q3: adds new column `WTSI_master_cell_ID`
#' 
#' - 20Q4: adds 6 cell lines and 1 lineage. Adds column `cell_line_name`
#'
#' @docType data
#'
#' @import dplyr
#'
#' @keywords datasets
#' 
#' @examples
#' \dontrun{
#' depmap_metadata()
#' }
#'
#' @references Tsherniak, A., Vazquez, F., Montgomery, P. G., Weir, B. A.,
#' Kryukov, G., Cowley, G. S., ... & Meyers, R. M. (2017). Defining a cancer
#' dependency map. Cell, 170(3), 564-576.
#' (\href{"https://www.ncbi.nlm.nih.gov/pubmed/28753430"}{PubMed})
#' 
#' DepMap, Broad (2019): DepMap Achilles 19Q1 Public.
#' (\href{"https://figshare.com/articles/DepMap_Achilles_19Q1_Public/7655150"}{figshare}).
#' Fileset. 
#' 
#' Robin M. Meyers, Jordan G. Bryan, James M. McFarland, Barbara A. Weir, ...
#' David E. Root, William C. Hahn, Aviad Tsherniak. Computational correction of
#' copy number effect improves specificity of CRISPR-Cas9 essentiality screens
#' in cancer cells. Nature Genetics 2017 October 49:1779–1784. 
#' (\href{"https://www.ncbi.nlm.nih.gov/pubmed/29083409"}{Pubmed})14
#'  
#' Mahmoud Ghandi, Franklin W. Huang, Judit Jané-Valbuena, Gregory V. Kryukov,
#' ... Todd R. Golub, Levi A. Garraway & William R. Sellers. 2019. Next-
#' generation characterization of the Cancer Cell Line Encyclopedia. Nature 569,
#' 503–508 (2019).
#' (\href{"https://www.nature.com/articles/s41586-019-1186-3"}{Nature})
#'
#' @source \href{"https://depmap.org/portal/download/"}{DepMap, Broad (2020)}
#'
#' @rdname metadata
#'
#' @aliases metadata_20Q4 metadata_20Q3 metadata_20Q2 metadata_20Q1
#' metadata_19Q4 metadata_19Q3 metadata_19Q2 metadata_19Q1 depmap_metadata
#' 
metadata <- NULL