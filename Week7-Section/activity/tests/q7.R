test = list(
  name = "q7",
  cases = list(
    ottr::TestCase$new(
      hidden = FALSE,
      name = NA,
      points = 1,
      code = {
        testthat::test_that("q7", {
          testthat::expect_equal(toupper(trimws(as.character(q7.answer))), "A")
        })
      }
    )
  )
)
