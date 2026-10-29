test = list(
  name = "q10",
  cases = list(
    ottr::TestCase$new(
      name = "q10-1",
      code = {
        testthat::expect_equal(q10.answer, 'b')
      },
      failure_message = "Not quite. Check your answer and try again."
    )
  )
)
