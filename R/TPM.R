#' TPM
#'
#' TPM is the CCLE RNAseq gene expression data at scale (log2(TPM+1)). This data 
#' is derived from the `CCLE_depMap_19Q1_TPM`. This dataset contains 57820 
#' Genes, 1165 Cell Lines, 33 Primary Diseases, 32 Lineages. This data only 
#' shows expression data for protein coding genes. The first column is the 
#' `depmap_id` is a foreign key relating to the cell lineage followed by 
#' `cell_line` which contains the common CCLE name of the cancer cell lines, 
#' `gene` which contains both the HUGO gene name of the knockdown gene along 
#' with ensembl ID#, followed by the column `gene_name` which only contains HUGO
#' gene name and `ensembl_id` which contains only the ensembl ID#. The last 
#' column `expression` contains the numerical scale (log2(TPM+1)) protein coding
#' gene expression change.
#'
#' @format A tibble data frame with 67360300 rows (cell lines) and 6 variables:
#' \describe{
#'      \item{depmap_id}{cell line foreign key (i.e. "ACH-000956")}
#'      \item{cell_line}{Name of cancer cell line (i.e. "22RV1_PROSTATE")}
#'      \item{gene}{HUGO symbol and Ensembl ID (e.g. TSPAN6 (ENSG00000000003))}
#'      \item{gene_name}{HUGO symbol (e.g. "TSPAN6")}
#'      \item{ensembl_id}{Ensembl ID (e.g. ENSG00000044574)}
#'      \item{expression}{Log fold scale (log2(TPM+1)) protein expression}
#' }
#' 
#' @details This data represents the `CCLE_depMap_19Q1_TPM` dataset taken from
#' the public depmap portal. This dataset features the addition of a foreign key
#' `depmap_id`` found in the first column of this dataset, which was added from 
#' the `metadata` dataset. The dataset has been converted to the long format.
#'
#' @docType data
#'
#' @usage data(TPM)
#' 
#' @import tibble 
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
#' data(TPM)
#' TPM
"TPM"