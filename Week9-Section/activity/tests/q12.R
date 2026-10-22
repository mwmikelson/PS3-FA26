test = list(
  name = "q12",
  cases = list(
    ottr::TestCase$new(
      name = "q12 - 1",
      hidden = FALSE,
      success_message = "Correct!",
      failure_message = "Not quite. Remember that the estimate is the average in condition2 minus the average in condition1.",
      code = {
        expected.answer <- 'b'
        question.correct <- tryCatch(isTRUE(tolower(q12.answer) == expected.answer), error = function(e) FALSE)
        testthat::expect_true(question.correct)
      }
    )
  )
)
