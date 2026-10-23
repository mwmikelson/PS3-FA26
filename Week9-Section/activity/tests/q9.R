test = list(
  name = "q9",
  cases = list(
    ottr::TestCase$new(
      name = "q9 - 1",
      hidden = FALSE,
      success_message = "Correct!",
      failure_message = "Check three things: the outcome and group columns, which two groups you compared (and the subset of the data, if the question asks for one), and that the CONTROL group is in condition1 and the TREATMENT group is in condition2.",
      code = {
        expected <- estimatr::difference_in_means(repeal_aca ~ social_media, data = data, condition1 = 0, condition2 = 1)
        question.correct <- tryCatch(isTRUE(all.equal(unname(social.dim$coefficients), unname(expected$coefficients))) && isTRUE(all.equal(unname(social.dim$std.error), unname(expected$std.error))), error = function(e) FALSE)
        testthat::expect_true(question.correct)
      }
    )
  )
)
