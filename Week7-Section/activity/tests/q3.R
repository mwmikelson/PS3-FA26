test = list(
  name = "q3",
  cases = list(
    ottr::TestCase$new(
      name = "q3.p",
      failure_message = "q3.p should be the proportion of shuffled weekday-minus-Sunday gaps that are at least as large as the actual gap (watch the direction of the comparison).",
      code = {
        testthat::expect_true(exists("q3.p"))
        testthat::expect_true(is.numeric(q3.p) && length(q3.p) == 1)
        testthat::expect_true(q3.p >= 0 && q3.p <= 1, info = "A p-value is a probability between 0 and 1.")
        testthat::expect_true(abs(as.numeric(q3.p) - 0.0063) < 0.004)
      }
    )
  )
)
