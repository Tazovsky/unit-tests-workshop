testthat::context("renderBoxplot")
testthat::test_that("output plot equals expected plot", {
  
  data_seed <- 12345
  plot_seed <- 321
  
  if (FALSE) {
    set.seed(data_seed)
    dat <- data.frame(xval = sample(100, 1000, replace = TRUE),
                      group = as.factor(sample(c("a", "b", "c"), 1000, replace = TRUE)))
    saveRDS(dat, file = file.path("unitTestsWorkshopPackage", "inst", "testdata", "data_for_boxplot.RDS"))
    
    # recreate boxplot
    expected_plot_path <- file.path("unitTestsWorkshopPackage", "inst", "testdata", "plotly_boxplot.png")
    unitTestsWorkshopPackage::takeScreenshot({
      set.seed(plot_seed)
      renderBoxplot(dat, jitter = 0.3)
    }, target.path = expected_plot_path, overwrite = TRUE, is.plotly = TRUE)
    
  }
  
  expected_plot_path <- system.file(file.path("testdata", "plotly_boxplot.png"),
                                    package = "unitTestsWorkshopPackage")
  
  expected_data_path <- system.file(file.path("testdata", "data_for_boxplot.RDS"),
                                    package = "unitTestsWorkshopPackage")
  
  dat <- readRDS(expected_data_path)
  
  compareImages(
    takeScreenshot({
      set.seed(plot_seed)
      renderBoxplot(dat, jitter = 0.3)
    }, is.plotly = TRUE), 
    expected_plot_path
  )
  
})