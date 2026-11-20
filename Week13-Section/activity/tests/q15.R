test = list(
  name = "q15",
  cases = list(
    ottr::TestCase$new(
      name = "q15-1",
      code = {
        testthat::expect_equal(q15.answer, FALSE)
      },
      failure_message = "Not quite. Check your answer and try again."
    )
  )
)
