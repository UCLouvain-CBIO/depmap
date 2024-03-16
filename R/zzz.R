##' @importFrom utils read.csv
##' @importFrom ExperimentHub createHubAccessors
.onLoad <- function(libname, pkgname) {
    fls <- dir(system.file("extdata", package = pkgname),
               full.names = TRUE, pattern = "metadata")
    if (curl::has_internet()) {
        sapply(fls,
               function(fl) {
                   titles <- read.csv(fl, stringsAsFactors = FALSE)$Title
                   ExperimentHub::createHubAccessors(pkgname, titles)
               })
    } else {
        warning("Not internet connectivity. Unable to create Hub accessors.",
                call. = FALSE)
    }
}

.onAttach <- function(libname, pkgname) {
    packageStartupMessage(paste0("This is depmap release ", depmap_release()))
}
