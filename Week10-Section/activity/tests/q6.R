test = list(
  name = "q6",
  cases = list(
    ottr::TestCase$new(
      name = "q6",
      code = {
        testthat::expect_equal(q6.answer, "b")
      }
    )
  )
)
