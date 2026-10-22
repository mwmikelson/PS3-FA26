test = list(
  name = "q17",
  cases = list(
    ottr::TestCase$new(
      name = "q17 - 1",
      hidden = FALSE,
      success_message = "Correct!",
      failure_message = "Not quite. Compare the two estimates from Question 16.",
      code = {
        mm <- estimatr::difference_in_means(primary2006 ~ messages, data = social[social$sex == "male", ], condition1 = "Control", condition2 = "Neighbors")
        ww <- estimatr::difference_in_means(primary2006 ~ messages, data = social[social$sex == "female", ], condition1 = "Control", condition2 = "Neighbors")
        d <- unname(mm$coefficients) - unname(ww$coefficients)
        expected.answer <- ifelse(abs(d) < 0.01, 'c', ifelse(d > 0, 'a', 'b'))
        question.correct <- tryCatch(isTRUE(tolower(q17.answer) == expected.answer), error = function(e) FALSE)
        testthat::expect_true(question.correct)
      }
    )
  )
)
