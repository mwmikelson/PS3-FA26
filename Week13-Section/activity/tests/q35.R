test = list(
  name = "q35",
  cases = list(
    ottr::TestCase$new(
      name = "q35-1",
      code = {
        .model <- stats::lm(mid_onset ~ joint_democracy, data = dyads)
        .est <- summary(.model)$coefficients["joint_democracy", "Estimate"]
        .se <- summary(.model)$coefficients["joint_democracy", "Std. Error"]
        .excludes.zero <- (.est - 1.96 * .se) > 0 || (.est + 1.96 * .se) < 0
        .correct <- if (.excludes.zero) 'c' else 'd'
        testthat::expect_equal(q35.answer, .correct)
      },
      failure_message = "Not quite. Check your answer and try again."
    )
  )
)
