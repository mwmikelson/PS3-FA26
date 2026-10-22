test = list(
  name = "q1",
  cases = list(
    ottr::TestCase$new(
      name = "q1 - 1",
      hidden = FALSE,
      success_message = "Correct!",
      failure_message = "Remember the format: weighted.mean(column, weights). The weights are in the vvweight column.",
      code = {
        question.correct <- tryCatch(isTRUE(all.equal(legal.status.weighted, weighted.mean(data$legal_status, data$vvweight))), error = function(e) FALSE)
        testthat::expect_true(question.correct)
      }
    )
  )
)
