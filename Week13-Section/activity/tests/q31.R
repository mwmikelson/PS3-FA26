test = list(
  name = "q31",
  cases = list(
    ottr::TestCase$new(
      name = "q31-1",
      code = {
        testthat::expect_equal(q31.answer, 'b')
      },
      failure_message = "Not quite. Check your answer and try again."
    )
  )
)
