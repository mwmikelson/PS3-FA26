test = list(
  name = "q13",
  cases = list(
    ottr::TestCase$new(
      name = "q13 - 1",
      hidden = FALSE,
      success_message = "Correct!",
      failure_message = "Check three things: the outcome and treatment columns, which two groups you compared, and that the CONTROL group is in condition1 and the TREATMENT group is in condition2. Remember to use only people who DID vote in the 2004 primary (primary2004 equals 1).",
      code = {
        expected <- estimatr::difference_in_means(primary2006 ~ messages, data = social[social$primary2004 == 1, ], condition1 = "Control", condition2 = "Neighbors")
        question.correct <- tryCatch(isTRUE(all.equal(unname(neighbors.voters.dim$coefficients), unname(expected$coefficients))) && isTRUE(all.equal(unname(neighbors.voters.dim$std.error), unname(expected$std.error))), error = function(e) FALSE)
        testthat::expect_true(question.correct)
      }
    ),
    ottr::TestCase$new(
      name = "q13 - 2",
      hidden = FALSE,
      success_message = "Correct!",
      failure_message = "Check three things: the outcome and treatment columns, which two groups you compared, and that the CONTROL group is in condition1 and the TREATMENT group is in condition2. Remember to use only people who did NOT vote in the 2004 primary (primary2004 equals 0).",
      code = {
        expected <- estimatr::difference_in_means(primary2006 ~ messages, data = social[social$primary2004 == 0, ], condition1 = "Control", condition2 = "Neighbors")
        question.correct <- tryCatch(isTRUE(all.equal(unname(neighbors.nonvoters.dim$coefficients), unname(expected$coefficients))) && isTRUE(all.equal(unname(neighbors.nonvoters.dim$std.error), unname(expected$std.error))), error = function(e) FALSE)
        testthat::expect_true(question.correct)
      }
    )
  )
)
