test = list(
  name = "q39",
  cases = list(
    ottr::TestCase$new(
      name = "q39-1",
      code = {
        testthat::expect_equal(q39.answer, 'd')
      },
      failure_message = "Not quite. Check your answer and try again."
    )
  )
)
