#' drug_sensitivity_21Q2
#'
#' The `drug_sensitivity` dataset contains the 19Q3 replicate collapsed logfold
#' change values relative to DMSO, corrected for experimental confounders using
#' ComBat. This dataset contains information refering to 4686 compounds, 578
#' cell lines, 23 primary diseases and 25 lineages. This dataset is part of the
#' SIGMA Re-purposing release which contains small molecule viability datasets
#' generated using the Broad Re-purposing Library and the PRISM multiplexed
#' cell-line viability assay. The columns of `drug_sensitivity` are: `depmap_id`
#' a foreign key corresponding to the cancer cell lineage, `cell_line` the
#' common CCLE name of the cancer cell lines, `compound` the synonym for the
#' drug compound, and `dependency` which contains the numerical dependency score
#' values for each pair of genes and cell lines. Compounded metadata has also 
#' been added.
#'
#' @format A data frame with 2708508 rows (cell lines) and 14 variables:
#' \describe{
#'      \item{depmap_id}{Cell line foreign key (i.e. "ACH-000956")}
#'      \item{cell_line}{Name of cancer cell line (i.e. "22RV1_PROSTATE")}
#'      \item{compound}{Drug compound name (i.e. BRD-A00077618-236-07-6::2.5::HTS)}
#'      \item{dependency}{numerical depenency score of a compound on a cell line}
#'      \item{broad_id}{Broad ID for compound (i.e. BRD-A00077618-236-07-6)}
#'      \item{name}{Standard chemical name (i.e. 8-bromo-cGMP)}
#'      \item{dose}{Dose of compound}
#'      \item{screen_id}{Broad ID for compound (i.e. HTS)}
#'      \item{moa}{Mechanism of action (i.e. PKA activator)}
#'      \item{target}{Molecular target of compount (i.e. PRKG1)}
#'      \item{disease_area}{Anatomical target (i.e. hematologic malignancy)}
#'      \item{indication}{Prescribed for disease (i.e. acute myeloid leukemia (AML))}
#'      \item{smiles}{Simplified molecular-input line-entry specification}
#'      \item{phase}{Clincal phase}
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
#' feasible. Note: compound metadata was added to this dataset, consisting of
#' 10 new features derived from the file
#' `primary-screen-replicate-collapsed-treatment-info.csv` from the
#' [Broad Institute](https://depmap.org/portal/download/) website. The 
#' Drug sensitivity data remains from 19Q3, however the version was bumped to
#' 21Q2 to distinguish between the different datasets.
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
#' - 21Q1: no change, no further releases are scheduled at this time.
#' 
#' - 21Q2: Drug sensitivity data combined with compound metadata, added 10 new
#'  features from the file primary-screen-replicate-collapsed-treatment-info.csv 
#'  
#' - 21Q3: no change, no further releases are scheduled at this time.
#' 
#' - 21Q4: no change, no further releases are scheduled at this time.
#' 
#' - 22Q1: no change, no further releases are scheduled at this time.
#' 
#' - 22Q2: no change, no further releases are scheduled at this time.
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
#' @source \href{"https://depmap.org/portal/download/"}{DepMap, Broad (2021)}
#'
#' @rdname drug_sensitivity
#'
#' @aliases depmap_drug_sensitivity drug_sensitivity_19Q3 drug_sensitivity_21Q1
#' drug_sensitivity_21Q2
drug_sensitivity <- NULL