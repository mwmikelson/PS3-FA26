test = list(
  name = "q14",
  cases = list(
    ottr::TestCase$new(
      name = "q14 - 1",
      hidden = FALSE,
      success_message = "Correct!",
      failure_message = "Not quite. Compare the two estimates from Question 13.",
      code = {
        r <- estimatr::difference_in_means(repeal_aca ~ tv_news, data = data[data$republican == 1, ], condition1 = 0, condition2 = 1)
        dd <- estimatr::difference_in_means(repeal_aca ~ tv_news, data = data[data$democrat == 1, ], condition1 = 0, condition2 = 1)
        d <- unname(r$coefficients) - unname(dd$coefficients)
        expected.answer <- ifelse(abs(d) < 0.01, 'c', ifelse(d > 0, 'a', 'b'))
        question.correct <- tryCatch(isTRUE(tolower(q14.answer) == expected.answer), error = function(e) FALSE)
        testthat::expect_true(question.correct)
      }
    )
  )
)
