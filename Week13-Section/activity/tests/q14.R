test = list(
  name = "q14",
  cases = list(
    ottr::TestCase$new(
      name = "q14-1",
      code = {
        testthat::expect_equal(q14.answer, 'b')
      },
      failure_message = "Not quite. Check your answer and try again."
    )
  )
)
