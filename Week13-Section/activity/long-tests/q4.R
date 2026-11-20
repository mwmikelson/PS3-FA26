test = list(
  name = "q4",
  cases = list(
    ottr::TestCase$new(
      name = "q4-1",
      code = {
        testthat::expect_equal(q4.answer, TRUE)
      },
      failure_message = "Not quite. Check your answer and try again."
    )
  )
)
