test = list(
  name = "q21",
  cases = list(
    ottr::TestCase$new(
      name = "q21 - 1",
      hidden = FALSE,
      success_message = "Correct!",
      failure_message = "Not quite. Look at the Pr(>|t|) column in your Question 19 output and compare it to 0.05.",
      code = {
        expected.dim <- estimatr::difference_in_means(g4math ~ classtype, data = star, condition1 = 2, condition2 = 1)
        expected.answer <- ifelse(unname(expected.dim$p.value) < 0.05, 'a', 'b')
        question.correct <- tryCatch(isTRUE(tolower(q21.answer) == expected.answer), error = function(e) FALSE)
        testthat::expect_true(question.correct)
      }
    )
  )
)
