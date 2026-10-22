test = list(
  name = "q9",
  cases = list(
    ottr::TestCase$new(
      name = "q9 - 1",
      hidden = FALSE,
      success_message = "Correct!",
      failure_message = "Check three things: the outcome and treatment columns, which two groups you compared, and that the CONTROL group is in condition1 and the TREATMENT group is in condition2.",
      code = {
        expected <- estimatr::difference_in_means(primary2006 ~ messages, data = social, condition1 = "Control", condition2 = "Neighbors")
        question.correct <- tryCatch(isTRUE(all.equal(unname(neighbors.dim$coefficients), unname(expected$coefficients))) && isTRUE(all.equal(unname(neighbors.dim$std.error), unname(expected$std.error))), error = function(e) FALSE)
        testthat::expect_true(question.correct)
      }
    )
  )
)
