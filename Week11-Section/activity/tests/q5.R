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
          testthat::expect_setequal(rownames(cf), c("(Intercept)", "fatality_percent"))
          testthat::expect_equal(cf["(Intercept)", "Estimate"], -30.806938563, tolerance = 1e-4, info = "Check the estimate on (Intercept).")
          testthat::expect_equal(cf["fatality_percent", "Estimate"], 1.805307404, tolerance = 1e-4, info = "Check the estimate on fatality_percent.")
        }
      }
    )
  )
)
