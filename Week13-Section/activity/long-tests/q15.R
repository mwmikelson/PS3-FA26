test = list(
  name = "q15",
  cases = list(
    ottr::TestCase$new(
      name = "q15-1",
      code = {
        .model <- stats::lm(public_pct ~ observers + incumbent_npp, data = ghana)
        .p <- summary(.model)$coefficients["incumbent_npp", "Pr(>|t|)"]
        .correct <- if (.p < 0.01) 'd' else if (.p < 0.05) 'c' else if (.p < 0.1) 'b' else 'a'
        testthat::expect_equal(q15.answer, .correct)
      },
      failure_message = "Not quite. Check your answer and try again."
    )
  )
)
