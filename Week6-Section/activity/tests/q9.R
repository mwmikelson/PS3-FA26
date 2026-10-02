test = list(
  name = "q9",
  cases = list(
    ottr::TestCase$new(
      name = "q9.sims-length",
      failure_message = "q9.sims should be a vector of 1,000 numbers.",
      code = {
        testthat::expect_true(exists("q9.sims"))
        testthat::expect_true(is.numeric(q9.sims) && length(q9.sims) == 1000)
      }
    ),
    ottr::TestCase$new(
      name = "q9.sims-spread",
      failure_message = "The spread looks off. Did you shuffle the playoff games only?",
      code = {
        testthat::expect_true(abs(mean(q9.sims)) < 0.35)
        testthat::expect_true(sd(q9.sims) > 1.45 && sd(q9.sims) < 1.9)
      }
    )
  )
)
