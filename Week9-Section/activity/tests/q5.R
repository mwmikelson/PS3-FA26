test = list(
  name = "q5",
  cases = list(
    ottr::TestCase$new(
      name = "q5 - 1",
      hidden = FALSE,
      success_message = "Correct!",
      failure_message = "Not quite. Did you use the weights? Make sure you computed the weighted mean of all five policies.",
      code = {
        policies <- c('legal_status', 'border_patrol', 'withhold_funds', 'reduce_legal', 'border_wall')
        estimates <- sapply(policies, function(p) weighted.mean(data[[p]], data$vvweight))
        expected.answer <- c('a', 'b', 'c', 'd', 'e')[which.max(estimates)]
        question.correct <- tryCatch(isTRUE(tolower(q5.answer) == expected.answer), error = function(e) FALSE)
        testthat::expect_true(question.correct)
      }
    )
  )
)
