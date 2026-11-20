test = list(
  name = "q33",
  cases = list(
    ottr::TestCase$new(
      name = "q33-1",
      code = {
        .model <- stats::lm(mid_onset ~ joint_democracy + contiguity + capdist, data = dyads)
        .p <- summary(.model)$coefficients["contiguity", "Pr(>|t|)"]
        .correct <- if (.p < 0.01) 'd' else if (.p < 0.05) 'c' else if (.p < 0.1) 'b' else 'a'
        testthat::expect_equal(q33.answer, .correct)
      },
      failure_message = "Not quite. Check your answer and try again."
    )
  )
)
