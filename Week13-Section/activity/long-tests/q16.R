test = list(
  name = "q16",
  cases = list(
    ottr::TestCase$new(
      name = "q16-1",
      code = {
        .model <- stats::lm(public_pct ~ observers, data = ghana)
        .est <- summary(.model)$coefficients["observers", "Estimate"]
        .se <- summary(.model)$coefficients["observers", "Std. Error"]
        testthat::expect_true(is.numeric(ci.lower) && length(ci.lower) == 1)
        testthat::expect_true(is.numeric(ci.upper) && length(ci.upper) == 1)
        testthat::expect_lt(abs(ci.lower - (.est - 1.96 * .se)), 0.4)
        testthat::expect_lt(abs(ci.upper - (.est + 1.96 * .se)), 0.4)
      },
      failure_message = "Not quite. Check your answer and try again."
    )
  )
)
