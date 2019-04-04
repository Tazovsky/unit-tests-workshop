

df <- mtcars

inherits(df, "data.frame")

inherits(is.list(df), "data.frame")

printHead <- function(x) {
  print(head(x))
}

lapply(as.list(df), printHead)
lapply(df, printHead)



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


df <- USArrests
df$State <- factor(row.names(USArrests))
row.names(df) <- c()
# split data frame
murders <- df[, c("State", "Murder")]
df <- df[!names(df) %in% names(murders)]

# lets create function to convert factors to character




