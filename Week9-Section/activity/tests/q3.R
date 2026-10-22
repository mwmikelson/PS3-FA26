test = list(
  name = "q3",
  cases = list(
    ottr::TestCase$new(
      name = "q3 - 1",
      hidden = FALSE,
      success_message = "Correct!",
      failure_message = "Not quite. Compare your two answers from Question 2, and think about what the weights are designed to do.",
      code = {
        expected.answer <- ifelse(weighted.mean(data$college, data$vvweight) < mean(data$college), 'a', 'b')
        question.correct <- tryCatch(isTRUE(tolower(q3.answer) == expected.answer), error = function(e) FALSE)
        testthat::expect_true(question.correct)
      }
    )
  )
)
