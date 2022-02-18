##' @importFrom AnnotationHub query
##' @importFrom ExperimentHub ExperimentHub

depmap_data_loading <- function(name) {
   eh <- ExperimentHub::ExperimentHub()
   eh <- AnnotationHub::query(eh, c("depmap", name), ignore.case = FALSE)
   eh_name <- names(eh)[length(eh)]
   eh[[eh_name]]
}

#' @export
depmap_rnai <- function() 
   depmap_data_loading("rnai")

#' @export
depmap_crispr <- function()
   depmap_data_loading("crispr")

#' @export
depmap_copyNumber <- function()
   depmap_data_loading("copyNumber")

#' @export
depmap_RPPA <- function()
   depmap_data_loading("RPPA")

#' @export
depmap_TPM <- function()
   depmap_data_loading("TPM")

#' @export
depmap_metadata <- function()
   depmap_data_loading("metadata")

#' @export
depmap_mutationCalls <- function()
   depmap_data_loading("mutationCalls")

#' @export
depmap_drug_sensitivity <- function()
   depmap_data_loading("drug_sensitivity")

#' @export
depmap_proteomic <- function()
    depmap_data_loading("proteomic")

#' @export
depmap_achilles <- function()
   depmap_data_loading("achilles")

#' @export
depmap_gene_summary <- function()
   depmap_data_loading("gene_summary")
