test = list(
  name = "q7",
  cases = list(
    ottr::TestCase$new(
      name = "q7",
      hidden = FALSE,
      code = {
        testthat::expect_true(is.character(q7.answer) && length(q7.answer) == 1, info = "Put your answer in quotes, like 'a'.")
        testthat::expect_equal(tolower(trimws(q7.answer)), "c", info = "Not quite. Try again!")
      }
    )
  )
)
