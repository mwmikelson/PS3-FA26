test = list(
  name = "q17",
  cases = list(
    ottr::TestCase$new(
      name = "q17-1",
      code = {
        .model <- stats::lm(public_pct ~ observers, data = ghana)
        .est <- summary(.model)$coefficients["observers", "Estimate"]
        .se <- summary(.model)$coefficients["observers", "Std. Error"]
        .excludes.zero <- (.est - 1.96 * .se) > 0 || (.est + 1.96 * .se) < 0
        .correct <- if (.excludes.zero) 'b' else 'a'
        testthat::expect_equal(q17.answer, .correct)
      },
      failure_message = "Not quite. Check your answer and try again."
    )
  )
)
