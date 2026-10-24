test = list(
  name = "q10",
  cases = list(
    ottr::TestCase$new(
      name = "q10",
      hidden = FALSE,
      code = {
        testthat::expect_true(is.character(q10.answer) && length(q10.answer) == 1, info = "Put your answer in quotes, like 'a'.")
        testthat::expect_equal(tolower(trimws(q10.answer)), "a", info = "Not quite. Try again!")
      }
    )
  )
)
