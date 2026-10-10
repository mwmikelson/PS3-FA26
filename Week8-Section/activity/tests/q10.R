test = list(
  name = "q10",
  cases = list(
    ottr::TestCase$new(
      name = "q10",
      hidden = FALSE,
      points = 1,
      code = {
    testthat::expect_true(toupper(q10) %in% c("A","B","C"))
    testthat::expect_equal(toupper(q10), "C")
      }
    )
  )
)
