library(testthat)

test = list(
  name = "q5",
  cases = list(
    ottr::TestCase$new(
      hidden = FALSE,
      name = NA,
      points = 1,
      code = {
        test_that("q5", {
          expect_equal(q5.answer, "D")
        })
      }
    )
  )
)
