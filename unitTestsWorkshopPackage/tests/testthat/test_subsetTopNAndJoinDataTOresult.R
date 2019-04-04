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