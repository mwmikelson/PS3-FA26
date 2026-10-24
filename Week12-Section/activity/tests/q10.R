test = list(
  name = "q10",
  cases = list(
    ottr::TestCase$new(
      name = "q10",
      hidden = FALSE,
      code = {
        testthat::expect_true(is.numeric(q10) && length(q10) == 1, info = "q10 should be a single number.")
        testthat::expect_true(is.numeric(q10) && length(q10) == 1 && abs(as.numeric(q10) - (0.203)) < 0.0006, info = "Not quite. Re-check the numbers you used.")
      }
    )
  )
)
