test = list(
  name = "q2",
  cases = list(
    ottr::TestCase$new(
      name = "q2 - 1",
      hidden = FALSE,
      success_message = "Correct!",
      failure_message = "Without weights, this is just the mean of the college column.",
      code = {
        question.correct <- tryCatch(isTRUE(all.equal(college.unweighted, mean(data$college))), error = function(e) FALSE)
        testthat::expect_true(question.correct)
      }
    ),
    ottr::TestCase$new(
      name = "q2 - 2",
      hidden = FALSE,
      success_message = "Correct!",
      failure_message = "Remember the format: weighted.mean(column, weights). The weights are in the vvweight column.",
      code = {
        question.correct <- tryCatch(isTRUE(all.equal(college.weighted, weighted.mean(data$college, data$vvweight))), error = function(e) FALSE)
        testthat::expect_true(question.correct)
      }
    )
  )
)
