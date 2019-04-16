##' @importFrom utils read.csv
.onLoad <- function(libname, pkgname) {
    fl <- system.file("extdata", "metadata.csv", package=pkgname)
    titles <- read.csv(fl, stringsAsFactors=FALSE)$Title
    createHubAccessors(pkgname, titles)
}

.onAttach <- function(libname, pkgname) {
    packageStartupMessage(message("This is depmap release ", depmap_release()))
}
