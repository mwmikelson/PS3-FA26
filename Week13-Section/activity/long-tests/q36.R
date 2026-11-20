test = list(
  name = "q36",
  cases = list(
    ottr::TestCase$new(
      name = "q36-1",
      code = {
        testthat::expect_equal(q36.answer, 'a')
      },
      failure_message = "Not quite. Check your answer and try again."
    )
  )
)
