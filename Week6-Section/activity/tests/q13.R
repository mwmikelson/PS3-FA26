test = list(
  name = "q13",
  cases = list(
    ottr::TestCase$new(
      name = "q13.reg-estimate",
      failure_message = "The estimate in q13.reg doesn't look right. Check that you used regular-season games only, and that it is home minus away.",
      code = {
        testthat::expect_true(exists("q13.reg"))
        testthat::expect_true(is.list(q13.reg) && !is.null(q13.reg$coefficients) && !is.null(q13.reg$std.error), info = "Save the full difference_in_means() output in q13.reg.")
        testthat::expect_true(abs(as.numeric(q13.reg$coefficients) - 0.000224902090038337) < 0.005)
      }
    ),
    ottr::TestCase$new(
      name = "q13.po-estimate",
      failure_message = "The estimate in q13.po doesn't look right. Check that you used playoff games only, and that it is home minus away.",
      code = {
        testthat::expect_true(exists("q13.po"))
        testthat::expect_true(is.list(q13.po) && !is.null(q13.po$coefficients) && !is.null(q13.po$std.error), info = "Save the full difference_in_means() output in q13.po.")
        testthat::expect_true(abs(as.numeric(q13.po$coefficients) - 0.0617968849539142) < 0.01)
      }
    )
  )
)
