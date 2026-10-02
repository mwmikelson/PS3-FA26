test = list(
  name = "q11",
  cases = list(
    ottr::TestCase$new(
      name = "q11-choice",
      failure_message = "Pick one of the letters (text in quotes, such as the letter of your choice).",
      code = {
        testthat::expect_true(exists("q11.answer"))
        testthat::expect_true(toupper(trimws(as.character(q11.answer))) %in% c("A", "B", "C", "D"), info = "Set q11.answer to one of the letters.")
      }
    ),
    ottr::TestCase$new(
      name = "q11-answer",
      failure_message = "Not quite. Reread the question and think about what you found above.",
      code = {
        testthat::expect_equal(toupper(trimws(as.character(q11.answer))), "D")
      }
    )
  )
)
