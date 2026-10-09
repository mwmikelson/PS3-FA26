test = list(
  name = "q4",
  cases = list(
    ottr::TestCase$new(
      hidden = FALSE,
      name = NA,
      points = 1,
      code = {
        testthat::test_that("q4", {
          testthat::expect_equal(toupper(trimws(as.character(q4.answer))), "D")
        })
      }
    )
  )
)
