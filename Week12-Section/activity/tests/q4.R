test = list(
  name = "q4",
  cases = list(
    ottr::TestCase$new(
      name = "q4",
      hidden = FALSE,
      code = {
        testthat::expect_true(is.numeric(q4) && length(q4) == 1, info = "q4 should be a single number.")
        testthat::expect_true(is.numeric(q4) && length(q4) == 1 && abs(as.numeric(q4) - (0.27604389947)) < 0.005, info = "Not quite. Re-check the numbers you used.")
      }
    )
  )
)
