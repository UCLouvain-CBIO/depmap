##' @title DepMap Dataset and Files
##'
##' @aliases DepMapDataset dmFileNames dmTitle dmNumFiles
##' @aliases DepMapFiles dmsets dmfiles dmget
##'
##' @description
##'
##' Two tibbles are provided that give access to DepMap data, as
##' shared by the Broad Institute's DepMap project on Figshare
##' (https://figshare.com/authors/Broad_DepMap/5514062).
##'
##' - The [dmsets()] function returns a tibble with DepMap
##'   datasets. Each dataset is described by its title, its unique
##'   identifier, the number of files it contains, the Figshare URL,
##'   and a `DepMapDataset` object that contains further details of
##'   the dataset.
##'
##' - The [dmfiles()] function returns a tibble with DepMap
##'   files. Each file is described by its dataset identifier, its own
##'   unique identifier, its name, size (in bytes), a download URL,
##'   md5 hash and mime type.
##'
##' - Depmap data files can be downloaded with the [dmget()] function,
##'   that takes as input a tibble or data.frame of depmap files such
##'   as `dmfiles`. Files are downloaded and automatically in the
##'   package's central cache. See [dmCache()].
##'
##' @details
##'
##' The `DepMapDataset` class stores the informtion describing a
##' depmap dataset, as stored on Figshare (articles, as it's called
##' there). The [DepMapDataset()] constructor requires one or multiple
##' dataset identifiers and returns one or a list of instances.
##'
##' The following accessors are available:
##' - [dmFileNames()] returns the dataset's filenames.
##' - [dmTitle()] returns the dataset's title.
##' - [dmNumFiles()] returns the number of files in the dataset.
##'
##' (These are used to construct the main depmap dataset tibble.)
##'
##' A tibble describing the files in depmap dataset can be cretated
##' with the [DepMapFiles()] function. It either takes one or multiple
##' dataset idenifiers, or one or a list of `DepMapDataset` instances
##'
##' The [DepMapDataset()] and [DepMapFiles()] functions are mostly
##' used internally, to create the `dmsets` and `dmfiles` tibbles. If
##' a more recent dataset is available on Figshare and not (yet) in
##' the `depmap` package, a user might create the depmap files table
##' to download the files, and/or open a [GitHub
##' issue](https://github.com/UCLouvain-CBIO/depmap) for the new data
##' to be added by the maintainer(s).
##'
##' All the information is retrieved from Figshare using their API, as
##' described at https://docs.figshare.com.
##'
##' @section Adding new datasets:
##'
##' Adding new datasets is simple. Once a new dataset (or Article, as
##' called on Figshare) has been identified on the Broad Institute's
##' [DepMap project on
##' Figshare](https://figshare.com/authors/Broad_DepMap/5514062), one
##' needs to add the dataset's URL to the `depmapURLs` vector in
##' [`inst/extdata/make-dmfiles.R`](https://github.com/UCLouvain-CBIO/depmap/blob/master/inst/scripts/make-dmfiles.R),
##' and re-run the script to update the `dmsets.rds.` and
##' `dmfiles.rds` files in `inst/extdata`.
##'
##' Feel free to send a GitHub pull request or open a [GitHub
##' issue](https://github.com/UCLouvain-CBIO/depmap) for the new data
##' to be added by the maintainer(s).
##'
##' @name DepMapFiles
##'
##' @author Laurent Gatto
##'
##' @importFrom httr2 request req_perform resp_body_json
##' @importFrom tibble as_tibble
##'
##' @examples
##'
##' ## The depmap datasets
##' dmsets
##'
##' ## The depmap files
##' dmfiles
##'
##' ############################################################
##' ## Mostly for internal use, or to update/generate the depmap
##' ## dataset and files tables.
##'
##' ## One dataset identifier: 24667905
##' my_dmset <- DepMapDataset(24667905)
##' my_dmset
##'
##' ## Multiple dataset identifiers
##' my_dmsets <- DepMapDataset(c(24667905, 22765112))
##' my_dmsets
##'
##' ## Create the files table from one or dataset multiple dataset
##' ## identifiers
##'
##' DepMapFiles(24667905)
##' DepMapFiles(my_dmset)
##'
##' DepMapFiles(c(24667905, 22765112))
##' DepMapFiles(my_dmsets)
NULL

