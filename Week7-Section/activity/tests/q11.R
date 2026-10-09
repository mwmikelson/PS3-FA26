library(testthat)

test = list(
  name = "q11",
  cases = list(
    ottr::TestCase$new(
      hidden = FALSE,
      name = NA,
      points = 1,
      code = {
        test_that("q11", {
          expect_equal(q11.n, sum(placebo.p < 0.05))
        })
      }
    )
  )
)
