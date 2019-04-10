testthat::context("coerce2data.table")

testthat::test_that("output equals expected output", {
  
  if (FALSE) {
    library(unitTestsWorkshopPackage)
    # save expected output
    expected_data <- coerce2data.table(head(iris))
    saveRDS(expected_data, 
            file = file.path("unitTestsWorkshopPackage", "inst", "testdata", "expected_output.RDS"))
  }
  
  expected_data <-  readRDS(system.file(file.path("testdata", "expected_output.RDS"), 
                                        package = "unitTestsWorkshopPackage"))
  
  # error should be thrown: Objects equal but not identical
  testthat::expect_error(
    testthat::expect_identical(unitTestsWorkshopPackage::coerce2data.table(head(iris)), expected_data),
    regexp = "Objects equal but not identical"
  )
  
  testthat::expect_equal(unitTestsWorkshopPackage::coerce2data.table(head(iris)), expected_data)
  
  # str(expected_data)
  testthat::expect_error(
    testthat::expect_identical(
      attributes(expected_data)$.internal.selfref,
      attributes(unitTestsWorkshopPackage::coerce2data.table(head(iris)))$.internal.selfref
    ),
    regexp = "Objects equal but not identical"
  )
  
})