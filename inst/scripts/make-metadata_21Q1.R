### =========================================================================
### depmap metadata 21Q1 data 
### -------------------------------------------------------------------------
### this script generates the metadata_21Q1.csv
## note: this script assumes that your current directory is depmap/inst/scripts/
## https://depmap.org/portal/download/

meta_21Q1 <- data.frame(
    Title = c(paste0("crispr_21Q1"), 
              paste0("copyNumber_21Q1"),
              paste0("TPM_21Q1"),
              paste0("mutationCalls_21Q1"),
              paste0("metadata_21Q1")),
    Description = c(
        paste0("(CERES) Batch and off-target corrected CRISPR-Cas9 gene, ",
               "knockdout dependency data for 18119 genes, 808 cell lines, 31 ",
               "primary diseases and 29 lineages."),
        paste0("WES log copy number data for 27562 genes, 1740 cell lines, 35 ",
               "primary diseases and 38 lineages."),
        paste0("CCLE 'Transcript Per Million' (TPM) RNAseq gene expression ",
               "data (in scale scale (log2(TPM+1))) for protein coding genes ",
               "from 19177 genes, 1376 cancer cell lines, 33 primary diseases ",
               "and 37 lineages."),
        paste0("CCLE mutation calls (for coding region, germline filtered) ",
               "and includes data from 18788 genes, 1747 cell lines, 35 ", 
               "primary diseases and 38 lineages."),
        paste0("Metadata for cell lines in the 21Q1 DepMap release, for 0 ",
               "genes, 1811 cell lines, 35 primary diseases and 39 lineages.")),
    BiocVersion = "3.12",
    Genome = "", 
    SourceType = "CSV",
    SourceUrl = c(paste0("https://ndownloader.figshare.com/files/26261293"),
                  paste0("https://ndownloader.figshare.com/files/26261524"),
                  paste0("https://ndownloader.figshare.com/files/26261476"),
                  paste0("https://ndownloader.figshare.com/files/26261527"),
                  paste0("https://ndownloader.figshare.com/files/26261569")),
    SourceVersion = "Feb 7 2021",
    Species = "Homo sapiens",
    TaxonomyId = 9606,
    Coordinate_1_based = TRUE,
    DataProvider = "Broad Institute",
    Maintainer = "Theo Killian <theodore.killian@kuleuven.vib.be>",
    RDataClass = "tibble",
    DispatchClass = "Rda",
    RDataPath = c(paste0("depmap/crispr_21Q1.rda"), 
                  paste0("depmap/copyNumber_21Q1.rda"),
                  paste0("depmap/TPM_21Q1.rda"),
                  paste0("depmap/mutationCalls_21Q1.rda"),
                  paste0("depmap/metadata_21Q1.rda")),
    Tags = paste0(
 "ExperimentHub, ExperimentData, ReproducibleResearch, RepositoryData, ",
 "AssayDomainData, CopyNumberVariationData, DiseaseModel, CancerData, ",
 "BreastCancerData, ColonCancerData, KidneyCancerData, LeukemiaCancerData, ",
 "LungCancerData, OvarianCancerData, ProstateCancerData OrganismData, ",
 "Homo_sapiens_Data, PackageTypeData, SpecimenSource, CellCulture, Genome, ", 
  "Proteome, StemCell, Tissue"),
    Notes = "This dataset is from the 21Q1 release")

write.csv(meta_21Q1, file = "../extdata/metadata_21Q1.csv", row.names = FALSE)
## to upload this metadata to EH, enter the following into the CL
# ExperimentHubData::makeExperimentHubMetadata("~/tmp/depmap/",
#                                              fileName = "metadata_21Q1.csv")