test = list(
  name = "q11",
  cases = list(
    ottr::TestCase$new(
      name = "q11 - 1",
      hidden = FALSE,
      success_message = "Correct!",
      failure_message = "Not quite. Look at the sign of the estimate in your Question 8 output, and remember the estimate is treatment minus control.",
      code = {
        expected.dim <- estimatr::difference_in_means(call ~ race, data = resume, condition1 = "white", condition2 = "black")
        expected.answer <- ifelse(unname(expected.dim$coefficients) > 0, 'a', 'b')
        question.correct <- tryCatch(isTRUE(tolower(q11.answer) == expected.answer), error = function(e) FALSE)
        testthat::expect_true(question.correct)
      }
    )
  )
)
