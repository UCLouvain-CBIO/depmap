#' TPM_19Q1
#'
#' The `TPM` dataset contains the 19Q1 CCLE "Transcript Per Million" RNAseq gene
#' expression data for protein coding genes. This dataset includes data from
#' 57820 genes, 1165 cancer cell lines, 33 primary diseases, 32 lineages. The
#' columns of `TPM` are: `depmap_id`, a foreign key corresponding to the cancer
#' cell lineage,`cell_line` the common CCLE name of the cancer cell lines,
#' `gene` containing both the HUGO gene name of the knockdown gene along with
#' ensembl ID#, `gene_name` containing the HUGO gene name and `ensembl_id`
#' containing only the ensembl ID# and `expression` which contains the numerical
#' protein coding gene expression change at scale (log2(TPM+1)).
#'
#' @format A data frame with 67360300 rows (cell lines) and 6 variables:
#' \describe{
#'      \item{depmap_id}{Cell line foreign key (i.e. "ACH-000956")}
#'      \item{cell_line}{Name of cancer cell line (i.e. "22RV1_PROSTATE")}
#'      \item{gene}{HUGO symbol and Ensembl ID (e.g. TSPAN6 (ENSG00000000003))}
#'      \item{gene_name}{HUGO symbol (e.g. "TSPAN6")}
#'      \item{ensembl_id}{Ensembl ID (e.g. ENSG00000044574)}
#'      \item{expression}{Log fold (log2(TPM+1)) protein expression change}
#' }
#'
#' @details This data originates from the `CCLE_depMap_19Q1_TPM` file taken
#' from the 19Q1 [Broad Institute](https://depmap.org/portal/download/) cancer
#' depenedency study. This dataset features the addition of a foreign key
#' `depmap_id` found in the first column of this dataset, which was added from
#' the `metadata` dataset. This dataset has been converted to a long format
#' tibble. Variables names from the original dataset were converted to lower
#' case, put in snake case, and abbreviated where feasible.
#' 
#' @section Change log:
#' 
#' - 19Q1: none
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
#' @rdname TPM
#'
#' @aliases TPM_19Q1 TPM_19Q2
TPM <- NULL