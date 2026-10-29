test = list(
  name = "q2",
  cases = list(
    ottr::TestCase$new(
      name = "q2-1",
      code = {
        testthat::expect_equal(q2.answer, 'b')
      },
      failure_message = "Not quite. Check your answer and try again."
    )
  )
)
