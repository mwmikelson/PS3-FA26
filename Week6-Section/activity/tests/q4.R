test = list(
  name = "q4",
  cases = list(
    ottr::TestCase$new(
      name = "q4.se.4x",
      failure_message = "q4.se.4x should be a single number: think about how the standard error depends on sample size (or use the SE formula from lecture).",
      code = {
        testthat::expect_true(exists("q4.se.4x"))
        testthat::expect_true(is.numeric(q4.se.4x) && length(q4.se.4x) == 1)
        testthat::expect_true(abs(as.numeric(q4.se.4x) - 0.514206850399126) < 0.02)
      }
    )
  )
)
