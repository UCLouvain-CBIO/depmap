### =========================================================================
### depmap metadata 20Q1 data 
### -------------------------------------------------------------------------
### this script generates the metadata_20Q1.csv
## note: this script assumes that your current directory is depmap/inst/scripts/

meta_20Q1 <- data.frame(
    Title = c(paste0("crispr_20Q1"), 
              paste0("copyNumber_20Q1"),
              paste0("TPM_20Q1"),
              paste0("mutationCalls_20Q1"),
              paste0("metadata_20Q1")),
    Description = c( paste0("(CERES) Batch and off-target corrected CRISPR-Cas9 ", 
                           "gene knockdout dependency data for 18333 genes, ", 
                           "739 cell lines, 29 primary diseases and 26 ", 
                           "lineages."), 
                    paste0("WES log copy number data for 27639 genes, 1713 ", 
                           "cell lines, 35 primary diseases and 36 lineages."),
                    paste0("CCLE 'Transcript Per Million' (TPM) RNAseq gene ", 
                           "expression data (in scale scale (log2(TPM+1))) ", 
                           "for protein coding genes from 19144 genes, 1270 ", 
                           "cancer cell lines, 32 primary diseases and 34 ", 
                           "lineages."), 
                    paste0("Merged mutation calls (for coding region, germline ", 
                           "filtered) and includes data from 18802 genes, 1697 ", 
                           "cell lines, 35 primary diseases and 36 lineages. "),
                    paste0("Metadata for cell lines in the 20Q1 DepMap release, ", 
                           "for 0 genes, 1775 cell lines, 35 primary diseases ", 
                           "and 37 lineages.")),
    BiocVersion = "3.11",
    Genome = "", 
    SourceType = "CSV", 
    SourceUrl = c(paste0("https://ndownloader.figshare.com/files/21521910"),
                  paste0("https://ndownloader.figshare.com/files/21521964"),
                  paste0("https://ndownloader.figshare.com/files/21521940"),
                  paste0("https://ndownloader.figshare.com/files/21521967"),
                  paste0("https://ndownloader.figshare.com/files/21522000")),
    SourceVersion = "Feb 20 2019",
    Species = "Homo sapiens",
    TaxonomyId = 9606,
    Coordinate_1_based = TRUE,
    DataProvider = "Broad Institute",
    Maintainer = "Theo Killian <theodore.killian@uclouvain.be>",
    RDataClass = "tibble",
    DispatchClass = "Rda",
    RDataPath = c(paste0("depmap/crispr_20Q1.rda"), 
                  paste0("depmap/copyNumber_20Q1.rda"),
                  paste0("depmap/TPM_20Q1.rda"),
                  paste0("depmap/mutationCalls_20Q1.rda"),
                  paste0("depmap/metadata_20Q1.rda")),
    Tags=paste0("ExperimentHub, ExperimentData, ReproducibleResearch, RepositoryData, AssayDomainData, ", 
                "CopyNumberVariationData, DiseaseModel, CancerData, BreastCancerData, ColonCancerData, ", 
                "KidneyCancerData, LeukemiaCancerData, LungCancerData, OvarianCancerData, ProstateCancerData", 
                "OrganismData, Homo_sapiens_Data, PackageTypeData, SpecimenSource, CellCulture, Genome, ", 
                "Proteome, StemCell, Tissue"),
    Notes = "This dataset is from the 20Q1 release")

write.csv(meta_20Q1, file="../extdata/metadata_20Q1.csv", row.names=FALSE)
## to upload this metadata to EH, enter the following into the CL
## ExperimentHubData::makeExperimentHubMetadata("~/tmp/depmap/", fileName = "metadata_20Q1.csv")