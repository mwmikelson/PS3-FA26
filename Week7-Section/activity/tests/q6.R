test = list(
  name = "q6",
  cases = list(
    ottr::TestCase$new(
      hidden = FALSE,
      name = NA,
      points = 1,
      code = {
        testthat::test_that("q6: saved the full difference_in_means output", {
          testthat::expect_true(inherits(q6.dim, "difference_in_means"))
        })
        testthat::test_that("q6: estimate (night buses, 2024, Saturdays and weekdays only, Saturday minus weekday)", {
          testthat::expect_equal(as.numeric(q6.dim$coefficients), 15.73515, tolerance = 1e-3)
        })
        testthat::test_that("q6: standard error", {
          testthat::expect_equal(as.numeric(q6.dim$std.error), 26.9928, tolerance = 1e-3)
        })
      }
    )
  )
)
