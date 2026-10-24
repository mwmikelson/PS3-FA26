test = list(
  name = "q3",
  cases = list(
    ottr::TestCase$new(
      name = "q3",
      hidden = FALSE,
      code = {
        testthat::expect_true(is.character(q3.answer) && length(q3.answer) == 1, info = "Put your answer in quotes, like 'a'.")
        testthat::expect_equal(tolower(trimws(q3.answer)), "b", info = "Not quite. Try again!")
      }
    )
  )
)
