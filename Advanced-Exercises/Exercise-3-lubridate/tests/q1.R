test = list(
  name = "q1",
  cases = list(
    ottr::TestCase$new(
      name = "q1",
      code = {
        testthat::expect_true(exists("q1.answer"), info = "Save your letter as q1.answer")
        testthat::expect_true(toupper(trimws(q1.answer)) == "C", info = "Not quite. Re-read the question and try another choice.")
      }
    )
  )
)
