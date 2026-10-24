test = list(
  name = "q15",
  cases = list(
    ottr::TestCase$new(
      name = "q15",
      hidden = FALSE,
      code = {
        testthat::expect_true(is.character(q15.answer) && length(q15.answer) == 1, info = "Put your answer in quotes, like 'a'.")
        testthat::expect_equal(tolower(trimws(q15.answer)), "c", info = "Not quite. Try again!")
      }
    )
  )
)
