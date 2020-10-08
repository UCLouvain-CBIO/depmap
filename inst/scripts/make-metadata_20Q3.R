### =========================================================================
### depmap metadata 20Q3 data 
### -------------------------------------------------------------------------
### this script generates the metadata_20Q3.csv
## note: this script assumes that your current directory is depmap/inst/scripts/

meta_20Q3 <- data.frame(
    Title = c(paste0("crispr_20Q3"), 
              paste0("copyNumber_20Q3"),
              paste0("TPM_20Q3"),
              paste0("mutationCalls_20Q3"),
              paste0("metadata_20Q3")),
    Description = c(
        paste0("(CERES) Batch and off-target corrected CRISPR-Cas9 gene, ",
               "knockdout dependency data for 18119 genes, 769 cell lines, 29 ",
               "primary diseases and 26 lineages."), 
        paste0("WES log copy number data for 27639 genes, 1745 cell lines, 35 ",
               "primary diseases and 37 lineages."),
        paste0("CCLE 'Transcript Per Million' (TPM) RNAseq gene expression ",
               "data (in scale scale (log2(TPM+1))) for protein coding genes ",
               "from 19144 genes, 1304 cancer cell lines, 32 primary diseases ",
               "and 34 lineages."), 
        paste0("Merged mutation calls (for coding region, germline filtered) ",
               "and includes data from 18802 genes, 1741 cell lines, 35 ",
               "primary diseases and 37 lineages. "),
        paste0("Metadata for cell lines in the 20Q3 DepMap release, for 0 ",
               "genes, 1804 cell lines, 35 primary diseases and 38 lineages.")),
    BiocVersion = "3.12",
    Genome = "", 
    SourceType = "CSV", 
    SourceUrl = c(paste0("https://ndownloader.figshare.com/files/24613292"),
                  paste0("https://ndownloader.figshare.com/files/24613352"),
                  paste0("https://ndownloader.figshare.com/files/24613325"),
                  paste0("https://ndownloader.figshare.com/files/24613355"),
                  paste0("https://ndownloader.figshare.com/files/24613394")),
    SourceVersion = "Sep 15 2020",
    Species = "Homo sapiens",
    TaxonomyId = 9606,
    Coordinate_1_based = TRUE,
    DataProvider = "Broad Institute",
    Maintainer = "Theo Killian <theodore.killian@kuleuven.vib.be>",
    RDataClass = "tibble",
    DispatchClass = "Rda",
    RDataPath = c(paste0("depmap/crispr_20Q3.rda"), 
                  paste0("depmap/copyNumber_20Q3.rda"),
                  paste0("depmap/TPM_20Q3.rda"),
                  paste0("depmap/mutationCalls_20Q3.rda"),
                  paste0("depmap/metadata_20Q3.rda")),
    Tags=paste0("ExperimentHub, ExperimentData, ReproducibleResearch, RepositoryData, AssayDomainData, ", 
                "CopyNumberVariationData, DiseaseModel, CancerData, BreastCancerData, ColonCancerData, ", 
                "KidneyCancerData, LeukemiaCancerData, LungCancerData, OvarianCancerData, ProstateCancerData", 
                "OrganismData, Homo_sapiens_Data, PackageTypeData, SpecimenSource, CellCulture, Genome, ", 
                "Proteome, StemCell, Tissue"),
    Notes = "This dataset is from the 20Q3 release")

write.csv(meta_20Q3, file = "../extdata/metadata_20Q3.csv", row.names = FALSE)
## to upload this metadata to EH, enter the following into the CL
## ExperimentHubData::makeExperimentHubMetadata("~/tmp/depmap/", fileName = "metadata_20Q3.csv")