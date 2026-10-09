library(testthat)

test = list(
  name = "q12",
  cases = list(
    ottr::TestCase$new(
      hidden = FALSE,
      name = NA,
      points = 1,
      code = {
        test_that("q12", {
          expect_equal(q12.answer, "A")
        })
      }
    )
  )
)
