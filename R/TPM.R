#' TPM_22Q1
#'
#' The `TPM` dataset contains the 22Q1 CCLE "Transcript Per Million" RNAseq gene
#' expression data for protein coding genes. This dataset includes data from
#' 19177 genes, 1393 cell lines, 33 primary diseases and 38 lineages. The
#' columns of `TPM` are: `depmap_id`, a foreign key corresponding to the cancer
#' cell lineage, `cell_line` the common CCLE name of the cancer cell lines,
#' `gene` containing both the HUGO gene name of the knockdown gene along with
#' ensembl ID#, `gene_name` containing the HUGO gene name and `ensembl_id`
#' containing only the ensembl ID# and `rna_expression` which contains the
#' numerical protein coding gene expression change at scale (log2(TPM+1)). This
#' dataset can be loaded into R environment with the `depmap_TPM` function.
#'
#' @format A data frame with 26713561 rows (cell lines) and 6 variables:
#' \describe{
#'      \item{depmap_id}{Cell line foreign key (i.e. "ACH-000956")}
#'      \item{cell_line}{Name of cancer cell line (i.e. "22RV1_PROSTATE")}
#'      \item{gene}{HUGO symbol and Ensembl ID (e.g. TSPAN6 (ENSG00000000003))}
#'      \item{gene_name}{HUGO symbol (e.g. "TSPAN6")}
#'      \item{ensembl_id}{Ensembl ID (e.g. ENSG00000044574)}
#'      \item{rna_expression}{Log fold (log2(TPM+1)) protein expression change}
#' }
#'
#' @details This data originates from the `CCLE_expression.csv` file taken
#' from the 22Q1 [Broad Institute](https://depmap.org/portal/download/) cancer
#' depenedency study. The derived dataset found in the `depmap` package features
#' the addition of a foreign key `depmap_id` found in the first column of this
#' dataset, which was added from the `metadata` dataset. This dataset has been
#' converted to a long format tibble. Variables names from the original dataset
#' were converted to lower case, put in snake case, and abbreviated where
#' feasible. 
#'
#' @section Change log:
#' 
#' - 19Q1: Initial dataset consisted of a data frame with 67360300 rows (cell
#' lines) and 6 variables representing 57820 genes, 1165 cell lines, 33
#' primary diseases, 32 lineages.
#' 
#' - 19Q2: removes 1618 genes, adds 36 cell lines, removes one primary disease
#' and adds 1 lineage
#' 
#' - 19Q3: removes 37058 genes, adds 9 cell lines, removes 2 primary diseases.
#' Now a 23164240 by 6 dataframe.
#' 
#' - 19Q4: 0 genes, 39 cancer cell lines, 0 primary diseases and 1 lineage
#' 
#' - 20Q1: adds 31 cell lines
#' 
#' - 20Q2: adds 34 cell lines. `expression` changed to `rna_expression`
#' 
#' - 20Q3: adds 1 cell line
#' 
#' - 20Q4: removes 38 genes and 71 cell lines, addes 1 primary disease and 3
#'  lineages
#'  
#' - 21Q1: removes 5 genes
#' 
#' - 21Q2: adds 3 cell lines. Additionally, a bug was fixed where the Entrez ID
#' appeared as Ensembl_ID. This was changed for all previous versions of this
#' dataset from 19Q3 to 21Q2
#' 
#' - 21Q3: removes 2 cell lines
#' 
#' - 21Q4: adds 12 cell lines
#' 
#' - 22Q1: adds 4 cell lines and 1 lineage
#'
#' @docType data
#'
#' @import dplyr
#'
#' @keywords datasets
#'
#' @examples
#' \dontrun{
#' depmap_TPM()
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
#' (\href{"https://www.ncbi.nlm.nih.gov/pubmed/29083409"}{Pubmed})
#'  
#' Mahmoud Ghandi, Franklin W. Huang, Judit Jané-Valbuena, Gregory V. Kryukov,
#' ... Todd R. Golub, Levi A. Garraway & William R. Sellers. 2019. Next-
#' generation characterization of the Cancer Cell Line Encyclopedia. Nature 569,
#' 503–508 (2019).
#' (\href{"https://www.nature.com/articles/s41586-019-1186-3"}{Nature}) 
#'
#' @source \href{"https://depmap.org/portal/download/"}{DepMap, Broad (2020)}
#'
#' @rdname TPM
#'
#' @aliases depmap_TPM TPM_19Q1 TPM_19Q2 TPM_19Q3 TPM_19Q4 TPM_20Q1 TPM_20Q2
#' TPM_20Q3 TPM_20Q4 TPM_21Q1 TPM_21Q2 TPM_21Q3 TPM_21Q4 TPM_22Q1
#' 
TPM <- NULL