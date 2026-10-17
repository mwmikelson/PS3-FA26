test <- list(
  name = "q9",
  cases = list(
    ottr::TestCase$new(
      name = "q9",
      points = 1,
      hidden = FALSE,
      success_message = "Correct!",
      failure_message = "Not quite. Compare each of the four lines for the South to the same line for all 50 states.",
      code = {
        testthat::expect_true(exists("q9_answer"))
        testthat::expect_equal(toupper(trimws(q9_answer)), "B")
      }
    )
  )
)
