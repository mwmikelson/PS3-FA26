test <- list(
  name = "q12",
  cases = list(
    ottr::TestCase$new(
      name = "q12",
      points = 1,
      hidden = FALSE,
      success_message = "Correct!",
      failure_message = "Not quite. Look at the sign of the estimate and at whether the confidence interval (conf.low to conf.high) contains 0.",
      code = {
        testthat::expect_true(exists("q12_answer"))
        testthat::expect_equal(toupper(trimws(q12_answer)), "B")
      }
    )
  )
)
