test = list(
  name = "q11",
  cases = list(
    ottr::TestCase$new(
      name = "q11",
      hidden = FALSE,
      code = {
        testthat::expect_true(is.numeric(q11) && length(q11) == 1, info = "q11 should be a single number.")
        testthat::expect_true(is.numeric(q11) && length(q11) == 1 && abs(as.numeric(q11) - (0.019)) < 0.0006, info = "Not quite. Re-check the numbers you used.")
      }
    )
  )
)
