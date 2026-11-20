test = list(
  name = "q18",
  cases = list(
    ottr::TestCase$new(
      name = "q18-1",
      code = {
        testthat::expect_equal(q18.answer, 'a')
      },
      failure_message = "Not quite. Check your answer and try again."
    )
  )
)
