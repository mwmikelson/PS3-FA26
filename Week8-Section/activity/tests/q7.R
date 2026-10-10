test = list(
  name = "q7",
  cases = list(
    ottr::TestCase$new(
      name = "q7",
      hidden = FALSE,
      points = 1,
      code = {
    testthat::expect_true(toupper(q7) %in% c("A","B","C"))
    testthat::expect_equal(toupper(q7), "B")
      }
    )
  )
)