.DepMapDataset <-
    setClass("DepMapDataset",
         slots = c(files = "list",
                   title = "character",
                   id = "integer",
                   license = "character",
                   size = "numeric",
                   other = "list"))

setMethod("show", "DepMapDataset",
          function(object) {
              cat("Title:", object@title, "\n")
              cat("Id:", object@id, "\n")
              cat("License:", object@license, "\n")
              cat("Use `DepMapFiles()` to list",
                  length(object@files), "files\n")
          })



.DepMapFiles <- function(x) {
    .dmFiles <- function(x) {
        dataset_id <- x@id
        x <- x@files
        data.frame(
            dataset_id = dataset_id,
            id = sapply(x, "[[", "id"),
            name = sapply(x, "[[", "name"),
            size = sapply(x, "[[", "size"),
            download_url = sapply(x, "[[", "download_url"),
            md5 = sapply(x, "[[", "computed_md5"),
            mimetype = sapply(x, "[[", "mimetype")) |>
            as_tibble()
    }
    if (inherits(x, "DepMapDataset")) .dmFiles(x)
    else do.call(rbind, lapply(x, .dmFiles))
}

##' @rdname DepMapFiles
##' @export
##'
##' @param id `numeric()` with one or multiple DepMap dataset
##'     identifier(s). Note that `id` is converted to an
##'     integer. Missing values are not permitted.
DepMapDataset <- function(id) {
    id <- as.integer(id)
    if (anyNA(id))
        stop("Dataset id must be a non-missing integer.")
    .article <- function(.id) {
        url <- paste0("https://api.figshare.com/v2/articles/", .id)
        x <- request(url) |>
            req_perform() |>
            resp_body_json()
        .DepMapDataset(files = x[[1]],
                       title = x[["title"]],
                       id = x[["id"]],
                       license = x[["license"]][["name"]],
                       size = x[["size"]],
                       other = x[-1])
    }
    res <- lapply(id, .article)
    if (length(res) == 1) res[[1]]
    else res
}

##' @rdname DepMapFiles
##' @export
##'
##' @param x either an `numeric()` that will be passed to
##'     `DepMapDataset` or an instance (or list of) `DepMapDataset`.
DepMapFiles <- function(x) {
    if (is.numeric(x))
        x <- DepMapDataset(x)
    .DepMapFiles(x)
}

##' @rdname DepMapFiles
##' @export
##'
##' @param object an instance of class `DepMapDataset`.
dmFileNames <- function(object) {
    stopifnot(inherits(object, "DepMapDataset"))
    sapply(object@files, "[[", "name")
}

##' @rdname DepMapFiles
##' @export
dmTitle <- function(object) {
        stopifnot(inherits(object, "DepMapDataset"))
        object@title
}

##' @rdname DepMapFiles
##' @export
dmNumFiles <- function(object) {
    stopifnot(inherits(object, "DepMapDataset"))
    length(object@files)
}


##' @rdname DepMapFiles
##' @export
##'
##' @param dmtab A `tibble` or `data.frame` containing the file to be
##'     downloaded, such as [dmfiles()], or created by
##'     [DepMapFiles()]. If is expected to contain the `"name"`,
##'     `"id"` and `"dowload_url"` variables.
##'
##' @param cache Object of class [BiocFileCache()]. Default is to use
##'     the central `depmap` cache returned by [dmCache()], but users
##'     can use their own cache.
dmget <- function(dmtab, cache = dmCache()) {
    if (all(colnames(dmtab) %in% c("name", "id", "dowload_url")))
        stop("Expected variables not found. See ?dmget for details.")
    if (!nrow(dmtab) > 0)
        stop("Empty input.")
    res <- character()
    for (i in seq_len(nrow(dmtab))) {
        .name <- dmtab[i, 'name']
        .id <- dmtab[i, 'id']
        .url <- dmtab[['download_url']][i]
        message("File: ", .name, " (", .id, ")")
        res <- append(res, dmget1(.url, cache))
    }
    res
}

##' @rdname DepMapFiles
##' @export
dmfiles <- function()
    readRDS(dir(system.file("extdata", package = "depmap"),
                pattern = "dmfiles.rds", full.names = TRUE))

##' @rdname DepMapFiles
##' @export
dmsets <- function()
    readRDS(dir(system.file("extdata", package = "depmap"),
                pattern = "dmsets.rds", full.names = TRUE))
