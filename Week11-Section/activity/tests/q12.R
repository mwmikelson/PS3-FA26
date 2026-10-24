test = list(
  name = "q12",
  cases = list(
    ottr::TestCase$new(
      name = "q12",
      hidden = FALSE,
      code = {
        testthat::expect_true(is.character(q12.answer) && length(q12.answer) == 1, info = "Put your answer in quotes, like 'a'.")
        testthat::expect_equal(tolower(trimws(q12.answer)), "c", info = "Not quite. Try again!")
      }
    )
  )
)
