test = list(
  name = "q3",
  cases = list(
    ottr::TestCase$new(
      hidden = FALSE,
      name = NA,
      points = 1,
      code = {
        testthat::test_that("q3", {
          testthat::expect_equal(toupper(trimws(as.character(q3.answer))), "C")
        })
      }
    )
  )
)
