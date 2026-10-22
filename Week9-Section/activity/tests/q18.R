test = list(
  name = "q18",
  cases = list(
    ottr::TestCase$new(
      name = "q18 - 1",
      hidden = FALSE,
      success_message = "Correct!",
      failure_message = "Not quite. Which thing was randomly assigned: the mailer, or whether someone voted in 2004?",
      code = {
        expected.answer <- 'b'
        question.correct <- tryCatch(isTRUE(tolower(q18.answer) == expected.answer), error = function(e) FALSE)
        testthat::expect_true(question.correct)
      }
    )
  )
)
