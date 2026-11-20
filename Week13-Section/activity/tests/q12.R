test = list(
  name = "q12",
  cases = list(
    ottr::TestCase$new(
      name = "q12-1",
      code = {
        testthat::expect_true(inherits(mod.naive, "lm"))
        testthat::expect_equal(stats::nobs(mod.naive), 421437)
        testthat::expect_equal(unname(stats::coef(mod.naive)), c(0.003497941274, -0.001721570862), tolerance = 1e-4)
      },
      failure_message = "Not quite. Check your answer and try again."
    )
  )
)
