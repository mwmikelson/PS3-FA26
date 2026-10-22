test = list(
  name = "q23",
  cases = list(
    ottr::TestCase$new(
      name = "q23 - 1",
      hidden = FALSE,
      success_message = "Correct!",
      failure_message = "Check three things: the outcome and treatment columns, which two groups you compared, and that the CONTROL group is in condition1 and the TREATMENT group is in condition2.",
      code = {
        expected <- estimatr::difference_in_means(call ~ race, data = resume, condition1 = "white", condition2 = "black")
        question.correct <- tryCatch(isTRUE(all.equal(unname(callback.dim$coefficients), unname(expected$coefficients))) && isTRUE(all.equal(unname(callback.dim$std.error), unname(expected$std.error))), error = function(e) FALSE)
        testthat::expect_true(question.correct)
      }
    )
  )
)
