test = list(
  name = "q14",
  cases = list(
    ottr::TestCase$new(
      name = "q14-1",
      code = {
        .model <- stats::lm(absence_pct ~ observers, data = ghana)
        .p <- summary(.model)$coefficients["observers", "Pr(>|t|)"]
        .correct <- if (.p < 0.01) 'a' else if (.p < 0.05) 'b' else if (.p < 0.1) 'c' else 'd'
        testthat::expect_equal(q14.answer, .correct)
      },
      failure_message = "Not quite. Check your answer and try again."
    )
  )
)
