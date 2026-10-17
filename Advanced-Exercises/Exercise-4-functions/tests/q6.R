test <- list(
  name = "q6",
  cases = list(
    ottr::TestCase$new(
      name = "q6",
      points = 1,
      hidden = FALSE,
      success_message = "Correct!",
      failure_message = "Not quite. Look at which object the function uses inside the body. Does it use its input?",
      code = {
        testthat::expect_true(exists("q6_answer"))
        testthat::expect_equal(toupper(trimws(q6_answer)), "B")
      }
    )
  )
)
