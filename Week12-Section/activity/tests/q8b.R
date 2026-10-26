test = list(
  name = "q8b",
  cases = list(
    ottr::TestCase$new(
      name = "q8b",
      hidden = FALSE,
      code = {
        get.coefs <- function(x) {
          if (inherits(x, "summary.lm")) return(x$coefficients)
          if (inherits(x, "lm")) return(summary(x)$coefficients)
          NULL
        }
        cf <- get.coefs(q8b)
        if (is.null(cf)) {
          testthat::fail("q8b should be the output of lm() or summary(lm()).")
        } else {
          testthat::expect_setequal(rownames(cf), c("(Intercept)", "treatmentMedia Literacy"))
          testthat::expect_true(abs(cf["(Intercept)", "Estimate"] - (-0.04839028840)) < 1e-4, info = "Check the estimate on (Intercept).")
          testthat::expect_true(abs(cf["treatmentMedia Literacy", "Estimate"] - (0.01841061257)) < 1e-4, info = "Check the estimate on treatmentMedia Literacy.")
        }
      }
    )
  )
)
