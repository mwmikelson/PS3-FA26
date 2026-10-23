test = list(
  name = "q18",
  cases = list(
    ottr::TestCase$new(
      name = "q18 - 1",
      hidden = FALSE,
      success_message = "Correct!",
      failure_message = "Not quite. Was watching TV news randomly assigned?",
      code = {
        expected.answer <- 'b'
        question.correct <- tryCatch(isTRUE(tolower(q18.answer) == expected.answer), error = function(e) FALSE)
        testthat::expect_true(question.correct)
      }
    )
  )
)
