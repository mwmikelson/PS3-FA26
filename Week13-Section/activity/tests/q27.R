test = list(
  name = "q27",
  cases = list(
    ottr::TestCase$new(
      name = "q27-1",
      code = {
        testthat::expect_equal(q27.answer, FALSE)
      },
      failure_message = "Not quite. Check your answer and try again."
    )
  )
)
