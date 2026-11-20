test = list(
  name = "q34",
  cases = list(
    ottr::TestCase$new(
      name = "q34-1",
      code = {
        .model <- stats::lm(mid_onset ~ joint_democracy, data = dyads)
        .est <- summary(.model)$coefficients["joint_democracy", "Estimate"]
        .se <- summary(.model)$coefficients["joint_democracy", "Std. Error"]
        testthat::expect_true(is.numeric(ci.dem.lower) && length(ci.dem.lower) == 1)
        testthat::expect_true(is.numeric(ci.dem.upper) && length(ci.dem.upper) == 1)
        testthat::expect_lt(abs(ci.dem.lower - (.est - 1.96 * .se)), 0.00005)
        testthat::expect_lt(abs(ci.dem.upper - (.est + 1.96 * .se)), 0.00005)
      },
      failure_message = "Not quite. Check your answer and try again."
    )
  )
)
