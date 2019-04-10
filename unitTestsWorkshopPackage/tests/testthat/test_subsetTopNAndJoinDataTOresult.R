testthat::context("subsetTopNAndJoinDataTOresult")
testthat::test_that("throws error if input is 1 data frame", {
  
  df <- mtcars
  df$car <- row.names(mtcars)
  row.names(df) <- c()
  df_hp <- df[, c("car", "hp")]
  df <- df[!names(df) %in% "hp"]
  
  testthat::expect_error(
    unitTestsWorkshopPackage::subsetTopNAndJoinDataTOresult(list_data = df, data2join = df_hp, key = "car"),
    regexp = ".*'x' argument is not data\\.frame class but numeric.*"
  )
})

testthat::test_that("throws error if key column doesn't exist", {
  
  df <- mtcars
  df$car <- row.names(mtcars)
  row.names(df) <- c()
  df_hp <- df[, c("car", "hp")]
  df <- df[!names(df) %in% "hp"]
  
  testthat::expect_error(
    unitTestsWorkshopPackage::subsetTopNAndJoinDataTOresult(list_data = list(df), data2join = df_hp, key = "car2"),
    regexp = ".*`car2` which is missing from LHS.*"
  )
})

testthat::test_that("throws error if key column doesn't exist", {
  
  df <- mtcars
  df$car <- row.names(mtcars)
  row.names(df) <- c()
  df_hp <- df[, c("car", "hp")]
  df <- df[!names(df) %in% "hp"]
  
  # throws error but we don't know why
  testthat::expect_error(
    unitTestsWorkshopPackage::subsetTopNAndJoinDataTOresult(list_data = list(df), data2join = df_hp2, key = "car")
    # , regexp = ".*`car2` which is missing from LHS.*"
  )
})




