test = list(
  name = "q5",
  cases = list(
    ottr::TestCase$new(
      name = "q5-1",
      code = {
        testthat::expect_equal(treated.mean, 26.38829781, tolerance = 1e-4)
        testthat::expect_equal(control.mean, 11.07051492, tolerance = 1e-4)
      },
      failure_message = "Not quite. Check your answer and try again."
    )
  )
)
