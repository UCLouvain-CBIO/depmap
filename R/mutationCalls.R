#' mutationCalls
#'
#' The `mutationCalls` dataset contains merged mutation calls (for coding
#' region, germline filtered) and includes data from 18755 genes, 1601 cell
#' lines, 37 primary diseases and 33 lineages. This dataset can be considered
#' the metadata data set for mutations and does not contain any dependency data.
#'
#' @format A data frame with 1243145 rows and 35 variables:
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
#'   \item{dbSNP_RS}{Single Nucleotide Polymorphism Database (dbSNP)
#'   reference cluster}
#'   \item{dbSNP_val_status}{dbSNP Val Status}
#'   \item{genome_change}{Genome Change}
#'   \item{annotation_transcript}{Annotation Transcript}
#'   \item{tumor_sample_barcode}{Tumor Sample Barcode}
#'   \item{cDNA_change}{change in cDNA}
#'   \item{codon_change}{Codon_Change}
#'   \item{protein_change}{Protein_Change}
#'   \item{is_deleterious}{Status of gene knockout on cell lineage}
#'   \item{is_tcga_hotspot}{isTCGAhotspot}
#'   \item{tcga_hsCnt}{TCGAhsCnt}
#'   \item{is_cosmic_hotspot}{isCOSMIChotspot}
#'   \item{cosmic_hsCnt}{COSMIChsCnt}
#'   \item{ExAC_AF}{ExAC_AF}
#'   \item{VA_WES_AC}{VA_WES_AC}
#'   \item{CGA_WES_AC}{CGA_WES_AC}
#'   \item{sanger_WES_AC}{SangerWES_AC}
#'   \item{sanger_recalib_WES_AC}{SangerRecalibWES_AC}
#'   \item{RNAseq_AC}{RNAseq_AC}
#'   \item{HC_AC}{HC_AC}
#'   \item{RD_AC}{RD_AC}
#'   \item{WGS_AC}{WGS_AC}
#'   \item{var_annotation}{Variant_annotation}
#' }
#'
#' @details This data represents the `depmap_19Q1_mutation_calls` file taken
#' from the 19Q1 [Broad Institute](https://depmap.org/portal/download/) cancer
#' depenedency study.  This dataset has been converted to a long format tibble.
#' This dataset does not contain any expression or dependency data but rather
#' contains the mutation calls for all cancer cell lines used in the current
#' Depmap 19Q1 release. Some minor alterations to the original file were made.
#' The first column of the original dataset, (item{ID}{Sample number}) was
#' removed, as this column was only the row number and did not serve any unique
#' identifying purpose. In addition, the column `depmap_id` was moved to the
#' front to match the format of the other datasets. Variables names were
#' converted to lower case, put in snake case, and abbreviated where feasible
#' (e.g. "Variant_Annotation" was changed to "var_annotation").
#'
#' @docType data
#'
#' @usage data(mutationCalls)
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
#' @rdname mutationCalls
NULL
