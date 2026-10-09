library(testthat)

test = list(
  name = "q8",
  cases = list(
    ottr::TestCase$new(
      hidden = FALSE,
      name = NA,
      points = 1,
      code = {
        test_that("q8: saved the full difference_in_means output", {
          expect_true("difference_in_means" %in% class(q8.dim))
        })
        test_that("q8: estimate (check the subset, baseline, and subtraction order)", {
          expect_equal(unname(q8.dim$coefficients), 15.73515, tolerance = 1e-3)
        })
        test_that("q8: standard error (check the subset)", {
          expect_equal(unname(q8.dim$std.error), 26.9928, tolerance = 1e-3)
        })
      }
    )
  )
)
