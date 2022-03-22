### =========================================================================
### depmap metadata 22Q1 data 
### -------------------------------------------------------------------------
### This script generates the metadata_22Q1.csv
## note: this script assumes that your current directory is depmap/inst/scripts/
# setwd("~/tmp/depmap/inst/scripts/")
## Links to download: https://depmap.org/portal/download/

data.frame(
    Title = c("crispr_22Q1", "copyNumber_22Q1", "TPM_22Q1",
              "mutationCalls_22Q1", "metadata_22Q1", "achilles_22Q1",
              "gene_summary_22Q1", "drug_sensitivity_21Q2"),
    Description = c(
        paste0("(CERES) Batch and off-target corrected CRISPR-Cas9 gene, ",
               "knockdout dependency data for 17386 genes, 1070 cell lines, ",
               "32 primary diseases and 31 lineages."),
        paste0("WES log copy number data for 25368 genes, 1754 cell lines, 35 ",
               "primary diseases and 38 lineages."),
        paste0("CCLE 'Transcript Per Million' (TPM) RNAseq gene expression ",
               "data (in scale scale (log2(TPM+1))) for protein coding genes ",
               "from 19177 genes, 1393 cell lines, 33 primary diseases ",
               "and 38 lineages."),
        paste0("CCLE mutation calls (for coding region, germline filtered) ",
               "and includes data from 18784 genes, 1759 cell lines, 35 ", 
               "primary diseases and 38 lineages."),
        paste0("Metadata for cell lines in the 22Q1 DepMap release, for 0 ",
               "genes, 1829 cell lines, 35 primary diseases and 40 lineages."),
        paste0("Metadata for DepMap’s cancer models/cell lines, specific to ",
               "Project Achilles’ CRISPR screens."),
        paste0("Gene summaries displaying probability of dependency for each ",
               "cell line"),
        paste0("Drug sensitivity data for cancer cell lines derived from ",
               "replicate collapsed logfold change values relative to DMSO, ",
               "corrected for experimental confounders using ComBat ",
               "representing 4686 compounds, 578 cell lines, 23 primary ",
               "diseases and 25 lineages")),
    BiocVersion = "3.15",
    Genome = "", 
    SourceType = "CSV",
    SourceUrl = c("https://ndownloader.figshare.com/files/34008491",
                  "https://ndownloader.figshare.com/files/34008428",
                  "https://ndownloader.figshare.com/files/34008404",
                  "https://ndownloader.figshare.com/files/34008434",
                  "https://ndownloader.figshare.com/files/34008503",
                  "https://ndownloader.figshare.com/files/34008386",
                  "https://depmap.org/portal/api/download/gene_dep_summary",
                  "https://ndownloader.figshare.com/files/17008628"
                  ),
    SourceVersion = "Feb 17 2022",
    Species = "Homo sapiens",
    TaxonomyId = 9606,
    Coordinate_1_based = TRUE,
    DataProvider = "Broad Institute",
    Maintainer = "Theo Killian <theo.killian@vib.be>",
    RDataClass = "tibble",
    DispatchClass = "Rda",
    RDataPath = c("depmap/crispr_22Q1.rda",
                  "depmap/copyNumber_22Q1.rda",
                  "depmap/TPM_22Q1.rda",
                  "depmap/mutationCalls_22Q1.rda",
                  "depmap/metadata_22Q1.rda",
                  "depmap/achilles_22Q1.rda",
                  "depmap/gene_summary_22Q1.rda",
                  "depmap/drug_sensitivity_21Q2.rda"),
    Tags = paste0(
 "ExperimentHub, ExperimentData, ReproducibleResearch, RepositoryData, ",
 "AssayDomainData, CopyNumberVariationData, DiseaseModel, CancerData, ",
 "BreastCancerData, ColonCancerData, KidneyCancerData, LeukemiaCancerData, ",
 "LungCancerData, OvarianCancerData, ProstateCancerData OrganismData, ",
 "Homo_sapiens_Data, PackageTypeData, SpecimenSource, CellCulture, Genome, ", 
 "Proteome, StemCell, Tissue"),
    Notes = "This dataset is from the 22Q1 release") -> meta_22Q1

write.csv(meta_22Q1, file = "../extdata/metadata_22Q1.csv", row.names = FALSE)
## to upload this metadata to EH, enter the following into the CL
# ExperimentHubData::makeExperimentHubMetadata(pathToPackage = "~/tmp/depmap/",
#                                              fileName = "metadata_22Q1.csv")