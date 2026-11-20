test = list(
  name = "q3",
  cases = list(
    ottr::TestCase$new(
      name = "q3-1",
      code = {
        testthat::expect_equal(q3.answer, 'c')
      },
      failure_message = "Not quite. Check your answer and try again."
    )
  )
)
