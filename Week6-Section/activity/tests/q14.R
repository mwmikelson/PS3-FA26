test = list(
  name = "q14",
  cases = list(
    ottr::TestCase$new(
      name = "q14.reg",
      failure_message = "q14.reg should be the home-minus-away difference in reg_win_pct among regular-season games.",
      code = {
        testthat::expect_true(exists("q14.reg"))
        testthat::expect_true(is.numeric(q14.reg) && length(q14.reg) == 1)
        testthat::expect_true(abs(as.numeric(q14.reg) - 0.000224902090038337) < 0.005)
      }
    ),
    ottr::TestCase$new(
      name = "q14.po",
      failure_message = "q14.po should be the home-minus-away difference in reg_win_pct among playoff games.",
      code = {
        testthat::expect_true(exists("q14.po"))
        testthat::expect_true(is.numeric(q14.po) && length(q14.po) == 1)
        testthat::expect_true(abs(as.numeric(q14.po) - 0.0617968849539142) < 0.01)
      }
    )
  )
)
