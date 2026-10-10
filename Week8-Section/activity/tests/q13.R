test = list(
  name = "q13",
  cases = list(
    ottr::TestCase$new(
      name = "q13",
      hidden = FALSE,
      points = 1,
      code = {
    testthat::expect_true(toupper(q13) %in% c("A","B","C","D"))
    testthat::expect_equal(toupper(q13), "B")
      }
    )
  )
)
