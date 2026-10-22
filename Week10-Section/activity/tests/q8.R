test = list(
  name = "q8",
  cases = list(
    ottr::TestCase$new(
      name = "q8",
      code = {
        testthat::expect_equal(q8.answer, "a")
      }
    )
  )
)
