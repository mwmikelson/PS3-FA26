test = list(
  name = "q16",
  cases = list(
    ottr::TestCase$new(
      name = "q16",
      hidden = FALSE,
      code = {
        testthat::expect_true(is.character(q16.answer) && length(q16.answer) == 1, info = "Put your answer in quotes, like 'a'.")
        testthat::expect_equal(tolower(trimws(q16.answer)), "d", info = "Not quite. Try again!")
      }
    )
  )
)
