### =========================================================================
### depmap metadata 21Q3 data 
### -------------------------------------------------------------------------
### this script generates the metadata_21Q3.csv
## note: this script assumes that your current directory is depmap/inst/scripts/
## https://depmap.org/portal/download/

data.frame(
    Title = c(paste0("crispr_21Q3"), 
              paste0("copyNumber_21Q3"),
              paste0("TPM_21Q3"),
              paste0("mutationCalls_21Q3"),
              paste0("metadata_21Q3")),
    Description = c(
        paste0("(CERES) Batch and off-target corrected CRISPR-Cas9 gene, ",
               "knockdout dependency data for 17393 genes, 1032 cell lines, 32 ",
               "primary diseases and 30 lineages."),
        paste0("WES log copy number data for 27562 genes, 1741 cell lines, 35 ",
               "primary diseases and 37 lineages."),
        paste0("CCLE 'Transcript Per Million' (TPM) RNAseq gene expression ",
               "data (in scale scale (log2(TPM+1))) for protein coding genes ",
               "from 19177 genes, 1377 cell lines, 33 primary diseases ",
               "and 37 lineages."),
        paste0("CCLE mutation calls (for coding region, germline filtered) ",
               "and includes data from 18784 genes, 1746 cell lines, 35 ", 
               "primary diseases and 37 lineages."),
        paste0("Metadata for cell lines in the 21Q3 DepMap release, for 0 ",
               "genes, 2944 cell lines, 43 primary diseases and 47 lineages.")),
    BiocVersion = "3.14",
    Genome = "", 
    SourceType = "CSV",
    SourceUrl = c(paste0("https://ndownloader.figshare.com/files/29125323"), 
                  paste0("https://ndownloader.figshare.com/files/29125230"), 
                  paste0("https://ndownloader.figshare.com/files/29124747"),
                  paste0("https://ndownloader.figshare.com/files/29125233"),
                  paste0("https://ndownloader.figshare.com/files/29162481")),
    SourceVersion = "Aug 20 2021",
    Species = "Homo sapiens",
    TaxonomyId = 9606,
    Coordinate_1_based = TRUE,
    DataProvider = "Broad Institute",
    Maintainer = "Theo Killian <theo.killian@kuleuven.be>",
    RDataClass = "tibble",
    DispatchClass = "Rda",
    RDataPath = c(paste0("depmap/crispr_21Q3.rda"),
                  paste0("depmap/copyNumber_21Q3.rda"),
                  paste0("depmap/TPM_21Q3.rda"),
                  paste0("depmap/mutationCalls_21Q3.rda"),
                  paste0("depmap/metadata_21Q3.rda")),
    Tags = paste0(
 "ExperimentHub, ExperimentData, ReproducibleResearch, RepositoryData, ",
 "AssayDomainData, CopyNumberVariationData, DiseaseModel, CancerData, ",
 "BreastCancerData, ColonCancerData, KidneyCancerData, LeukemiaCancerData, ",
 "LungCancerData, OvarianCancerData, ProstateCancerData OrganismData, ",
 "Homo_sapiens_Data, PackageTypeData, SpecimenSource, CellCulture, Genome, ", 
 "Proteome, StemCell, Tissue"),
    Notes = "This dataset is from the 21Q3 release") -> meta_21Q3

write.csv(meta_21Q3, file = "../extdata/metadata_21Q3.csv", row.names = FALSE)
## to upload this metadata to EH, enter the following into the CL
# ExperimentHubData::makeExperimentHubMetadata(pathToPackage = "~/tmp/depmap/",
#                                              fileName = "metadata_21Q3.csv")