### =========================================================================
### depmap metadata 21Q4 data 
### -------------------------------------------------------------------------
### This script generates the metadata_21Q4.csv
## note: this script assumes that your current directory is depmap/inst/scripts/
# setwd("~/tmp/depmap/inst/scripts/")
## Links to download: https://depmap.org/portal/download/

data.frame(
    Title = c(paste0("crispr_21Q4"), 
              paste0("copyNumber_21Q4"),
              paste0("TPM_21Q4"),
              paste0("mutationCalls_21Q4"),
              paste0("metadata_21Q4")),
    Description = c(
        paste0("(CERES) Batch and off-target corrected CRISPR-Cas9 gene, ",
               "knockdout dependency data for 17386 genes, 1054 cell lines, 32 ",
               "primary diseases and 30 lineages."),
        paste0("WES log copy number data for 27368 genes, 1750 cell lines, 35 ",
               "primary diseases and 37 lineages."),
        paste0("CCLE 'Transcript Per Million' (TPM) RNAseq gene expression ",
               "data (in scale scale (log2(TPM+1))) for protein coding genes ",
               "from 19177 genes, 1389 cell lines, 33 primary diseases ",
               "and 37 lineages."),
        paste0("CCLE mutation calls (for coding region, germline filtered) ",
               "and includes data from 18784 genes, 1755 cell lines, 35 ", 
               "primary diseases and 37 lineages."),
        paste0("Metadata for cell lines in the 21Q4 DepMap release, for 0 ",
               "genes, 1825 cell lines, 35 primary diseases and 39 lineages.")),
    BiocVersion = "3.14",
    Genome = "", 
    SourceType = "CSV",
    SourceUrl = c(paste0("https://ndownloader.figshare.com/files/31315996"), 
                  paste0("https://ndownloader.figshare.com/files/31315924"), 
                  paste0("https://ndownloader.figshare.com/files/31315882"),
                  paste0("https://ndownloader.figshare.com/files/31315930"),
                  paste0("https://ndownloader.figshare.com/files/31316011")),
    SourceVersion = "Nov 10 2021",
    Species = "Homo sapiens",
    TaxonomyId = 9606,
    Coordinate_1_based = TRUE,
    DataProvider = "Broad Institute",
    Maintainer = "Theo Killian <theo.killian@kuleuven.be>",
    RDataClass = "tibble",
    DispatchClass = "Rda",
    RDataPath = c(paste0("depmap/crispr_21Q4.rda"),
                  paste0("depmap/copyNumber_21Q4.rda"),
                  paste0("depmap/TPM_21Q4.rda"),
                  paste0("depmap/mutationCalls_21Q4.rda"),
                  paste0("depmap/metadata_21Q4.rda")),
    Tags = paste0(
 "ExperimentHub, ExperimentData, ReproducibleResearch, RepositoryData, ",
 "AssayDomainData, CopyNumberVariationData, DiseaseModel, CancerData, ",
 "BreastCancerData, ColonCancerData, KidneyCancerData, LeukemiaCancerData, ",
 "LungCancerData, OvarianCancerData, ProstateCancerData OrganismData, ",
 "Homo_sapiens_Data, PackageTypeData, SpecimenSource, CellCulture, Genome, ", 
 "Proteome, StemCell, Tissue"),
    Notes = "This dataset is from the 21Q4 release") -> meta_21Q4

write.csv(meta_21Q4, file = "../extdata/metadata_21Q4.csv", row.names = FALSE)
## to upload this metadata to EH, enter the following into the CL
# ExperimentHubData::makeExperimentHubMetadata(pathToPackage = "~/tmp/depmap/",
#                                              fileName = "metadata_21Q4.csv")