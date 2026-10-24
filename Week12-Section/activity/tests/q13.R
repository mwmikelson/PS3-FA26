test = list(
  name = "q13",
  cases = list(
    ottr::TestCase$new(
      name = "q13",
      hidden = FALSE,
      code = {
        testthat::expect_true(is.character(q13.answer) && length(q13.answer) == 1, info = "Put your answer in quotes, like 'a'.")
        testthat::expect_equal(tolower(trimws(q13.answer)), "c", info = "Not quite. Try again!")
      }
    )
  )
)
