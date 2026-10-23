test = list(
  name = "q23",
  cases = list(
    ottr::TestCase$new(
      name = "q23 - 1",
      hidden = FALSE,
      success_message = "Correct!",
      failure_message = "Not quite. Compare the Pr(>|t|) columns of your two outputs, and think about what happens to uncertainty when there are fewer respondents.",
      code = {
        full <- estimatr::difference_in_means(medicare_expand ~ radio_news, data = data, condition1 = 0, condition2 = 1)
        small <- estimatr::difference_in_means(medicare_expand ~ radio_news, data = head(data, 200), condition1 = 0, condition2 = 1)
        expected.answer <- ifelse(unname(small$p.value) > unname(full$p.value), 'a', 'b')
        question.correct <- tryCatch(isTRUE(tolower(q23.answer) == expected.answer), error = function(e) FALSE)
        testthat::expect_true(question.correct)
      }
    )
  )
)
