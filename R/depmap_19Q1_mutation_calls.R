#' Depmap_19Q1_mutation_calls
#'
#' Data from merged mutation calls (coding region, germline filtered)
#' Genes 18755
#' Cell Lines 1601
#' Primary Diseases 37
#' Lineages 33
#'
#' @format A data frame with 1243145 rows and 36 variables:
#' \describe{
#'   \item{X1}{Sample number}
#'   \item{Hugo_Symbol}{Hugo Symbol denotes a unique and meaningful name for every known human gene}
#'   \item{Entrez_Gene_Id}{Gene ID for NCBI Entrez gene database}
#'   \item{NCBI_Build}{NCBI_Build}
#'   \item{Chromosome}{Chromosome}
#'   \item{Start_position}{Gene start position}
#'   \item{End_position}{Gene end position}
#'   \item{Strand}{Strand location of gene}
#'   \item{Variant_Classification}{Variant Classification}
#'   \item{Variant_Type}{Variant Type}
#'   \item{Reference_Allele}{Reference Allele}
#'   \item{Tumor_Seq_Allele1}{Tumor Seq Allele1}
#'   \item{dbSNP_RS}{Single Nucleotide Polymorphism Database (dbSNP) reference cluster}
#'   \item{dbSNP_Val_Status}{dbSNP Val Status}
#'   \item{Genome_Change}{Genome Change}
#'   \item{Annotation_Transcript}{Annotation Transcript}
#'   \item{Tumor_Sample_Barcode}{Tumor Sample Barcode}
#'   \item{Codon_Change}{Codon_Change}
#'   \item{Protein_Change}{Protein_Change}
#'   \item{isDeleterious}{If the gene knockout is deleterious to the cell lineage}
#'   \item{isTCGAhotspot}{isTCGAhotspot}
#'   \item{TCGAhsCnt}{TCGAhsCnt}
#'   \item{isCOSMIChotspot}{isCOSMIChotspot}
#'   \item{COSMIChsCnt}{COSMIChsCnt}
#'   \item{ExAC_AF}{ExAC_AF}
#'   \item{VA_WES_AC}{VA_WES_AC}
#'   \item{CGA_WES_AC}{CGA_WES_AC}
#'   \item{SangerWES_AC}{SangerWES_AC}
#'   \item{SangerRecalibWES_AC}{SangerRecalibWES_AC}
#'   \item{RNAseq_AC}{RNAseq_AC}
#'   \item{HC_AC}{HC_AC}
#'   \item{RD_AC}{RD_AC}
#'   \item{WGS_AC}{WGS_AC}
#'   \item{Variant_annotation}{Variant_annotation}
#'   \item{DepMap_ID}{DepMap_ID}
#' }
#'
#' @docType data
#'
#' @usage data(depmap_19Q1_mutation_calls)
#'
#' @format An object of class \code{"cross"}; see \code{\link[qtl]{read.cross}}.
#'
#' @keywords datasets
#'
#' @references Tsherniak, A., Vazquez, F., Montgomery, P. G., Weir, B. A.,
#' Kryukov, G., Cowley, G. S., ... & Meyers, R. M. (2017). Defining a cancer
#' dependency map. Cell, 170(3), 564-576.
#' (\href{https://www.ncbi.nlm.nih.gov/pubmed/28753430}{PubMed})
#'
#' @source \href{https://depmap.org/portal/download/api/download/external?file_name=ccle%2Fdepmap-mutation-calls-9a1a.7%2Fdepmap_19Q1_mutation_calls.csv}{DepMap, Broad (2019)}
#'
#' @examples
#' data(depmap_19Q1_mutation_calls)
#' Tumor_Sample_Barcode <- attr(depmap_19Q1_mutation_calls, "Tumor_Sample_Barcode")
#'
#' \dontrun{
#' depmap_19Q1_mutation_calls
#' }
#'
"depmap_19Q1_mutation_calls"
