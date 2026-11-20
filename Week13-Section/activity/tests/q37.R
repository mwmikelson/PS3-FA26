test = list(
  name = "q37",
  cases = list(
    ottr::TestCase$new(
      name = "q37-1",
      code = {
        testthat::expect_equal(q37.answer, 'b')
      },
      failure_message = "Not quite. Check your answer and try again."
    )
  )
)
