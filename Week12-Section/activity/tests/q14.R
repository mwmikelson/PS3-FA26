test = list(
  name = "q14",
  cases = list(
    ottr::TestCase$new(
      name = "q14",
      hidden = FALSE,
      code = {
        testthat::expect_true(is.character(q14.answer) && length(q14.answer) == 1, info = "Put your answer in quotes, like 'a'.")
        testthat::expect_equal(tolower(trimws(q14.answer)), "d", info = "Not quite. Try again!")
      }
    )
  )
)
