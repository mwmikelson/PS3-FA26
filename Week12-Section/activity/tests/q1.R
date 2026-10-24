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
          testthat::expect_setequal(rownames(cf), c("(Intercept)", "treatmentMedia Literacy"))
          testthat::expect_true(abs(cf["(Intercept)", "Estimate"] - (-0.0003136179902)) < 1e-4, info = "Check the estimate on (Intercept).")
          testthat::expect_true(abs(cf["treatmentMedia Literacy", "Estimate"] - (0.31577006466)) < 1e-4, info = "Check the estimate on treatmentMedia Literacy.")
        }
      }
    )
  )
)
