test = list(
  name = "q16",
  cases = list(
    ottr::TestCase$new(
      name = "q16 - 1",
      hidden = FALSE,
      success_message = "Correct!",
      failure_message = "Check three things: the outcome and group columns, which two groups you compared (and the subset of the data, if the question asks for one), and that the CONTROL group is in condition1 and the TREATMENT group is in condition2. Remember to use only people who went to college (college equals 1).",
      code = {
        expected <- estimatr::difference_in_means(repeal_aca ~ tv_news, data = data[data$college == 1, ], condition1 = 0, condition2 = 1)
        question.correct <- tryCatch(isTRUE(all.equal(unname(tv.college.dim$coefficients), unname(expected$coefficients))) && isTRUE(all.equal(unname(tv.college.dim$std.error), unname(expected$std.error))), error = function(e) FALSE)
        testthat::expect_true(question.correct)
      }
    ),
    ottr::TestCase$new(
      name = "q16 - 2",
      hidden = FALSE,
      success_message = "Correct!",
      failure_message = "Check three things: the outcome and group columns, which two groups you compared (and the subset of the data, if the question asks for one), and that the CONTROL group is in condition1 and the TREATMENT group is in condition2. Remember to use only people who did not go to college (college equals 0).",
      code = {
        expected <- estimatr::difference_in_means(repeal_aca ~ tv_news, data = data[data$college == 0, ], condition1 = 0, condition2 = 1)
        question.correct <- tryCatch(isTRUE(all.equal(unname(tv.nocollege.dim$coefficients), unname(expected$coefficients))) && isTRUE(all.equal(unname(tv.nocollege.dim$std.error), unname(expected$std.error))), error = function(e) FALSE)
        testthat::expect_true(question.correct)
      }
    )
  )
)
