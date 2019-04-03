#' takeScreenshot
#'
#' Takes screenshot from evaluated expressions' output.
#'
#' @param EXPR R expression to evaluate
#' @param target.path character; location of output file
#' @param overwrite logical (default \code{TRUE}); if \code{TRUE} then existing file on \code{target.path} will be overwritten
#' @param is.plotly logical; if \code{TRUE} then use function \link[plotly]{export} to save output;
#' tries to guess using \code{inherits(p, "plotly")} by default
#' @return path to file
#' 
#' @importFrom plotly orca
#' @importFrom grDevices png
#' @export
#' @author Kamil Foltyński
takeScreenshot <- function(EXPR,
                           target.path = tempfile(fileext = ".png"),
                           overwrite = TRUE,
                           is.plotly = inherits(EXPR, "plotly")) {
  
  stopifnot(is.character(target.path))
  stopifnot(is.logical(overwrite))
  stopifnot(is.logical(is.plotly))
  
  if (file.exists(target.path) && !overwrite)
    stop(target.path, " already exists.")
  
  tryCatch(
    expr = {
      if(!is.plotly) {
        grDevices::png(filename = target.path)
        eval(EXPR)
        grDevices::dev.off()
      } else {
        result <- eval(EXPR)
        plotly::export(result, file = target.path)
      }
    },
    error = function(e) {
      unlink(target.path)
      stop("Failed to create a screenshot: ", e$message)
    }
  )
  # make sure it exists before returning a path
  if (!file.exists(target.path))
    stop("Failed to save a screenshot.")
  
  invisible(target.path)
}


#' compareImages
#' 
#' Compare two images
#'
#' @param x path to image 
#' @param y path to image 
#' @param tolerance allowed percentage of difference
#'
#' @importFrom testthat expect_true expect_equal expect_lte
#' @importFrom data.table data.table setkeyv
#' @importFrom png readPNG
#' @return logical
#' @export
#'
compareImages <- function(x, y, tolerance = 0L) {
  testthat::expect_true(file.exists(x))
  testthat::expect_true(file.exists(y))
  img.x <- png::readPNG(x)
  img.y <- png::readPNG(y)
  testthat::expect_equal(base::dim(img.x), base::dim(img.y))
  dt.x <- data.table::data.table(values = img.x)[, `:=`("keys", .I)]
  dt.y <- data.table::data.table(values = img.y)[, `:=`("keys", .I)]
  data.table::setkeyv(dt.x, "keys")
  data.table::setkeyv(dt.y, "keys")
  joined.dt <- dt.y[dt.x]
  diffs.dt <- joined.dt[get("values") != get("i.values")]
  diffs.percentage <- nrow(diffs.dt)/nrow(joined.dt)
  testthat::expect_lte(diffs.percentage, tolerance)
}
