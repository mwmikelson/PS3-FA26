test = list(
  name = "q2",
  cases = list(
    ottr::TestCase$new(
      name = "q2",
      hidden = FALSE,
      code = {
        testthat::expect_true(is.character(q2.answer) && length(q2.answer) == 1, info = "Put your answer in quotes, like 'a'.")
        testthat::expect_equal(tolower(trimws(q2.answer)), "c", info = "Not quite. Try again!")
      }
    )
  )
)
