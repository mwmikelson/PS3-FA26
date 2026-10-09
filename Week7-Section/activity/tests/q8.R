test = list(
  name = "q8",
  cases = list(
    ottr::TestCase$new(
      hidden = FALSE,
      name = NA,
      points = 1,
      code = {
        testthat::test_that("q8", {
          testthat::expect_equal(toupper(trimws(as.character(q8.answer))), "D")
        })
      }
    )
  )
)
