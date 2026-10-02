test = list(
  name = "q6",
  cases = list(
    ottr::TestCase$new(
      name = "q6.estimate",
      failure_message = "q6.estimate should be the home-minus-away gap using all four regular seasons.",
      code = {
        testthat::expect_true(exists("q6.estimate"))
        testthat::expect_true(is.numeric(q6.estimate) && length(q6.estimate) == 1)
        testthat::expect_true(abs(as.numeric(q6.estimate) - 1.49492900608519) < 0.01)
      }
    ),
    ottr::TestCase$new(
      name = "q6.se",
      failure_message = "q6.se should be the standard error from the all-regular-season estimate.",
      code = {
        testthat::expect_true(exists("q6.se"))
        testthat::expect_true(is.numeric(q6.se) && length(q6.se) == 1)
        testthat::expect_true(abs(as.numeric(q6.se) - 0.500908017536863) < 0.01)
      }
    ),
    ottr::TestCase$new(
      name = "q6.t",
      failure_message = "q6.t should be the estimate divided by the standard error.",
      code = {
        testthat::expect_true(exists("q6.t"))
        testthat::expect_true(is.numeric(q6.t) && length(q6.t) == 1)
        testthat::expect_true(abs(as.numeric(q6.t) - 2.98443816778232) < 0.03)
      }
    )
  )
)
