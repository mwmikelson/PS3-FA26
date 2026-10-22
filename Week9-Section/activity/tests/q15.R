test = list(
  name = "q15",
  cases = list(
    ottr::TestCase$new(
      name = "q15 - 1",
      hidden = FALSE,
      success_message = "Correct!",
      failure_message = "Not quite. Compare the CI Lower and CI Upper columns from your two outputs: do the two intervals share any values?",
      code = {
        v <- estimatr::difference_in_means(primary2006 ~ messages, data = social[social$primary2004 == 1, ], condition1 = "Control", condition2 = "Neighbors")
        nv <- estimatr::difference_in_means(primary2006 ~ messages, data = social[social$primary2004 == 0, ], condition1 = "Control", condition2 = "Neighbors")
        overlap <- max(v$conf.low, nv$conf.low) <= min(v$conf.high, nv$conf.high)
        expected.answer <- ifelse(overlap, 'a', 'b')
        question.correct <- tryCatch(isTRUE(tolower(q15.answer) == expected.answer), error = function(e) FALSE)
        testthat::expect_true(question.correct)
      }
    )
  )
)
