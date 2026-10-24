test = list(
  name = "q1",
  cases = list(
    ottr::TestCase$new(
      name = "q1",
      hidden = FALSE,
      code = {
        get.coefs <- function(x) {
          if (inherits(x, "summary.lm")) return(x$coefficients)
          if (inherits(x, "lm")) return(summary(x)$coefficients)
          NULL
        }
        cf <- get.coefs(q1)
        if (is.null(cf)) {
          testthat::fail("q1 should be the output of lm() or summary(lm()).")
        } else {
          testthat::expect_setequal(rownames(cf), c("(Intercept)", "fatality_percent"))
          testthat::expect_equal(cf["(Intercept)", "Estimate"], -28.474071168, tolerance = 1e-4, info = "Check the estimate on (Intercept).")
          testthat::expect_equal(cf["fatality_percent", "Estimate"], 1.748278516, tolerance = 1e-4, info = "Check the estimate on fatality_percent.")
        }
      }
    )
  )
)
