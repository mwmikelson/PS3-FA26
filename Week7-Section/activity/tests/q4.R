test = list(
  name = "q4",
  cases = list(
    ottr::TestCase$new(
      name = "q4.p",
      failure_message = "q4.p should be the proportion of shuffled Saturday-minus-Sunday gaps that are at least as large as the actual gap.",
      code = {
        testthat::expect_true(exists("q4.p"))
        testthat::expect_true(is.numeric(q4.p) && length(q4.p) == 1)
        testthat::expect_true(q4.p >= 0 && q4.p <= 1, info = "A p-value is a probability between 0 and 1.")
        testthat::expect_true(abs(as.numeric(q4.p) - 0.3561) < 0.03)
      }
    )
  )
)
