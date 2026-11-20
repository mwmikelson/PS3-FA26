test = list(
  name = "q12",
  cases = list(
    ottr::TestCase$new(
      name = "q12-1",
      code = {
        testthat::expect_equal(q12.answer, 'b')
      },
      failure_message = "Not quite. Check your answer and try again."
    )
  )
)
