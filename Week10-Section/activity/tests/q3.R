test = list(
  name = "q3",
  cases = list(
    ottr::TestCase$new(
      name = "q3",
      code = {
        testthat::expect_equal(q3.answer, "b")
      }
    )
  )
)
