test <- list(
  name = "q5",
  cases = list(
    ottr::TestCase$new(
      name = "q5",
      points = 1,
      hidden = FALSE,
      success_message = "Correct!",
      failure_message = "Not quite. Go through the function line by line: which input is pasted first?",
      code = {
        testthat::expect_true(exists("q5_answer"))
        testthat::expect_equal(toupper(trimws(q5_answer)), "B")
      }
    )
  )
)
