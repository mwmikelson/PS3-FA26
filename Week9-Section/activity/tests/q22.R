test = list(
  name = "q22",
  cases = list(
    ottr::TestCase$new(
      name = "q22 - 1",
      hidden = FALSE,
      success_message = "Correct!",
      failure_message = "Check three things: the outcome and group columns, which two groups you compared (and the subset of the data, if the question asks for one), and that the CONTROL group is in condition1 and the TREATMENT group is in condition2. Remember to use small.data, not data.",
      code = {
        expected <- estimatr::difference_in_means(medicare_expand ~ radio_news, data = head(data, 200), condition1 = 0, condition2 = 1)
        question.correct <- tryCatch(isTRUE(all.equal(unname(small.dim$coefficients), unname(expected$coefficients))) && isTRUE(all.equal(unname(small.dim$std.error), unname(expected$std.error))), error = function(e) FALSE)
        testthat::expect_true(question.correct)
      }
    )
  )
)
