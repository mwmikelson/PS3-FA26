test = list(
  name = "q1",
  cases = list(
    ottr::TestCase$new(
      hidden = FALSE,
      name = NA,
      points = 1,
      code = {
        testthat::test_that("q1: saved the full difference_in_means output", {
          testthat::expect_true(inherits(q1.dim, "difference_in_means"))
        })
        testthat::test_that("q1: estimate (campus routes, weekdays, Semester/Summer only, semester minus summer)", {
          testthat::expect_equal(as.numeric(q1.dim$coefficients), 1022.904, tolerance = 1e-3)
        })
        testthat::test_that("q1: standard error", {
          testthat::expect_equal(as.numeric(q1.dim$std.error), 352.0787, tolerance = 1e-3)
        })
      }
    )
  )
)
