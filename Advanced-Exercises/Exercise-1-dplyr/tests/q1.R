test = list(
  name = "q1",
  cases = list(
    ottr::TestCase$new(
      name = "q1.avg",
      failure_message = "q1.avg should be the average of points, rounded to 2 decimal places.",
      code = {
        testthat::expect_true(exists("q1.avg"))
        testthat::expect_true(is.numeric(q1.avg) && length(q1.avg) == 1)
        testthat::expect_true(abs(as.numeric(q1.avg) - 82.01) < 0.006)
      }
    )
  )
)
