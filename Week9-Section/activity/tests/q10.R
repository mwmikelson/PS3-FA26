test = list(
  name = "q10",
  cases = list(
    ottr::TestCase$new(
      name = "q10 - 1",
      hidden = FALSE,
      success_message = "Correct!",
      failure_message = "Check three things: the outcome and group columns, which two groups you compared (and the subset of the data, if the question asks for one), and that the CONTROL group is in condition1 and the TREATMENT group is in condition2. Remember that these groups are text, so they go in quotes.",
      code = {
        expected <- estimatr::difference_in_means(restore_mandate ~ party, data = data, condition1 = "Democrat", condition2 = "Republican")
        question.correct <- tryCatch(isTRUE(all.equal(unname(party.dim$coefficients), unname(expected$coefficients))) && isTRUE(all.equal(unname(party.dim$std.error), unname(expected$std.error))), error = function(e) FALSE)
        testthat::expect_true(question.correct)
      }
    )
  )
)
