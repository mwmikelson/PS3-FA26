test = list(
  name = "q8",
  cases = list(
    ottr::TestCase$new(
      name = "q8",
      hidden = FALSE,
      code = {
        testthat::expect_true(is.numeric(q8) && length(q8) == 1, info = "q8 should be a single number.")
        testthat::expect_true(is.numeric(q8) && length(q8) == 1 && abs(as.numeric(q8) - 47.69225) < 0.5, info = "Your prediction is off. Re-check the numbers you used.")
      }
    )
  )
)
