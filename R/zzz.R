##' @importFrom curl has_internet
.onLoad <- function(libname, pkgname) {
    if (curl::has_internet())
        .createDepMapHubAccessors()
    else
        warning("Not internet connectivity. Unable to create Hub accessors.",
                call. = FALSE)
}

.onAttach <- function(libname, pkgname) {
    packageStartupMessage(paste0("This is depmap release ", depmap_release()))
}
