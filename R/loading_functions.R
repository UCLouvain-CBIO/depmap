##' @importFrom AnnotationHub query
##' @importFrom ExperimentHub ExperimentHub


depmap_data_loading <- function(name) {
   eh <- ExperimentHub::ExperimentHub()
   eh <- AnnotationHub::query(eh, c("depmap", name))
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
   depmap_data_loading("copyNumber")

# depmap_drug_sensitivity <- function()
#    # depmap_drug_sensitivity("drug_sensitivity")

#' @export
depmap_drug_sensitivity <- function() {
      eh <- AnnotationHub::query(eh, c("depmap", "drug_sensitivity"))
      eh_name <- names(eh)[length(eh)]
      eh[[eh_name]]
}
