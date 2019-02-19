#' data_utils

#' remove rows from a matrix that include any NAs
#'
#' @param x a matrix
#' @param indices logical, return indices to remove instead
#' @return the matrix with rows removed, unless indices is TRUE
#' @export
remove.rows.all.nas <- function(x, indices=FALSE) {
    i <- aaply(x, 1, function(r) {all(is.na(r))})
    if (indices) {
        return(which(i))
    } else {
        return(x[ ! i, ])
    }
}

#' remove rows from a matrix that are entirely NAs
#'
#' @inheritParams remove.rows.all.nas
#' @return the matrix with rows removed, unless indices is TRUE
#' @export
remove.rows.any.nas <- function(x, indices=FALSE) {
    i <- aaply(x, 1, function(r) {any(is.na(r))})
    if (indices) {
        return(which(i))
    } else {
        return(x[ ! i, ])
    }
}

#' remove columns from a matrix that include any NAs
#'
#' @inheritParams remove.rows.all.nas
#' @return the matrix with columns removed, unless indices is TRUE
#' @export
remove.cols.all.nas <- function(x, indices=FALSE) {
    i <- aaply(x, 2, function(r) {all(is.na(r))})
    if (indices) {
        return(which(i))
    } else {
        return(x[ , ! i])
    }
}

#' remove columns from a matrix that are entirely NAs
#'
#' @inheritParams remove.rows.all.nas
#' @return the matrix with columns removed, unless indices is TRUE
#' @export
remove.cols.any.nas <- function(x, indices=FALSE) {
    i <- aaply(x, 2, function(r) {any(is.na(r))})
    if (indices) {
        return(which(i))
    } else {
        return(x[, ! i])
    }
}


add.missing.rows <- function(x, i) {
    i <- i[! i %in% rownames(x)]
    x <- rbind(x, matrix(NA, nrow=length(i), ncol=ncol(x),
                         dimnames=list(i, colnames(x))))
}

add.missing.cols <- function(x, j) {
    j <- j[! j %in% colnames(x)]
    x <- cbind(x, matrix(NA, nrow=nrow(x), ncol=length(j),
                         dimnames=list(rownames(x), j)))
}


#' align dataset margins
#'
#' @param datasets list of matrices (columns are samples, rows are genes)
#' @param na.rows if TRUE, add NAs for missing rows, otherwise they are removed
#' @param na.cols if TRUE, add NAs for missing columns, otherwise they are removed
#' @param use.dims either an integer or character vector of length 1
#' @return new list of matrices
#' @export
align.dataset.margins <- function(datasets, na.rows=TRUE, na.cols=FALSE,
                                  use.dims=NULL) {
    
    data.rownames <- llply(datasets, rownames)
    data.colnames <- llply(datasets, colnames)
    
    if (is.null(use.dims)) {
        if (na.rows) {
            row.collapse <- union
        } else {
            row.collapse <- intersect
        }
        
        if (na.cols) {
            col.collapse <- union
        } else {
            col.collapse <- intersect
        }
        
        data.rownames <- Reduce(row.collapse, data.rownames)
        data.colnames <- Reduce(col.collapse, data.colnames)
        
        if (length(data.rownames) < 1) stop("Error: no common rownames")
        if (length(data.colnames) < 1) stop("Error: no common colnames")
        
        if (na.rows) {
            datasets <- llply(datasets, add.missing.rows, data.rownames)
        }
        if (na.cols) {
            datasets <- llply(datasets, add.missing.cols, data.colnames)
        }
    } else {
        stopifnot(!is.null(data.rownames[[use.dims]]))
        stopifnot(!is.null(data.colnames[[use.dims]]))
        
        data.rownames <- data.rownames[[use.dims]]
        data.colnames <- data.colnames[[use.dims]]
        
        datasets <- llply(datasets, add.missing.rows, data.rownames)
        datasets <- llply(datasets, add.missing.cols, data.colnames)
        
    }
    
    datasets <- llply(datasets,
                      function(d) d[data.rownames, data.colnames])
    
}


