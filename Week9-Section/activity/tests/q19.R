test = list(
  name = "q19",
  cases = list(
    ottr::TestCase$new(
      name = "q19 - 1",
      hidden = FALSE,
      success_message = "Correct!",
      failure_message = "Check three things: the outcome and treatment columns, which two groups you compared, and that the CONTROL group is in condition1 and the TREATMENT group is in condition2. Remember that these groups are numbers, so they don't go in quotes.",
      code = {
        expected <- estimatr::difference_in_means(g4math ~ classtype, data = star, condition1 = 2, condition2 = 1)
        question.correct <- tryCatch(isTRUE(all.equal(unname(star.math.dim$coefficients), unname(expected$coefficients))) && isTRUE(all.equal(unname(star.math.dim$std.error), unname(expected$std.error))), error = function(e) FALSE)
        testthat::expect_true(question.correct)
      }
    )
  )
)
