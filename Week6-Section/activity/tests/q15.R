test = list(
  name = "q15",
  cases = list(
    ottr::TestCase$new(
      name = "q15.reg-estimate",
      failure_message = "The estimate in q15.reg doesn't look right. Check that you used regular-season games only, and that it is home minus away.",
      code = {
        testthat::expect_true(exists("q15.reg"))
        testthat::expect_true(is.list(q15.reg) && !is.null(q15.reg$coefficients) && !is.null(q15.reg$std.error), info = "Save the full difference_in_means() output in q15.reg.")
        testthat::expect_true(abs(as.numeric(q15.reg$coefficients) - 0.0730223123732252) < 0.005)
      }
    ),
    ottr::TestCase$new(
      name = "q15.po-estimate",
      failure_message = "The estimate in q15.po doesn't look right. Check that you used playoff games only, and that it is home minus away.",
      code = {
        testthat::expect_true(exists("q15.po"))
        testthat::expect_true(is.list(q15.po) && !is.null(q15.po$coefficients) && !is.null(q15.po$std.error), info = "Save the full difference_in_means() output in q15.po.")
        testthat::expect_true(abs(as.numeric(q15.po$coefficients) - 0.280898876404494) < 0.01)
      }
    )
  )
)
