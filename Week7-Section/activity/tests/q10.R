library(testthat)

test = list(
  name = "q10",
  cases = list(
    ottr::TestCase$new(
      hidden = FALSE,
      name = NA,
      points = 1,
      code = {
        test_that("q10", {
          expect_equal(q10.answer, "D")
        })
      }
    )
  )
)
