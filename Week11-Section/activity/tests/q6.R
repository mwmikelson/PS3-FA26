test = list(
  name = "q6",
  cases = list(
    ottr::TestCase$new(
      name = "q6",
      hidden = FALSE,
      code = {
        get.coefs <- function(x) {
          if (inherits(x, "summary.lm")) return(x$coefficients)
          if (inherits(x, "lm")) return(summary(x)$coefficients)
          NULL
        }
        cf <- get.coefs(q6)
        if (is.null(cf)) {
          testthat::fail("q6 should be the output of lm() or summary(lm()).")
        } else {
          testthat::expect_setequal(rownames(cf), c("(Intercept)", "fatality_percent", "lutheran_percent", "city"))
          testthat::expect_equal(cf["(Intercept)", "Estimate"], -22.8041389498, tolerance = 1e-4, info = "Check the estimate on (Intercept).")
          testthat::expect_equal(cf["fatality_percent", "Estimate"], 1.1276838715, tolerance = 1e-4, info = "Check the estimate on fatality_percent.")
          testthat::expect_equal(cf["lutheran_percent", "Estimate"], 0.3291768615, tolerance = 1e-4, info = "Check the estimate on lutheran_percent.")
          testthat::expect_equal(cf["city", "Estimate"], -1.3192611555, tolerance = 1e-4, info = "Check the estimate on city.")
        }
      }
    )
  )
)
