library(testthat)

test = list(
  name = "q4",
  cases = list(
    ottr::TestCase$new(
      hidden = FALSE,
      name = NA,
      points = 1,
      code = {
        test_that("q4", {
          expect_equal(q4.answer, "C")
        })
      }
    )
  )
)
