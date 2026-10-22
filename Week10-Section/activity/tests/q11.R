test = list(
  name = "q11",
  cases = list(
    ottr::TestCase$new(
      name = "q11",
      code = {
        testthat::expect_true(is.numeric(my.best.guess))
        testthat::expect_length(my.best.guess, 1)
        testthat::expect_true(my.best.guess >= 0.320 && my.best.guess <= 0.352)
      }
    )
  )
)
