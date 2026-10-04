test = list(
  name = "q3",
  cases = list(
    ottr::TestCase$new(
      name = "q3-choice",
      failure_message = "Pick one of the letters (text in quotes, such as the letter of your choice).",
      code = {
        testthat::expect_true(exists("q3.answer"))
        testthat::expect_true(toupper(trimws(as.character(q3.answer))) %in% c("A", "B", "C", "D"), info = "Set q3.answer to one of the letters.")
      }
    ),
    ottr::TestCase$new(
      name = "q3-answer",
      failure_message = "Not quite. Reread the question and think about what you found above.",
      code = {
        testthat::expect_equal(toupper(trimws(as.character(q3.answer))), "C")
      }
    )
  )
)
