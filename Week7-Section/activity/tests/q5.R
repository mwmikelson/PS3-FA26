test = list(
  name = "q5",
  cases = list(
    ottr::TestCase$new(
      hidden = FALSE,
      name = NA,
      points = 1,
      code = {
        testthat::test_that("q5", {
          testthat::expect_equal(toupper(trimws(as.character(q5.answer))), "A")
        })
      }
    )
  )
)
