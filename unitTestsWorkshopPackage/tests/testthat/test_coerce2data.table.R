testthat::context("coerce2data.table")

testthat::test_that("output equals expected output", {
  
  if (FALSE) {
    # save expected output
    expected_data <- unitTestsWorkshopPackage::coerce2data.table(head(iris))
    saveRDS(expected_data, file = "expected_output.RDS")
  }
  
  expected_data <- readRDS("expected_output.RDS")
  
  # error should be thrown: Objects equal but not identical
  testthat::expect_identical(unitTestsWorkshopPackage::coerce2data.table(head(iris)), expected_data)
  testthat::expect_equal(unitTestsWorkshopPackage::coerce2data.table(head(iris)), expected_data)
  
  str(expected_data)
  
  testthat::expect_identical(
    attributes(expected_data)$.internal.selfref,
    attributes(unitTestsWorkshopPackage::coerce2data.table(head(iris)))$.internal.selfref
  )
  
})