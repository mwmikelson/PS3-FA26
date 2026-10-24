test = list(
  name = "q9",
  cases = list(
    ottr::TestCase$new(
      name = "q9",
      hidden = FALSE,
      code = {
        testthat::expect_true(is.character(q9.answer) && length(q9.answer) == 1, info = "Put your answer in quotes, like 'a'.")
        testthat::expect_equal(tolower(trimws(q9.answer)), "d", info = "Not quite. Try again!")
      }
    )
  )
)
