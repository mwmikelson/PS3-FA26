test = list(
  name = "q16",
  cases = list(
    ottr::TestCase$new(
      name = "q16.reg",
      failure_message = "q16.reg should be the home-minus-away gap in win probability for regular-season games.",
      code = {
        testthat::expect_true(exists("q16.reg"))
        testthat::expect_true(is.numeric(q16.reg) && length(q16.reg) == 1)
        testthat::expect_true(abs(as.numeric(q16.reg) - 0.0730223123732252) < 0.005)
      }
    ),
    ottr::TestCase$new(
      name = "q16.po",
      failure_message = "q16.po should be the home-minus-away gap in win probability for playoff games.",
      code = {
        testthat::expect_true(exists("q16.po"))
        testthat::expect_true(is.numeric(q16.po) && length(q16.po) == 1)
        testthat::expect_true(abs(as.numeric(q16.po) - 0.280898876404494) < 0.01)
      }
    )
  )
)
