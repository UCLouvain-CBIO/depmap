#' TPM
#'
#' CCLE RNAseq gene expression data at scale (log2(TPM+1)). This data originates
#' from the `CCLE_depMap_19Q1_TPM` file. This data shows expression data only 
#' for protein coding genes. This dataset contains 57820 Genes, 1165 Cell Lines,
#' 33 Primary Diseases, 32 Lineages. First column is the DepMap ID# of the cell 
#' lineage and the second column is the CCLE name for that cell line. The 
#' remaining columns consist of the gene expression data.
#'
#' @format A data frame with 1165 rows (cell lines) and 57822 variables (genes):
#' \describe{
#'      \item{depmapID}{cell line foreign key (i.e. "ACH-000001")}
#'      \item{cellLine}{Name of cancer cell line (i.e. "NIHOVCAR3_OVARY")}
#'      \item{Gene}{HUGO symbol (e.g. "HSPA5") and Ensembl gene ID} 
#'      (e.g. ENSG00000044574)}
#' }
#' 
#' @details This data represents the `CCLE_depMap_19Q1_TPM` dataset taken from
#' the public depmap portal. This dataset features the addition of a foreign key
#' (depmapID) found in the first column of this dataset, which was added from 
#' the `metadata` dataset. The dataset was also sorted so that the rows of 
#' depmapID were consecutive. 
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