test = list(
  name = "q6",
  cases = list(
    ottr::TestCase$new(
      name = "q6 - 1",
      hidden = FALSE,
      success_message = "Correct!",
      failure_message = "Recall subset(data, condition). Then use weighted.mean(column, weights) in the subset.",
      code = {
        question.correct <- tryCatch(isTRUE(all.equal(legal.status.rep, weighted.mean(data$legal_status[data$republican == 1], data$vvweight[data$republican == 1]))), error = function(e) FALSE)
        testthat::expect_true(question.correct)
      }
    ),
    ottr::TestCase$new(
      name = "q6 - 2",
      hidden = FALSE,
      success_message = "Correct!",
      failure_message = "Recall subset(data, condition). Then use weighted.mean(column, weights) in the subset.",
      code = {
        question.correct <- tryCatch(isTRUE(all.equal(legal.status.dem, weighted.mean(data$legal_status[data$democrat == 1], data$vvweight[data$democrat == 1]))), error = function(e) FALSE)
        testthat::expect_true(question.correct)
      }
    )
  )
)
