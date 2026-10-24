test = list(
  name = "q4",
  cases = list(
    ottr::TestCase$new(
      name = "q4",
      hidden = FALSE,
      code = {
        testthat::expect_true(is.numeric(q4) && length(q4) == 1, info = "q4 should be a single number.")
        testthat::expect_true(is.numeric(q4) && length(q4) == 1 && abs(as.numeric(q4) - 50.19846) < 0.5, info = "Your prediction is off. Re-check the numbers you used.")
      }
    )
  )
)
