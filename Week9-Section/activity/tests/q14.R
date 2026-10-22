test = list(
  name = "q14",
  cases = list(
    ottr::TestCase$new(
      name = "q14 - 1",
      hidden = FALSE,
      success_message = "Correct!",
      failure_message = "Not quite. Compare the two estimates from Question 13.",
      code = {
        v <- estimatr::difference_in_means(primary2006 ~ messages, data = social[social$primary2004 == 1, ], condition1 = "Control", condition2 = "Neighbors")
        nv <- estimatr::difference_in_means(primary2006 ~ messages, data = social[social$primary2004 == 0, ], condition1 = "Control", condition2 = "Neighbors")
        d <- unname(v$coefficients) - unname(nv$coefficients)
        expected.answer <- ifelse(abs(d) < 0.01, 'c', ifelse(d > 0, 'a', 'b'))
        question.correct <- tryCatch(isTRUE(tolower(q14.answer) == expected.answer), error = function(e) FALSE)
        testthat::expect_true(question.correct)
      }
    )
  )
)
