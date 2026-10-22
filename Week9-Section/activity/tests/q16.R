test = list(
  name = "q16",
  cases = list(
    ottr::TestCase$new(
      name = "q16 - 1",
      hidden = FALSE,
      success_message = "Correct!",
      failure_message = "Check three things: the outcome and treatment columns, which two groups you compared, and that the CONTROL group is in condition1 and the TREATMENT group is in condition2. Remember to use only men (sex equals \"male\").",
      code = {
        expected <- estimatr::difference_in_means(primary2006 ~ messages, data = social[social$sex == "male", ], condition1 = "Control", condition2 = "Neighbors")
        question.correct <- tryCatch(isTRUE(all.equal(unname(neighbors.men.dim$coefficients), unname(expected$coefficients))) && isTRUE(all.equal(unname(neighbors.men.dim$std.error), unname(expected$std.error))), error = function(e) FALSE)
        testthat::expect_true(question.correct)
      }
    ),
    ottr::TestCase$new(
      name = "q16 - 2",
      hidden = FALSE,
      success_message = "Correct!",
      failure_message = "Check three things: the outcome and treatment columns, which two groups you compared, and that the CONTROL group is in condition1 and the TREATMENT group is in condition2. Remember to use only women (sex equals \"female\").",
      code = {
        expected <- estimatr::difference_in_means(primary2006 ~ messages, data = social[social$sex == "female", ], condition1 = "Control", condition2 = "Neighbors")
        question.correct <- tryCatch(isTRUE(all.equal(unname(neighbors.women.dim$coefficients), unname(expected$coefficients))) && isTRUE(all.equal(unname(neighbors.women.dim$std.error), unname(expected$std.error))), error = function(e) FALSE)
        testthat::expect_true(question.correct)
      }
    )
  )
)
