test = list(
  name = "q11",
  cases = list(
    ottr::TestCase$new(
      name = "q11-1",
      code = {
        testthat::expect_equal(q11.answer, 'c')
      },
      failure_message = "Not quite. Check your answer and try again."
    )
  )
)
