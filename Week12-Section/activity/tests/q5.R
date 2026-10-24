test = list(
  name = "q5",
  cases = list(
    ottr::TestCase$new(
      name = "q5",
      hidden = FALSE,
      code = {
        get.coefs <- function(x) {
          if (inherits(x, "summary.lm")) return(x$coefficients)
          if (inherits(x, "lm")) return(summary(x)$coefficients)
          NULL
        }
        cf <- get.coefs(q5)
        if (is.null(cf)) {
          testthat::fail("q5 should be the output of lm() or summary(lm()).")
        } else {
          testthat::expect_setequal(rownames(cf), c("(Intercept)", "treatmentMedia Literacy", "age", "girl", "grade", "asset_index", "mobile_internet", "reading", "science"))
          testthat::expect_true(abs(cf["(Intercept)", "Estimate"] - (-0.57561730313)) < 1e-4, info = "Check the estimate on (Intercept).")
          testthat::expect_true(abs(cf["treatmentMedia Literacy", "Estimate"] - (0.31686730953)) < 1e-4, info = "Check the estimate on treatmentMedia Literacy.")
          testthat::expect_true(abs(cf["age", "Estimate"] - (-0.01171859887)) < 1e-4, info = "Check the estimate on age.")
          testthat::expect_true(abs(cf["girl", "Estimate"] - (-0.13883025482)) < 1e-4, info = "Check the estimate on girl.")
          testthat::expect_true(abs(cf["grade", "Estimate"] - (0.04470712752)) < 1e-4, info = "Check the estimate on grade.")
          testthat::expect_true(abs(cf["asset_index", "Estimate"] - (0.09596115936)) < 1e-4, info = "Check the estimate on asset_index.")
          testthat::expect_true(abs(cf["mobile_internet", "Estimate"] - (-0.03308505598)) < 1e-4, info = "Check the estimate on mobile_internet.")
          testthat::expect_true(abs(cf["reading", "Estimate"] - (0.04813757272)) < 1e-4, info = "Check the estimate on reading.")
          testthat::expect_true(abs(cf["science", "Estimate"] - (0.07733760433)) < 1e-4, info = "Check the estimate on science.")
        }
      }
    )
  )
)
