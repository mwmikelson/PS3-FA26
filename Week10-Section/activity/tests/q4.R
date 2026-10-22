test = list(
  name = "q4",
  cases = list(
    ottr::TestCase$new(
      name = "q4",
      code = {
        testthat::expect_equal(q4.answer, "d")
      }
    )
  )
)
