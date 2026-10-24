test = list(
  name = "q15",
  cases = list(
    ottr::TestCase$new(
      name = "q15",
      hidden = FALSE,
      code = {
        testthat::expect_true(is.numeric(q15) && length(q15) == 1, info = "q15 should be a single number.")
        testthat::expect_true(is.numeric(q15) && length(q15) == 1 && abs(as.numeric(q15) - (0.065718)) < 0.005, info = "Not quite. Re-check the numbers you used.")
      }
    )
  )
)
