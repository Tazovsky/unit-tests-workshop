#' subsetTopNAndJoinDataTOresult
#'
#' Subsets first \code{top_n_rows} rows of data.frame in provided \code{list_data}
#' and then join `data2join` to every element in that list by sepcified \code{key}
#' 
#' @param list_data list containing data.frames
#' @param data2join 
#' @param key 
#' @param top_n_rows 
#'
#' @importFrom dplyr left_join %>%
#' @return list
#' @export
#'
subsetTopNAndJoinDataTOresult <- function(list_data, data2join, key, top_n_rows = 3) {
  
  subsetTopN <- function(input, n) {
    lapply(input, function(x) {
      
      if (!is.data.frame(x))
        stop(sprintf("'x' argument is not data.frame class but %s", class(x)))
      
      utils::head(x, n)
    })
  }
  
  result <- subsetTopN(list_data, top_n_rows)
  
  lapply(result, function(x) {
    x %>% left_join(data2join, by = key)
  })
}