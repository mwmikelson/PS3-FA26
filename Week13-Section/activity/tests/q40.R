test = list(
  name = "q40",
  cases = list(
    ottr::TestCase$new(
      name = "q40-1",
      code = {
        testthat::expect_true(is.numeric(pred.pair1) && length(pred.pair1) == 1)
        testthat::expect_true(is.numeric(pred.pair2) && length(pred.pair2) == 1)
        testthat::expect_lt(abs(pred.pair1 - 0.04974960905), 0.0001)
        testthat::expect_lt(abs(pred.pair2 - 0.00168207398), 0.0001)
      },
      failure_message = "Not quite. Check your answer and try again."
    )
  )
)
