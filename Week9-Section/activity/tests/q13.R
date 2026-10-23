test = list(
  name = "q13",
  cases = list(
    ottr::TestCase$new(
      name = "q13 - 1",
      hidden = FALSE,
      success_message = "Correct!",
      failure_message = "Check three things: the outcome and group columns, which two groups you compared (and the subset of the data, if the question asks for one), and that the CONTROL group is in condition1 and the TREATMENT group is in condition2. Remember to use only Republicans (republican equals 1).",
      code = {
        expected <- estimatr::difference_in_means(repeal_aca ~ tv_news, data = data[data$republican == 1, ], condition1 = 0, condition2 = 1)
        question.correct <- tryCatch(isTRUE(all.equal(unname(tv.rep.dim$coefficients), unname(expected$coefficients))) && isTRUE(all.equal(unname(tv.rep.dim$std.error), unname(expected$std.error))), error = function(e) FALSE)
        testthat::expect_true(question.correct)
      }
    ),
    ottr::TestCase$new(
      name = "q13 - 2",
      hidden = FALSE,
      success_message = "Correct!",
      failure_message = "Check three things: the outcome and group columns, which two groups you compared (and the subset of the data, if the question asks for one), and that the CONTROL group is in condition1 and the TREATMENT group is in condition2. Remember to use only Democrats (democrat equals 1).",
      code = {
        expected <- estimatr::difference_in_means(repeal_aca ~ tv_news, data = data[data$democrat == 1, ], condition1 = 0, condition2 = 1)
        question.correct <- tryCatch(isTRUE(all.equal(unname(tv.dem.dim$coefficients), unname(expected$coefficients))) && isTRUE(all.equal(unname(tv.dem.dim$std.error), unname(expected$std.error))), error = function(e) FALSE)
        testthat::expect_true(question.correct)
      }
    )
  )
)
