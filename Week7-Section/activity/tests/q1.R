library(testthat)

test = list(
  name = "q1",
  cases = list(
    ottr::TestCase$new(
      hidden = FALSE,
      name = NA,
      points = 1,
      code = {
        test_that("q1: saved the full difference_in_means output", {
          expect_true("difference_in_means" %in% class(q1.dim))
        })
        test_that("q1: estimate (check the subset, baseline, and subtraction order)", {
          expect_equal(unname(q1.dim$coefficients), 1022.904, tolerance = 1e-3)
        })
        test_that("q1: standard error (check the subset)", {
          expect_equal(unname(q1.dim$std.error), 352.0787, tolerance = 1e-3)
        })
      }
    )
  )
)
