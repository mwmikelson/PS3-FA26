test = list(
  name = "q21",
  cases = list(
    ottr::TestCase$new(
      name = "q21-1",
      code = {
        testthat::expect_true(is.numeric(pred.npp.treated) && length(pred.npp.treated) == 1)
        testthat::expect_true(is.numeric(pred.npp.control) && length(pred.npp.control) == 1)
        testthat::expect_lt(abs(pred.npp.treated - 20.893002904), 0.05)
        testthat::expect_lt(abs(pred.npp.control - 7.522728376), 0.05)
      },
      failure_message = "Not quite. Check your answer and try again."
    )
  )
)
