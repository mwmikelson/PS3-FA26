test = list(
  name = "q19",
  cases = list(
    ottr::TestCase$new(
      name = "q19-1",
      code = {
        testthat::expect_true(is.numeric(pred.treated) && length(pred.treated) == 1)
        testthat::expect_true(is.numeric(pred.control) && length(pred.control) == 1)
        testthat::expect_lt(abs(pred.treated - 26.38829781), 0.05)
        testthat::expect_lt(abs(pred.control - 11.07051492), 0.05)
      },
      failure_message = "Not quite. Check your answer and try again."
    )
  )
)
