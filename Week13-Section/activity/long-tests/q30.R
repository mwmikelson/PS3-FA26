test = list(
  name = "q30",
  cases = list(
    ottr::TestCase$new(
      name = "q30-1",
      code = {
        testthat::expect_equal(q30.answer, 'a')
      },
      failure_message = "Not quite. Check your answer and try again."
    )
  )
)
