library(testthat)

test = list(
  name = "q9",
  cases = list(
    ottr::TestCase$new(
      hidden = FALSE,
      name = NA,
      points = 1,
      code = {
        test_that("q9", {
          expect_equal(q9.answer, "C")
        })
      }
    )
  )
)
