##' @importFrom utils read.csv
##' @importFrom ExperimentHub createHubAccessors
.onLoad <- function(libname, pkgname) {
                    # fls <- dir(system.file("extdata", package = pkgname),
                    # full.names = TRUE,
                    # pattern = "metadata")
                    # sapply(fls, function(fl) {
                    # titles <- read.table(fl, stringsAsFactors = FALSE)$Title
                    # createHubAccessors(pkgname, titles)
# })
    ## get metadata upon loading for 19Q1 datasets
    fl <- system.file("extdata", "metadata_19Q1.csv", package = pkgname)
    titles <- utils::read.csv(fl, stringsAsFactors = FALSE)$Title
    ExperimentHub::createHubAccessors(pkgname, titles)
    ## get metadata upon loading for 19Q2 datasets
    fl <- system.file("extdata", "metadata_19Q2.csv", package = pkgname)
    titles <- utils::read.csv(fl, stringsAsFactors = FALSE)$Title
    ExperimentHub::createHubAccessors(pkgname, titles)
    # get metadata upon loading for 19Q3 datasets
    # fl <- system.file("extdata", "metadata_19Q3.csv", package = pkgname)
    # titles <- utils::read.csv(fl, stringsAsFactors = FALSE)$Title
    # ExperimentHub::createHubAccessors(pkgname, titles)
}
 
.onAttach <- function(libname, pkgname) {
    packageStartupMessage(paste0("This is depmap release ", depmap_release()))
}
