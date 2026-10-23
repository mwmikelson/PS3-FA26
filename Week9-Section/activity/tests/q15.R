test = list(
  name = "q15",
  cases = list(
    ottr::TestCase$new(
      name = "q15 - 1",
      hidden = FALSE,
      success_message = "Correct!",
      failure_message = "Not quite. Compare the CI Lower and CI Upper columns from your two outputs: do the two intervals share any values?",
      code = {
        r <- estimatr::difference_in_means(repeal_aca ~ tv_news, data = data[data$republican == 1, ], condition1 = 0, condition2 = 1)
        dd <- estimatr::difference_in_means(repeal_aca ~ tv_news, data = data[data$democrat == 1, ], condition1 = 0, condition2 = 1)
        overlap <- max(r$conf.low, dd$conf.low) <= min(r$conf.high, dd$conf.high)
        expected.answer <- ifelse(overlap, 'a', 'b')
        question.correct <- tryCatch(isTRUE(tolower(q15.answer) == expected.answer), error = function(e) FALSE)
        testthat::expect_true(question.correct)
      }
    )
  )
)
