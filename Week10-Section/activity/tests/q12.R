test = list(
  name = "q12",
  cases = list(
    ottr::TestCase$new(
      name = "q12",
      code = {
        testthat::expect_equal(q12.answer, "c")
      }
    )
  )
)
