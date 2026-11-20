test = list(
  name = "q8",
  cases = list(
    ottr::TestCase$new(
      name = "q8-1",
      code = {
        testthat::expect_equal(q8.answer, 'd')
      },
      failure_message = "Not quite. Check your answer and try again."
    )
  )
)
