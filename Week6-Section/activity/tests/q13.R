test = list(
  name = "q13",
  cases = list(
    ottr::TestCase$new(
      name = "q13-choice",
      failure_message = "Pick one of the letters (text in quotes, such as the letter of your choice).",
      code = {
        testthat::expect_true(exists("q13.answer"))
        testthat::expect_true(toupper(trimws(as.character(q13.answer))) %in% c("A", "B", "C", "D"), info = "Set q13.answer to one of the letters.")
      }
    ),
    ottr::TestCase$new(
      name = "q13-answer",
      failure_message = "Not quite. Reread the question and think about what you found above.",
      code = {
        testthat::expect_equal(toupper(trimws(as.character(q13.answer))), "B")
      }
    )
  )
)
