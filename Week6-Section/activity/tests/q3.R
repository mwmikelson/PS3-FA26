test = list(
  name = "q3",
  cases = list(
    ottr::TestCase$new(
      name = "q3.sims-length",
      failure_message = "q3.sims should be a vector of 1,000 numbers (one per shuffle).",
      code = {
        testthat::expect_true(exists("q3.sims"))
        testthat::expect_true(is.numeric(q3.sims) && length(q3.sims) == 1000)
      }
    ),
    ottr::TestCase$new(
      name = "q3.sims-center",
      failure_message = "The shuffled estimates should be centered near zero (labels are random).",
      code = {
        testthat::expect_true(abs(mean(q3.sims)) < 0.15)
      }
    ),
    ottr::TestCase$new(
      name = "q3.sims-spread",
      failure_message = "The spread of the shuffled estimates looks off. Did you shuffle the 2023 regular-season games only?",
      code = {
        testthat::expect_true(sd(q3.sims) > 0.9 && sd(q3.sims) < 1.2)
      }
    )
  )
)
