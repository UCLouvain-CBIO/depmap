.onLoad <- function(libname, pkgname) {
    message("This is depmap release ", depmap_release())
    fl <- system.file("extdata", "metadata.csv", package=pkgname)
    titles <- read.csv(fl, stringsAsFactors=FALSE)$Title
    createHubAccessors(pkgname, titles)
}