### =========================================================================
### depmap metadata 22Q2 data 
### -------------------------------------------------------------------------
### This script generates the metadata_22Q2.csv
## note: this script assumes that your current directory is depmap/inst/scripts/
# setwd("~/tmp/depmap/inst/scripts/")
## Links to download: https://depmap.org/portal/download/

data.frame(
    Title = c("crispr_22Q2", "copyNumber_22Q2", "TPM_22Q2",
              "mutationCalls_22Q2", "metadata_22Q2", "achilles_22Q2"),
    Description = c(
        paste0("(CERES) Batch and off-target corrected CRISPR-Cas9 gene, ",
               "knockdout dependency data for 17386 genes, 1086 cell lines, ",
               "31 primary diseases and 28 lineages."),
        paste0("Inferred log copy number data for 25368 genes, 1766 cell ",
               "lines, 33 primary diseases and 30 lineages."),
        paste0("CCLE 'Transcript Per Million' (TPM) RNAseq gene expression ",
               "data (in scale scale (log2(TPM+1))) for protein coding genes ",
               "from 19221 genes, 1406 cell lines, 33 primary diseases ",
               "and 30 lineages."),
        paste0("CCLE mutation calls (for coding region, germline filtered) ",
               "and includes data from 18784 genes, 1771 cell lines, 33 ", 
               "primary diseases and 30 lineages."),
        paste0("Metadata for cell lines in the 22Q2 DepMap release, for 0 ",
               "genes, 1840 cell lines, 33 primary diseases and 30 lineages."),
        paste0("Metadata for DepMap’s cancer models/cell lines, specific to ",
               "Project Achilles’ 22Q2 CRISPR screens.")),
    BiocVersion = "3.16",
    Genome = "", 
    SourceType = "CSV",
    SourceUrl = c("https://ndownloader.figshare.com/files/34990036",
                  "https://ndownloader.figshare.com/files/34989937",
                  "https://ndownloader.figshare.com/files/34989919",
                  "https://ndownloader.figshare.com/files/34989940",
                  "https://ndownloader.figshare.com/files/35020903",
                  "https://ndownloader.figshare.com/files/34989901"),
    SourceVersion = "May 9 2022",
    Species = "Homo sapiens",
    TaxonomyId = 9606,
    Coordinate_1_based = TRUE,
    DataProvider = "Broad Institute",
    Maintainer = "Theo Killian <theo.killian@vib.be>",
    RDataClass = "tibble",
    DispatchClass = "Rda",
    RDataPath = c("depmap/crispr_22Q2.rda",
                  "depmap/copyNumber_22Q2.rda",
                  "depmap/TPM_22Q2.rda",
                  "depmap/mutationCalls_22Q2.rda",
                  "depmap/metadata_22Q2.rda",
                  "depmap/achilles_22Q2.rda"),
    Tags = paste0(
 "ExperimentHub, ExperimentData, ReproducibleResearch, RepositoryData, ",
 "AssayDomainData, CopyNumberVariationData, DiseaseModel, CancerData, ",
 "BreastCancerData, ColonCancerData, KidneyCancerData, LeukemiaCancerData, ",
 "LungCancerData, OvarianCancerData, ProstateCancerData OrganismData, ",
 "Homo_sapiens_Data, PackageTypeData, SpecimenSource, CellCulture, Genome, ", 
 "Proteome, StemCell, Tissue"),
    Notes = "This dataset is from the 22Q2 release") -> meta_22Q2

write.csv(meta_22Q2, file = "../extdata/metadata_22Q2.csv", row.names = FALSE)
## to upload this metadata to EH, enter the following into the CL
# ExperimentHubData::makeExperimentHubMetadata(pathToPackage = "~/tmp/depmap/",
#                                              fileName = "metadata_22Q2.csv")