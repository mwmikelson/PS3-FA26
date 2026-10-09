test = list(
  name = "q2",
  cases = list(
    ottr::TestCase$new(
      hidden = FALSE,
      name = NA,
      points = 1,
      code = {
        testthat::test_that("q2", {
          testthat::expect_equal(toupper(trimws(as.character(q2.answer))), "B")
        })
      }
    )
  )
)
