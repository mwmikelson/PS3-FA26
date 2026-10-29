test = list(
  name = "q1",
  cases = list(
    ottr::TestCase$new(
      name = "q1-1",
      code = {
        testthat::expect_true(inherits(mod.public, "lm"))
        testthat::expect_equal(stats::nobs(mod.public), 60)
        testthat::expect_equal(unname(stats::coef(mod.public)), c(11.07051492, 15.31778289), tolerance = 1e-4)
      },
      failure_message = "Not quite. Check your answer and try again."
    )
  )
)
