### =========================================================================
### depmap metadata 19Q4 data 
### -------------------------------------------------------------------------
### this script generates the metadata_19Q4.csv
## note: this script assumes that your current directory is depmap/inst/scripts/

meta_19Q4 <- data.frame(
    Title = c(# paste0("rnai_19Q4"), ## not found in Q4 release
              paste0("crispr_19Q4"), 
              paste0("copyNumber_19Q4"),
              # paste0("RPPA_19Q4"), ## not found in Q4 release
              paste0("TPM_19Q4"),
              paste0("mutationCalls_19Q4"),
              paste0("metadata_19Q4") #,
              # paste0("drug_sensitivity_19Q4") ## not found in Q4 release
              ),
    Description = c( #paste0("(DEMETER2) Batch and off-target corrected RNAi ", ## not found in Q4 release
                     #      "gene knockdown dependency data for 17309 genes, ", 
                     #      "712 cancer cell lines, 31 primary Diseases and ", 
                     #      "31 lineages."),
                    paste0("(CERES) Batch and off-target corrected CRISPR-Cas9 ", 
                           "gene knockdout dependency data for 18333 genes, ", 
                           "689 cell lines, 29 primary diseases and 26 ", 
                           "lineages."), 
                    paste0("WES log copy number data for 27639 genes, 1682 ", 
                           "cell lines, 35 primary diseases and 36 lineages."),
                    # paste0("Reverse Phase Protein Array (RPPA) Western Blot ",  ## not found in Q4 release
                    #        "expression data from 214 genes, 899 cancer cell ", 
                    #        "lines, 28 primary diseases and 28 lineages."),
                    paste0("CCLE 'Transcript Per Million' (TPM) RNAseq gene ", 
                           "expression data (in scale scale (log2(TPM+1))) ", 
                           "for protein coding genes from 19144 genes, 1249 ", 
                           "cancer cell lines, 32 primary diseases and 34 ", 
                           "lineages."), 
                    paste0("Merged mutation calls (for coding region, germline ", 
                           "filtered) and includes data from 18798 genes, 1666 ", 
                           "cell lines, 35 primary diseases and 36 lineages. "),
                    paste0("Metadata for cell lines in the 19Q1 DepMap release, ", 
                           "for 0 genes, 1756 cell lines, 35 primary diseases ", 
                           "and 37 lineages.") #,
                    # paste0("Drug sensitivity data for cancer cell lines ", ## not found in Q4 release
                    #        "derived from replicate collapsed logfold change ",
                    #        "values relative to DMSO, corrected for experimental ",
                    #        "confounders using ComBat representing 4686 compounds, ",
                    #        "578 cell lines, 23 primary diseases and 25 lineages")
                    ),
    BiocVersion = "3.11",
    Genome = "", 
    SourceType = "CSV", 
    SourceUrl = c(# paste0("https://ndownloader.figshare.com/files/13515395"), ## not updated
                  paste0("https://ndownloader.figshare.com/files/20234073"),
                  paste0("https://ndownloader.figshare.com/files/20234367"),
                  # paste0("https://depmap.org/portal/download/api/download/external?file_name=ccle%2Fccle_2019%2FCCLE_RPPA_20181003.csv"), ## not updated
                  paste0("https://ndownloader.figshare.com/files/20234346"),
                  paste0("https://ndownloader.figshare.com/files/20274747"),
                  paste0("https://ndownloader.figshare.com/files/20274744") #,
                  # paste0("https://ndownloader.figshare.com/files/17008628") ## not updated
                  ),
    SourceVersion = "Dec 20 2019",
    Species = "Homo sapiens",
    TaxonomyId = 9606,
    Coordinate_1_based = TRUE,
    DataProvider = "Broad Institute",
    Maintainer = "Theo Killian <theodore.killian@uclouvain.be>",
    RDataClass = "tibble",
    DispatchClass = "Rda",
    RDataPath = c(#paste0("depmap/rnai_19Q4.rda"), 
                  paste0("depmap/crispr_19Q4.rda"), 
                  paste0("depmap/copyNumber_19Q4.rda"), 
                  #paste0("depmap/RPPA_19Q4.rda"), 
                  paste0("depmap/TPM_19Q4.rda"),
                  paste0("depmap/mutationCalls_19Q4.rda"),
                  paste0("depmap/metadata_19Q4.rda") #,
                  #paste0("depmap/drug_sensitivity_19Q4.rda")
                  ),
    Tags=paste0("ExperimentHub, ExperimentData, ReproducibleResearch, RepositoryData, AssayDomainData, ", 
                "CopyNumberVariationData, DiseaseModel, CancerData, BreastCancerData, ColonCancerData, ", 
                "KidneyCancerData, LeukemiaCancerData, LungCancerData, OvarianCancerData, ProstateCancerData", 
                "OrganismData, Homo_sapiens_Data, PackageTypeData, SpecimenSource, CellCulture, Genome, ", 
                "Proteome, StemCell, Tissue"),
    Notes = "This dataset is from the 19Q4 release")

write.csv(meta_19Q4, file="../extdata/metadata_19Q4.csv", row.names=FALSE)
## to upload this metadata to EH, enter the following into the CL
## ExperimentHubData::makeExperimentHubMetadata("~/tmp/depmap/", fileName = "metadata_19Q4.csv")