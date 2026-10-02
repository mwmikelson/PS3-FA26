test = list(
  name = "q10",
  cases = list(
    ottr::TestCase$new(
      name = "q10-values",
      failure_message = "wnba3 needs a blowout column that is TRUE when |margin| is at least 20.",
      code = {
        testthat::expect_true(exists("wnba3"))
        testthat::expect_true("blowout" %in% names(wnba3))
        testthat::expect_equal(sum(as.numeric(wnba3$blowout)), 322)
        testthat::expect_false(any(is.na(wnba3$blowout)))
      }
    )
  )
)
