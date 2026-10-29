test = list(
  name = "q16",
  cases = list(
    ottr::TestCase$new(
      name = "q16-1",
      code = {
        testthat::expect_true(inherits(mod.controls, "lm"))
        testthat::expect_equal(stats::nobs(mod.controls), 421437)
        testthat::expect_equal(stats::coef(mod.controls)[c("(Intercept)", "joint_democracy", "contiguity", "capdist")], c("(Intercept)" = 0.0027576807631, "joint_democracy" = -0.0031053569165, "contiguity" = 0.0502317360510, "capdist" = -0.0001344508479), tolerance = 1e-4)
      },
      failure_message = "Not quite. Check your answer and try again."
    )
  )
)
