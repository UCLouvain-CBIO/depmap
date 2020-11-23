#' drug_sensitivity_19Q3
#'
#' The `drug_sensitivity` dataset contains the 19Q3 replicate collapsed logfold
#' change values relative to DMSO, corrected for experimental confounders using
#' ComBat. This dataset contains information refering to 4686 compounds, 578
#' cell lines, 23 primary diseases and 25 lineages. This dataset is part of the
#' SIGMA Repurposing release which contains small molecule viability datasets
#' generated using the Broad Repurposing Library and the PRISM multiplexed
#' cell-line viability assay. The columns of `drug_sensitivity` are: `depmap_id`
#' a foreign key corresponding to the cancer cell lineage, `cell_line` the
#' common CCLE name of the cancer cell lines, `compound` the synonym for the
#' drug compound, and `dependency` which contains the numerical dependency score
#' values for each pair of genes and cell lines.
#'
#' @format A data frame with 67498602 rows (cell lines) and 6 variables:
#' \describe{
#'      \item{depmap_id}{Cell line foreign key (i.e. "ACH-000956")}
#'      \item{cell_line}{Name of cancer cell line (i.e. "22RV1_PROSTATE")}
#'      \item{compound}{Drug compound name (i.e. BRD-A00077618-236-07-6::2.5::HTS)}
#'      \item{dependency}{numerical depenency score of a gene for a cell line}
#' }
#'
#' @details This data originates from the 
#' `primary_replicate_collapsed_logfold_change.csv` file taken from the 19Q3
#' [Broad Institute](https://depmap.org/portal/download/) cancer depenedency
#' study. The derived dataset found in the `depmap` package features the
#' addition of a foreign key `depmap_id` found in the first column of this
#' dataset, which was added from the `metadata` dataset. This dataset has been
#' converted to a long format tibble. Variables names from the original dataset
#' were converted to lower case, put in snake case, and abbreviated where
#' feasible. 
#'
#' @section Change log:
#' 
#' - 19Q3: Initial dataset consisted of a data frame with 2708508 rows (cell
#' lines) and 6 variables representing 686 compounds, 578 cell lines, 23 primary
#' diseases and 25 lineages.
#' 
#' - 19Q4: no change, no further releases are scheduled at this time.
#' 
#' - 20Q1: no change, no further releases are scheduled at this time.
#' 
#' - 20Q2: no change, no further releases are scheduled at this time.
#' 
#' - 20Q3: no change, no further releases are scheduled at this time.
#' 
#' - 20Q4: no change, no further releases are scheduled at this time.
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
#' Steven M Corsello, Rohith T Nagari, Ryan D Spangler, Jordan Rossen, Mustafa
#' Kocak, Jordan G Bryan, Ranad Humeidi, David Peck, Xiaoyun Wu, Andrew A Tang,
#' Vickie MWang, Samantha A Bender, Evan Lemire, Rajiv Narayan, Philip
#' Montgomery, Uri Ben-David, Yejia Chen, Matthew G Rees, Nicholas J Lyons,
#' James M McFarland, Bang TWong, Li Wang, Nancy Dumont, Patrick J O'Hearn, Eric
#' Stefan, John G Doench, HeidiGreulich, Matthew Meyerson, Francisca Vazquez,
#' Aravind Subramanian, Jennifer A Roth, Joshua A Bittker, Jesse S Boehm,
#' Christopher C Mader, Aviad Tsherniak, Todd R Golub. 2019. Non-oncology drugs
#' are a source of previously unappreciated anti-cancer activity.
#' (\href{"https://www.biorxiv.org/content/10.1101/730119v1"}{bioRXiv})
#'
#' @source \href{"https://depmap.org/portal/download/"}{DepMap, Broad (2019)}
#'
#' @rdname drug_sensitivity
#'
#' @aliases drug_sensitivity_19Q3 depmap_drug_sensitivity
drug_sensitivity <- NULL