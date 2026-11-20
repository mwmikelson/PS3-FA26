test = list(
  name = "q26",
  cases = list(
    ottr::TestCase$new(
      name = "q26-1",
      code = {
        testthat::expect_equal(q26.answer, 'b')
      },
      failure_message = "Not quite. Check your answer and try again."
    )
  )
)
