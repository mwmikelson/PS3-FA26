library(testthat)

test = list(
  name = "q2",
  cases = list(
    ottr::TestCase$new(
      hidden = FALSE,
      name = NA,
      points = 1,
      code = {
        test_that("q2", {
          expect_equal(q2.answer, "B")
        })
      }
    )
  )
)
