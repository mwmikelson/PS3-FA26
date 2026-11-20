test = list(
  name = "q6",
  cases = list(
    ottr::TestCase$new(
      name = "q6-1",
      code = {
        testthat::expect_equal(q6.answer, 'a')
      },
      failure_message = "Not quite. Check your answer and try again."
    )
  )
)
