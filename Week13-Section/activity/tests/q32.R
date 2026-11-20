test = list(
  name = "q32",
  cases = list(
    ottr::TestCase$new(
      name = "q32-1",
      code = {
        .model <- stats::lm(mid_onset ~ joint_democracy, data = dyads)
        .p <- summary(.model)$coefficients["joint_democracy", "Pr(>|t|)"]
        .correct <- if (.p < 0.01) 'a' else if (.p < 0.05) 'b' else if (.p < 0.1) 'c' else 'd'
        testthat::expect_equal(q32.answer, .correct)
      },
      failure_message = "Not quite. Check your answer and try again."
    )
  )
)
