##' @importFrom utils read.csv
##' @importFrom ExperimentHub createHubAccessors
.onLoad <- function(libname, pkgname) {
    fl <- system.file("extdata", "metadata.csv", package = pkgname)
    titles <- read.csv(fl, stringsAsFactors = FALSE)$Title
    createHubAccessors(pkgname, titles)
}

.onAttach <- function(libname, pkgname) {
    packageStartupMessage(paste0("This is depmap release ", depmap_release()))
}
