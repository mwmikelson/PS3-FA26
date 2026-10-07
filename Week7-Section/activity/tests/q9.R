test = list(
  name = "q9",
  cases = list(
    ottr::TestCase$new(
      name = "q9.n",
      failure_message = "q9.n should be a single number: how many of the 20 p-values in placebo.p are below 0.05.",
      code = {
        testthat::expect_true(exists("q9.n"))
        testthat::expect_true(is.numeric(q9.n) && length(q9.n) == 1)
        testthat::expect_true(abs(as.numeric(q9.n) - 1) <= 1)
      }
    )
  )
)
