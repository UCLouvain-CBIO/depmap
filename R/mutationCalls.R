#' mutationCalls_20Q4
#'
#' The `mutationCalls` dataset contains merged the 20Q4 mutation calls (for
#' coding region, germline filtered) and includes data from 18789 genes, 1749
#' cell lines, 35 primary diseases and 38 lineages. This dataset can be
#' considered the metadata data set for mutations and does not contain any
#' dependency data. This dataset can be loaded into the R environment with the
#' `depmap_mutationCalls` function.
#'
#' @format A data frame with 1293716 rows and 32 variables:
#' \describe{
#'   \item{depmap_id}{depmap_id}
#'   \item{gene_name}{Hugo Symbol denotes a unique and meaningful name for each
#'   gene (e.g. SAP25)}
#'   \item{entrez_id}{Gene ID for NCBI Entrez gene database, (e.g. 100316904)}
#'   \item{ncbi_build}{NCBI Build (i.e. reference genome)}
#'   \item{chromosome}{Chromosome}
#'   \item{start_pos}{Gene start position}
#'   \item{end_pos}{Gene end position}
#'   \item{strand}{Strand location of gene}
#'   \item{var_class}{Variant Classification}
#'   \item{var_type}{Variant Type}
#'   \item{ref_allele}{Reference Allele}
#'   \item{tumor_seq_allele1}{Tumor Seq Allele1}
#'   \item{dbSNP_RS}{Single Nucleotide Polymorphism Database (dbSNP) reference cluster}
#'   \item{dbSNP_val_status}{dbSNP Val Status}
#'   \item{genome_change}{Genome Change}
#'   \item{annotation_transcript}{Annotation Transcript}
#'   \item{cDNA_change}{change in cDNA}
#'   \item{codon_change}{Codon_Change}
#'   \item{protein_change}{Protein_Change}
#'   \item{is_deleterious}{Status of gene knockout on cell lineage}
#'   \item{is_tcga_hotspot}{isTCGAhotspot}
#'   \item{tcga_hsCnt}{TCGAhsCnt}
#'   \item{is_cosmic_hotspot}{isCOSMIChotspot}
#'   \item{cosmic_hsCnt}{COSMIChsCnt}
#'   \item{ExAC_AF}{ExAC_AF}
#'   \item{CGA_WES_AC}{CGA_WES_AC}
#'   \item{sanger_WES_AC}{SangerWES_AC}
#'   \item{RNAseq_AC}{RNAseq_AC}
#'   \item{HC_AC}{HC_AC}
#'   \item{RD_AC}{RD_AC}
#'   \item{WGS_AC}{WGS_AC}
#'   \item{var_annotation}{Variant_annotation}
#' }
#'
#' @details This data represents the `CCLE_mutations.csv` file taken from the
#' 20Q4 [Broad Institute](https://depmap.org/portal/download/) cancer
#' depenedency study. The derived dataset found in the `depmap` package features
#' the addition of a foreign key `depmap_id` found in the first column of this
#' dataset, which was added from the `metadata` dataset. This dataset has been
#' converted to a long format tibble. Variables names from the original dataset
#' were converted to lower case, put in snake case, and abbreviated where
#' feasible.
#' 
#' @section Change log:
#' 
#' - 19Q1: Initial dataset for package consisted of dataframe with 1243145 rows
#' and 35 variables representing 18755 genes, 1601 cell lines, 37 primary
#' diseases and 33 lineages
#' 
#' - 19Q2: adds 30 cell lines, 1 primary disease and 1 lineage. This version has
#' different columns than the previous version: the variable "VA_WES_AC" is no
#' longer present in this dataset. Some minor alterations to the original file
#' were made. The first column of the original dataset, (item{ID}{Sample number})
#' was removed, as this column was only the row number and did not serve any
#' unique identifying purpose.
#' 
#' - 19Q3: adds 1 gene, 25 cell lines and removes 1 primary disease
#' 
#' - 19Q4: adds 1 gene, 10 cell lines, 0 primary diseases and 2 lineages
#' 
#' - 20Q1: adds 4 genes, 31 cell lines, 1 lineage
#' 
#' - 20Q2: adds 44 cell lines, 1 lineage
#' 
#' - 20Q3: no change
#' 
#' - 20Q4: removes 13 genes, adds 8 cell lines and 1 lineage. Columns
#'  `tumor_sample_barcode` and `sanger_recalib_WES_AC` were removed 
#' 
#' @docType data
#'
#' @import dplyr
#'
#' @keywords datasets
#' 
#' @examples
#' \dontrun{
#' depmap_mutationCalls()
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
#' @rdname mutationCalls
#'
#' @aliases mutationCalls_20Q4 mutationCalls_20Q3 mutationCalls_20Q2
#' mutationCalls_20Q1 mutationCalls_19Q4 mutationCalls_19Q3 mutationCalls_19Q2
#' mutationCalls_19Q1 depmap_mutationCalls
#' 
mutationCalls <- NULL