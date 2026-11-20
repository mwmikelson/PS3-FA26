test = list(
  name = "q42",
  cases = list(
    ottr::TestCase$new(
      name = "q42-1",
      code = {
        testthat::expect_equal(q42.answer, 'c')
      },
      failure_message = "Not quite. Check your answer and try again."
    )
  )
)
