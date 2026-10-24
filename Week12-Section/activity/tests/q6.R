test = list(
  name = "q6",
  cases = list(
    ottr::TestCase$new(
      name = "q6",
      hidden = FALSE,
      code = {
        testthat::expect_true(is.character(q6.answer) && length(q6.answer) == 1, info = "Put your answer in quotes, like 'a'.")
        testthat::expect_equal(tolower(trimws(q6.answer)), "b", info = "Not quite. Try again!")
      }
    )
  )
)
