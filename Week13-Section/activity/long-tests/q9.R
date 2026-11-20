test = list(
  name = "q9",
  cases = list(
    ottr::TestCase$new(
      name = "q9-1",
      code = {
        testthat::expect_true(inherits(mod.public.ctrl, "lm"))
        testthat::expect_equal(stats::nobs(mod.public.ctrl), 60)
        testthat::expect_equal(stats::coef(mod.public.ctrl)[c("(Intercept)", "observers", "incumbent_npp")], c("(Intercept)" = 16.746973401, "observers" = 13.370274528, "incumbent_npp" = -9.224245025), tolerance = 1e-4)
      },
      failure_message = "Not quite. Check your answer and try again."
    )
  )
)
