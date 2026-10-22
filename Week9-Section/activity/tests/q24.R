test = list(
  name = "q24",
  cases = list(
    ottr::TestCase$new(
      name = "q24 - 1",
      hidden = FALSE,
      success_message = "Correct!",
      failure_message = "Not quite. Remember what a p-value is a probability OF: the data, assuming the null hypothesis is true.",
      code = {
        expected.answer <- 'b'
        question.correct <- tryCatch(isTRUE(tolower(q24.answer) == expected.answer), error = function(e) FALSE)
        testthat::expect_true(question.correct)
      }
    )
  )
)
