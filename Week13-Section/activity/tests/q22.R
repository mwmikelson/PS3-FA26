test = list(
  name = "q22",
  cases = list(
    ottr::TestCase$new(
      name = "q22-1",
      code = {
        testthat::expect_equal(q22.answer, 'b')
      },
      failure_message = "Not quite. Check your answer and try again."
    )
  )
)
