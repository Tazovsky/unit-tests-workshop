

df <- mtcars

inherits(df, "data.frame")

inherits(is.list(df), "data.frame")

printHead <- function(x) {
  print(head(x))
}

lapply(as.list(df), printHead)


# solution
printHead2 <- function(df) {
  if (inherits(df, "data.frame")) {
    printHead(df)
  } else if (is.list(df)) {
    lapply(df, printHead)
  } else {
    stop("Invalid argument")
  }
}

printHead2(mtcars)
printHead2(list(mtcars, iris))



