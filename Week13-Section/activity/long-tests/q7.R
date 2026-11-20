test = list(
  name = "q7",
  cases = list(
    ottr::TestCase$new(
      name = "q7-1",
      code = {
        testthat::expect_true(inherits(mod.absence, "lm"))
        testthat::expect_equal(stats::nobs(mod.absence), 60)
        testthat::expect_equal(unname(stats::coef(mod.absence)), c(25.3637344, 0.8522295), tolerance = 1e-4)
      },
      failure_message = "Not quite. Check your answer and try again."
    )
  )
)
