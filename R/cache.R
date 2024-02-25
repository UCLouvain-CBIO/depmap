##' @title Depmap Package Cache
##'
##' @name dmCache
##'
##' @description
##'
##' Function to access (and manage) the depmap package
##' cache. `dmCache()` returns the central `depmap` cache.
##'
##' @details
##'
##' The cache is an object of class `BiocFileCache`, and created with
##' [BiocFileCache::BiocFileCache()]. It can be either the
##' package-wide cache as defined by `dmCache()` or an instaned
##' provided by the user.
##'
##' When projects are cached, they are given a resource name
##' (`rname`), that is set to the file's identifier.
##'
##' @return The `dmCache()` function returns an instance of class
##'     `BiocFileCache`.
##'
##' @rdname cache
##'
##' @author Laurent Gatto
##'
##' @export
##'
##' @importFrom tools R_user_dir
##' @importFrom BiocFileCache BiocFileCache bfcquery bfcadd bfcrpath
##'
##' @examples
##'
##' ## Default depmap cache
##' dmCache()
dmCache <- function() {
    cache <- tools::R_user_dir(package = "depmap", which = "cache")
    BiocFileCache::BiocFileCache(cache, ask = interactive())
}

dmget1 <- function(url, cache = dmCache()) {
    ## Query the local depmap cache
    rid <- bfcquery(cache, url, "fpath", exact = TRUE)$rid
    ## Add the new file to the cache
    if (!length(rid)) {
        message("Downloading ", basename(url), " file." )
        rid <- names(bfcadd(cache, url, url))
    } else {
        message("Loading ", basename(url), " from cache." )
    }
    bfcrpath(cache, rids = rid)
}
