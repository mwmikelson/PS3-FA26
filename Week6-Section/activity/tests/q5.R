test = list(
  name = "q5",
  cases = list(
    ottr::TestCase$new(
      name = "q5.se.4x",
      failure_message = "Think about how the standard error depends on the sample size (or use the SE formula from lecture).",
      code = {
        testthat::expect_true(exists("q5.se.4x"))
        testthat::expect_true(is.numeric(q5.se.4x) && length(q5.se.4x) == 1)
        testthat::expect_true(abs(as.numeric(q5.se.4x) - 0.514206850399126) < 0.02)
      }
    )
  )
)
