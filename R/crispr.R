#' crispr
#'
#' The `crispr` dataset is the genetic dependency of CRISPR-Cas9 gene knockout 
#' of select genes in various cancer cell lines. This data originates from the 
#' `gene_effect_corrected` file, which was generated from the (Avana) Public 
#' 19Q1 from batch corrected CERES inferred gene effect matrix. This dataset
#' has been converted from wide fromat to the long form dataset and contains 
#' 17634 Genes, 558 Cell Lines, 26 Primary Diseases, 28 Lineages. The first 
#' column is the DepMap ID# of the cell lineage and the second column is the 
#' gene name, the dependecy column contains the numeric dependency score for 
#' the genes and cell lines. Other columns are gene_name and entrez_Id and last 
#' column is the CCLE name for that cell line.
#'
#' @format A data frame with 9839772 rows (each corresponding to an attribute of
#' a given cell lines) and 6 columns:
#' \describe{
#'     \item{depmapID}{cell line foreign key (i.e. "ACH-00001")}
#'     \item{gene}{HUGO symbol (e.g. "SAP25") and Entrez ID# (e.g. 100316904)}
#'     \item{dependency}{numerical depenency score of a gene for a cell line}
#'     \item{entrez_id}{Entrez ID# (e.g. 100316904}
#'     \item{gene_name}{HUGO symbol (e.g. "SAP25")}
#'     \item{cellLine}{Name of cancer cell line (i.e. "184A1_BREAST")}
#'     
#' }
#' @details This data represents the `gene_effect_corrected` dataset taken from
#' the public depmap portal. This dataset features the addition of a foreign key
#' (depmapID) found in the first column of this dataset, which was added from 
#' the `metadata` dataset. The numeric column depenency contains the dependency
#' score for a known gene for a given cell line. The dataset was converted to 
#' the long format and sorted so that the rows of depmapID were consecutive. 
#'
#' @docType data
#'
#' @usage data(crispr)
#'
#' @keywords datasets
#'
#' @references Tsherniak, A., Vazquez, F., Montgomery, P. G., Weir, B. A.,
#' Kryukov, G., Cowley, G. S., ... & Meyers, R. M. (2017). Defining a cancer
#' dependency map. Cell, 170(3), 564-576.
#' (\href{"https://www.ncbi.nlm.nih.gov/pubmed/28753430"}{PubMed})
#'
#' @source \href{"https://ndownloader.figshare.com/files/14221385"}{DepMap, 
#' Broad (2019)}
#'
#' @examples
#' data(crispr)
#' crispr
"crispr"