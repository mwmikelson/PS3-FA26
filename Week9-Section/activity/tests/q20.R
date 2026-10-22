test = list(
  name = "q20",
  cases = list(
    ottr::TestCase$new(
      name = "q20 - 1",
      hidden = FALSE,
      success_message = "Correct!",
      failure_message = "Not quite. What does the null hypothesis say about the treatment?",
      code = {
        expected.answer <- 'a'
        question.correct <- tryCatch(isTRUE(tolower(q20.answer) == expected.answer), error = function(e) FALSE)
        testthat::expect_true(question.correct)
      }
    )
  )
)
