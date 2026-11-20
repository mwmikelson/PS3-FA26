test = list(
  name = "q13",
  cases = list(
    ottr::TestCase$new(
      name = "q13-1",
      code = {
        testthat::expect_equal(q13.answer, 'd')
      },
      failure_message = "Not quite. Check your answer and try again."
    )
  )
)
