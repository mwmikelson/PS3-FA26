test = list(
  name = "q25",
  cases = list(
    ottr::TestCase$new(
      name = "q25-1",
      code = {
        testthat::expect_equal(q25.answer, 'd')
      },
      failure_message = "Not quite. Check your answer and try again."
    )
  )
)
