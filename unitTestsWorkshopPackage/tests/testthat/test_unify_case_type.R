testthat::context("unify_case_type")

testthat::test_that("log output is correct", {
  
  data <- data.table::data.table(a = c("X", "y", "Z"), b = c("a", "a", "Aa"), c = c("q", "w", "e"))
  
  expected_output <- c(
    "INFO [2019-04-04 15:07:50] Converting columns a, b to lower case",
    "INFO [2019-04-04 15:07:50] Converting columns c to upper case" 
  )
  
  testthat::expect_equal(
    gsub("\\[.*\\]", "", 
         testthat::capture_output_lines(unify_case_type(data, cols2lower = c("a", "b"), cols2upper = "c"))),
    gsub("\\[.*\\]", "", expected_output)
  )
  
})
