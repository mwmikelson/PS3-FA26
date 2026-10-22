test = list(
  name = "q22",
  cases = list(
    ottr::TestCase$new(
      name = "q22 - 1",
      hidden = FALSE,
      success_message = "Correct!",
      failure_message = "Not quite. Does failing to find an effect prove that there is no effect?",
      code = {
        expected.answer <- 'b'
        question.correct <- tryCatch(isTRUE(tolower(q22.answer) == expected.answer), error = function(e) FALSE)
        testthat::expect_true(question.correct)
      }
    )
  )
)