#' make a tidy dataset
#' @inheritParams align.dataset.margins
#' @param dim.names character vector of length two -
#' these become the column labels in the tidy dataset
#' for the rownames and colnames of the original matrices
#' @return a tidy dataframe
#' @description Takes a list of matrices with similar row and column names
#' and runs tidyr::gather across each to make a "long" dataset
#' with a column of values for each matrix in the list.
#'
#' @export
make.a.tidy.dataset <- function(datasets, na.rows=TRUE, na.cols=FALSE,
                                use.dims=NULL,
                                dim.names=c("Gene", "Sample")) {
    
    datasets <- align.dataset.margins(datasets,
                                      na.rows=na.rows, na.cols=na.cols,
                                      use.dims=use.dims)
    
    tmp.df <- as.data.frame(datasets[[1]])
    
    rows <- rownames(tmp.df)
    cols <- colnames(tmp.df)
    
    tmp.df[, dim.names[1]] <- rows
    tmp.df <- gather_(tmp.df, dim.names[2], "Temp", cols)
    tmp.df <- dplyr::select(tmp.df, -Temp)
    
    data.names <- names(datasets)
    names(data.names) <- data.names
    
    data.columns <- llply(data.names, function(d) {
        gath.df <- gather_(as.data.frame(datasets[[d]]), dim.names[2], d, cols)
        return(gath.df[,d])
    })
    
    return(cbind(tmp.df, dplyr::as_data_frame(data.columns)))
    
}


#' convert data frame to matrix
#' @param df data frame
#' @return a matrix
#' @description Converts a data frame to a matrix
#' @export
df.to.mat <- function(df, fill=NA) {
    row.col <- quo(colnames(df)[1])
    col.col <- quo(colnames(df)[2])
    dat.col <- quo(colnames(df)[3])
    # row.col <- colnames(df)[1]
    df %>%
        as.data.frame() %>%
        select(1:3) %>%
        spread(!!col.col, !!dat.col, fill=fill) %>%
        set_rownames(.[,1]) %>%
        select(-1) %>%
        as.matrix()
}

#' convert matrix to data frame
#' @param mat matrix
#' @param row.name column label of resulting data frame from \code{mat} rows
#' @param col.name column label of resulting data frame from \code{mat} cols
#' @param dat.name column label of resulting data frame from \code{mat} data
#' @return a data frame
#' @description Converts a matrix to data frame
#' @export

mat.to.df <- function(mat, row.name=Row, col.name=Col, dat.name=Dat) {
    row.quo <- enquo(row.name)
    col.quo <- enquo(col.name)
    dat.quo <- enquo(dat.name)
    mat %>%
        as.data.frame %>%
        mutate(!!quo_name(row.quo) := rownames(.)) %>%
        gather(!!col.quo, !!dat.quo, -!!row.quo) %>%
        as.tbl
}


collapse_rows_of_matrix <- function(mat, group_df,
                                    collapse_fun=Matrix::colMeans,
                                    group_var=Group,
                                    sample_var=Sample,
                                    do_parallel=F, ...) {
    
    GroupVar <- enquo(group_var)
    SampleVar <- enquo(sample_var)
    
    GroupStr <- deparse(substitute(group_var))
    SampleStr <- deparse(substitute(sample_var))
    
    group_df <- group_df %>%
        filter(!is.na(!!GroupVar), !is.na(!!SampleVar)) %>%
        filter((!!SampleVar) %in% rownames(mat)) %>%
        distinct(GroupVar, SampleVar)
    
    single_group_df <- group_df %>% group_by(!!GroupVar) %>% filter(n() == 1)
    group_df <- group_df %>% group_by(!!GroupVar) %>% filter(n() > 1)
    
    mat_1 <- mat[single_group_df[[SampleStr]],, drop=F] %>%
        set_rownames(single_group_df[[GroupStr]])
    
    mat_n <-
        daply(group_df, GroupVar, function(g) {
            m <- mat[unique(g[[SampleStr]]),, drop=F]
            do.call(collapse_fun, list(m, ...))
        }, .parallel=do_parallel)
    
    rbind(mat_1, mat_n) %>% {.[sort(rownames(.)), ]}
    
}


downsample_data <- function(dat, col_name, quantiles=c(0.05, 0.25), fracs=c(1, 0.25, 0.1)) {
    
    stopifnot(all(quantiles >= 0 & quantiles <= 1))
    stopifnot(all(diff(quantiles) > 0))
    
    if (any(is.na(quantiles)) | is.null(quantiles) | length(quantiles) == 0) {
        quantiles <- c(0,1)
    } else {
        if (quantiles[1] != 0) quantiles <- c(0, quantiles)
        if (quantiles[length(quantiles)] != 1) quantiles <- c(quantiles, 1)
    }
    stopifnot(length(fracs) == length(quantiles) - 1)
    
    dat$Quantile <- cut(dat[[col_name]], quantile(dat[[col_name]], quantiles),
                        include.lowest=T, ordered_result=T) %>% as.numeric()
    
    dat_downsampled <- ddply(dat, .(Quantile), function(d) {
        d %>% sample_frac(fracs[d$Quantile[1]])
    }) %>% as_data_frame %>% select(-Quantile)
    
}
