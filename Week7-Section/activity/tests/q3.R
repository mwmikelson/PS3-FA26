library(testthat)

test = list(
  name = "q3",
  cases = list(
    ottr::TestCase$new(
      hidden = FALSE,
      name = NA,
      points = 1,
      code = {
        test_that("q3", {
          expect_equal(q3.p, mean(shuffled.sem.sum >= actual.sem.sum))
        })
      }
    )
  )
)
