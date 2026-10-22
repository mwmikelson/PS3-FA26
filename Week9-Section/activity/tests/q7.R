test = list(
  name = "q7",
  cases = list(
    ottr::TestCase$new(
      name = "q7 - 1",
      hidden = FALSE,
      success_message = "Correct!",
      failure_message = "Not quite. Think back to Week 8: what did we learn about generalizing to other times and contexts?",
      code = {
        expected.answer <- 'b'
        question.correct <- tryCatch(isTRUE(tolower(q7.answer) == expected.answer), error = function(e) FALSE)
        testthat::expect_true(question.correct)
      }
    )
  )
)
