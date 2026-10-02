test = list(
  name = "q8",
  cases = list(
    ottr::TestCase$new(
      name = "q8.estimate",
      failure_message = "q8.estimate should be the home-minus-away gap using all playoff games.",
      code = {
        testthat::expect_true(exists("q8.estimate"))
        testthat::expect_true(is.numeric(q8.estimate) && length(q8.estimate) == 1)
        testthat::expect_true(abs(as.numeric(q8.estimate) - 5.82022471910112) < 0.02)
      }
    ),
    ottr::TestCase$new(
      name = "q8.se",
      failure_message = "q8.se should be the standard error of the playoff estimate.",
      code = {
        testthat::expect_true(exists("q8.se"))
        testthat::expect_true(is.numeric(q8.se) && length(q8.se) == 1)
        testthat::expect_true(abs(as.numeric(q8.se) - 1.65801909719672) < 0.02)
      }
    ),
    ottr::TestCase$new(
      name = "q8.t",
      failure_message = "q8.t should be the estimate divided by the standard error.",
      code = {
        testthat::expect_true(exists("q8.t"))
        testthat::expect_true(is.numeric(q8.t) && length(q8.t) == 1)
        testthat::expect_true(abs(as.numeric(q8.t) - 3.51034842055896) < 0.04)
      }
    )
  )
)
