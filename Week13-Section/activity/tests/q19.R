test = list(
  name = "q19",
  cases = list(
    ottr::TestCase$new(
      name = "q19-1",
      code = {
        testthat::expect_equal(q19.answer, 'b')
      },
      failure_message = "Not quite. Check your answer and try again."
    )
  )
)
