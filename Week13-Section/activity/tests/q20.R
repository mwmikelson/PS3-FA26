test = list(
  name = "q20",
  cases = list(
    ottr::TestCase$new(
      name = "q20-1",
      code = {
        testthat::expect_equal(q20.answer, 'c')
      },
      failure_message = "Not quite. Check your answer and try again."
    )
  )
)
