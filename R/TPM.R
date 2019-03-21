#' TPM
#'
#' TPM is the CCLE RNAseq gene expression data at scale (log2(TPM+1)). This data 
#' is derived from the `CCLE_depMap_19Q1_TPM` file that can be downloaded at the 
#' [Broad Institute depmap]{https://depmap.org/portal/download} portal. This 
#' dataset contains 57820 Genes, 1165 Cell Lines, 33 Primary Diseases, 32 
#' Lineages. This data only shows expression data for protein coding genes. 
#' First column is the DepMap ID# of the cell lineage and the second column 
#' is the gene being tested for that cell line. Other columns are cellLine, 
#' gene_name and entrez_Id and expression, the numerical scale (log2(TPM+1))
#' expression change.
#'
#' @format A tibble data frame with 67360300 rows (cell lines) and 6 variables:
#' \describe{
#'      \item{depmapID}{cell line foreign key (i.e. "ACH-000956")}
#'      \item{gene}{HUGO symbol and Ensembl ID e.g. (e.g. TSPAN6 
#'      (ENSG00000000003))}
#'      \item{expression}{Log fold scale (log2(TPM+1)) protein expression}
#'      \item{gene_name}{HUGO symbol (e.g. "TSPAN6")}
#'      \item{gene}{HUGO symbol (e.g. "TSPAN6")}
#'      \item{ensembl_ID}{Name of and Ensembl ID e.g. ENSG00000044574)}
#'      \item{cellLine}{Name of cancer cell line (i.e. "22RV1_PROSTATE")}
#' }
#' 
#' @details This data represents the `CCLE_depMap_19Q1_TPM` dataset taken from
#' the public depmap portal. This dataset features the addition of a foreign key
#' (depmapID) found in the first column of this dataset, which was added from 
#' the `metadata` dataset. The dataset was converted to the long format and also
#' sorted so that the rows of depmapID were consecutive. 
#'
#' @docType data
#'
#' @usage data(TPM)
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