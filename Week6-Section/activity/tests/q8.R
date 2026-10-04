test = list(
  name = "q8",
  cases = list(
    ottr::TestCase$new(
      name = "q8.sims-length",
      failure_message = "q8.sims should be a vector of 1,000 numbers (one per shuffle).",
      code = {
        testthat::expect_true(exists("q8.sims"))
        testthat::expect_true(is.numeric(q8.sims) && length(q8.sims) == 1000)
      }
    ),
    ottr::TestCase$new(
      name = "q8.sims-spread",
      failure_message = "The spread of your shuffled estimates looks off. Did you shuffle the playoff games only?",
      code = {
        testthat::expect_true(abs(mean(q8.sims)) < 0.35)
        testthat::expect_true(sd(q8.sims) > 1.45 && sd(q8.sims) < 1.9)
      }
    )
  )
)
