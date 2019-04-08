testthat::context("coerce2data.table")
testthat::context(renderBoxplot)
testthat::test_that("output plotl equals expected plot", {
  
  seed <- 12345
  
  if (FALSE) {
    set.seed(seed)
    dat <- data.frame(xval = sample(100, 1000, replace = TRUE),
                      group = as.factor(sample(c("a", "b", "c"), 1000, replace = TRUE)))
    saveRDS(dat, file = "unitTestsWorkshopPackage/inst/testdata/data_for_boxplot.RDS")
    
    # recreate boxplot
    unitTestsWorkshopPackage::takeScreenshot({
      set.seed(321)
      renderBoxplot(dat, jitter = 0.3)
    }, target.path = "unitTestsWorkshopPackage/inst/testdata/plotly_boxplot.png", overwrite = TRUE, is.plotly = TRUE)
    
  }
  
  unitTestsWorkshopPackage::compareImages(
    unitTestsWorkshopPackage::takeScreenshot({
      set.seed(321)
      renderBoxplot(dat, jitter = 0.3)
    }, is.plotly = TRUE), 
    "unitTestsWorkshopPackage/inst/testdata/plotly_boxplot.png"
  )
  
})