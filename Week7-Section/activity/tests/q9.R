test = list(
  name = "q9",
  cases = list(
    ottr::TestCase$new(
      hidden = FALSE,
      name = NA,
      points = 1,
      code = {
        testthat::test_that("q9", {
          testthat::expect_equal(toupper(trimws(as.character(q9.answer))), "C")
        })
      }
    )
  )
)
