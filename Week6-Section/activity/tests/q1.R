test = list(
  name = "q1",
  cases = list(
    ottr::TestCase$new(
      name = "q1.estimate",
      failure_message = "q1.estimate should be a single number: the home-minus-away gap in points for 2023 regular-season games. Check your subset and which group is the baseline.",
      code = {
        testthat::expect_true(exists("q1.estimate"))
        testthat::expect_true(is.numeric(q1.estimate) && length(q1.estimate) == 1)
        testthat::expect_true(abs(as.numeric(q1.estimate) - 1.52697095435686) < 0.01)
      }
    ),
    ottr::TestCase$new(
      name = "q1.se",
      failure_message = "q1.se should be the standard error of your estimate (the Std. Error column).",
      code = {
        testthat::expect_true(exists("q1.se"))
        testthat::expect_true(is.numeric(q1.se) && length(q1.se) == 1)
        testthat::expect_true(abs(as.numeric(q1.se) - 1.02841370079825) < 0.01)
      }
    ),
    ottr::TestCase$new(
      name = "q1.t",
      failure_message = "q1.t should be the estimate divided by the standard error.",
      code = {
        testthat::expect_true(exists("q1.t"))
        testthat::expect_true(is.numeric(q1.t) && length(q1.t) == 1)
        testthat::expect_true(abs(as.numeric(q1.t) - 1.48478278067632) < 0.02)
      }
    )
  )
)
