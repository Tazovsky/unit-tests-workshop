#' renderBoxplot
#'
#' Render boxplot
#' 
#' @param dat data.frame
#' @param jitter numeric
#'
#' @return
#' @export plotly
#'
#' @examples
#' \dontrun{
#' dat <- data.frame(xval = sample(100, 1000, replace = TRUE),
#'                   group = as.factor(sample(c("a", "b", "c"), 1000, replace = TRUE)))
#' 
#' renderBoxplot(dat)
#' }
renderBoxplot <- function(dat, jitter = 0.2) {
  
  stopifnot(nrow(dat) > 0)
  stopifnot("xval" %in% colnames(dat))
  stopifnot("group" %in% colnames(dat))
  stopifnot(is.factor(dat$group))
  
  dat %>%
    plot_ly() %>%
    add_trace(
      x = ~ as.numeric(group),
      y = ~ xval,
      color = ~ group,
      type = "box",
      hoverinfo = 'name+y'
    ) %>%
    add_markers(
      x = ~ jitter(as.numeric(group), amount = 0.2),
      y = ~ xval,
      color = ~ group,
      marker = list(size = 6),
      hoverinfo = "text",
      text = ~ paste0("Group: ", group,
                      "<br>xval: ", xval),
      showlegend = FALSE
    ) %>%
    layout(
      legend = list(
        orientation = "h",
        x = 0.5,
        xanchor = "center",
        y = 1,
        yanchor = "bottom"
      ),
      xaxis = list(title = "Group",
                   showticklabels = FALSE)
    )
}

                      