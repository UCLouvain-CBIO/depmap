#' crispr_20Q3
#'
#' The `crispr` dataset contains the 20Q3 genetic dependency of CRISPR-Cas9 gene
#' knockout of select genes in various cancer cell lines. This dataset includes
#' data from 18119 genes, 789 cell lines, 230primary diseases and 27 lineages.
#' The columns of `crispr` are: `depmap_id` a foreign key corresponding to the
#' cancer cell lineage, `cell_line` containing the common CCLE name of the
#' cancer cell lines, `gene` containing both the HUGO gene name of the knockout
#' gene along with entrez ID#, `gene_name` containing only the HUGO gene name,
#' `entrez_id` containing only the entrez ID# and `dependency` which contains
#' the numerical dependency score values for each pair of genes and cell lines.
#' This dataset can be loaded into R environment with the `depmap_crispr`
#' function. NOTE: the `crispr` dataset has replaced the `rnai` dataset as the
#' primary supported measurement of cancer dependency data as of the 19Q4
#' release.
#'
#' @format A data frame with 14295891 rows (cell lines) and 6 variables:
#' \describe{
#'     \item{depmap_id}{Cancer cell line foreign key (i.e. "ACH-00001")}
#'     \item{gene}{HUGO symbol (e.g. "SAP25") and Entrez ID# (e.g. 100316904)}
#'     \item{gene_name}{HUGO symbol (e.g. "SAP25")}
#'     \item{entrez_id}{Entrez ID# (e.g. 100316904)}
#'     \item{dependency}{numerical depenency score of given gene and cell line}
#'     \item{cell_line}{CCLE name of cancer cell line (i.e. "184A1_BREAST")}
#' }
#'
#' @details This data represents the `Achilles_gene_effect.csv` file taken from
#' the 20Q3 [Broad Institute](https://depmap.org/portal/download/) cancer
#' depenedency study. The derived dataset found in the `depmap` package features
#' the addition of a foreign key `depmap_id` found in the first column of this
#' dataset, which was added from the `metadata` dataset. This dataset has been
#' converted to a long format tibble. Variables names from the original dataset
#' were converted to lower case, put in snake case, and abbreviated where
#' feasible.
#'
#' @section Change log:
#' 
#' - 19Q1: Initial dataset consisted of a data frame with 9839772 rows (cell
#' lines) and 6 variables representing 17634 genes, 558 cell lines, 26 primary
#' diseases and 28 lineages.
#' 
#' - 19Q2: adds 5 cell lines, 1 primary disease and 1 lineage
#'
#' - 19Q3: adds 699 genes, 62 cell lines and 1 primary disease. Now a dataset
#' with 11458125 rows and 6 variables.
#' 
#' - 19Q4: adds 0 genes, 64 cell lines, 1 primary disease and 0 lineages.
#' 
#' - 20Q1: adds 50 cell lines.
#' 
#' - 20Q2: adds 30 cell lines.
#' 
#' - 20Q3: adds 20 cell lines, 1 primary disease and 1 lineages.
#'
#' @docType data
#'
#' @import dplyr
#'
#' @keywords datasets
#' 
#' @examples
#' \dontrun{
#' depmap_crispr()
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
#' @source \href{"https://ndownloader.figshare.com/files/14221385"}{DepMap,
#' Broad (2020)}
#'
#' @rdname crispr
#'
#' @aliases crispr_20Q3 crispr_20Q2 crispr_20Q1 crispr_19Q4 crispr_19Q3
#' crispr_19Q2 crispr_19Q1 depmap_crispr
#' 
crispr <- NULL