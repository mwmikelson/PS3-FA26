test = list(
  name = "q4",
  cases = list(
    ottr::TestCase$new(
      name = "q4 - 1",
      hidden = FALSE,
      success_message = "Correct!",
      failure_message = "Not quite. Remember the difference between noise and bias from lecture (think about the Literary Digest).",
      code = {
        expected.answer <- 'b'
        question.correct <- tryCatch(isTRUE(tolower(q4.answer) == expected.answer), error = function(e) FALSE)
        testthat::expect_true(question.correct)
      }
    )
  )
)
