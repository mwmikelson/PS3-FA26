test = list(
  name = "q17",
  cases = list(
    ottr::TestCase$new(
      name = "q17 - 1",
      hidden = FALSE,
      success_message = "Correct!",
      failure_message = "Not quite. Compare the two estimates from Question 16.",
      code = {
        cg <- estimatr::difference_in_means(repeal_aca ~ tv_news, data = data[data$college == 1, ], condition1 = 0, condition2 = 1)
        nc <- estimatr::difference_in_means(repeal_aca ~ tv_news, data = data[data$college == 0, ], condition1 = 0, condition2 = 1)
        d <- unname(cg$coefficients) - unname(nc$coefficients)
        expected.answer <- ifelse(abs(d) < 0.01, 'c', ifelse(d > 0, 'a', 'b'))
        question.correct <- tryCatch(isTRUE(tolower(q17.answer) == expected.answer), error = function(e) FALSE)
        testthat::expect_true(question.correct)
      }
    )
  )
)
