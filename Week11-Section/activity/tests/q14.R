test = list(
  name = "q14",
  cases = list(
    ottr::TestCase$new(
      name = "q14",
      hidden = FALSE,
      code = {
        get.coefs <- function(x) {
          if (inherits(x, "summary.lm")) return(x$coefficients)
          if (inherits(x, "lm")) return(summary(x)$coefficients)
          NULL
        }
        cf <- get.coefs(q14)
        if (is.null(cf)) {
          testthat::fail("q14 should be the output of lm() or summary(lm()).")
        } else {
          testthat::expect_setequal(rownames(cf), c("(Intercept)", "fatality_percent", "lutheran_percent", "city", "prewar_conservative_vote_percent"))
          testthat::expect_equal(cf["(Intercept)", "Estimate"], -17.9893075444, tolerance = 1e-4, info = "Check the estimate on (Intercept).")
          testthat::expect_equal(cf["fatality_percent", "Estimate"], 1.0073970391, tolerance = 1e-4, info = "Check the estimate on fatality_percent.")
          testthat::expect_equal(cf["lutheran_percent", "Estimate"], 0.2963304383, tolerance = 1e-4, info = "Check the estimate on lutheran_percent.")
          testthat::expect_equal(cf["city", "Estimate"], -0.7279969738, tolerance = 1e-4, info = "Check the estimate on city.")
          testthat::expect_equal(cf["prewar_conservative_vote_percent", "Estimate"], 0.1479117560, tolerance = 1e-4, info = "Check the estimate on prewar_conservative_vote_percent.")
        }
      }
    )
  )
)
