test = list(
  name = "q7",
  cases = list(
    ottr::TestCase$new(
      name = "q7",
      code = {
        testthat::expect_true(exists("q7.answer"), info = "Save your letter as q7.answer")
        testthat::expect_true(toupper(trimws(q7.answer)) == "B", info = "Not quite. Re-read the question and try another choice.")
      }
    )
  )
)
