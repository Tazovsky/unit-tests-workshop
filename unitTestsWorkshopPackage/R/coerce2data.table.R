
#' coerce2data.table
#' 
#' Coerces \code{data.frame} to \code{data.table} class
#' 
#' @param df data.frame
#' @param keep.rownames see \link[data.table]{data.table} 
#' @param check.names see \link[data.table]{data.table}
#' @param key see \link[data.table]{data.table}
#' @param stringsAsFactors see \link[data.table]{data.table}
#'
#' @return data.table
#' @export
#'
coerce2data.table <- function(df,
                              keep.rownames = FALSE,
                              check.names = FALSE,
                              key = NULL,
                              stringsAsFactors = FALSE
) {
  data.table::data.table(
    df ,
    keep.rownames = keep.rownames,
    check.names = keep.rownames,
    key = key,
    stringsAsFactors = stringsAsFactors
  )
}