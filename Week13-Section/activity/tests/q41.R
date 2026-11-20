test = list(
  name = "q41",
  cases = list(
    ottr::TestCase$new(
      name = "q41-1",
      code = {
        testthat::expect_equal(q41.answer, 'a')
      },
      failure_message = "Not quite. Check your answer and try again."
    )
  )
)
