test = list(
  name = "q38",
  cases = list(
    ottr::TestCase$new(
      name = "q38-1",
      code = {
        testthat::expect_true(is.numeric(pred.dem) && length(pred.dem) == 1)
        testthat::expect_true(is.numeric(pred.nondem) && length(pred.nondem) == 1)
        testthat::expect_lt(abs(pred.dem - 0.001776370412), 0.0001)
        testthat::expect_lt(abs(pred.nondem - 0.003497941274), 0.0001)
      },
      failure_message = "Not quite. Check your answer and try again."
    )
  )
)
