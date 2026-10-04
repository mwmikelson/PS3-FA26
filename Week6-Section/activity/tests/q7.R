test = list(
  name = "q7",
  cases = list(
    ottr::TestCase$new(
      name = "q7.dim-estimate",
      failure_message = "The estimate in q7.dim doesn't look right. Check that you used playoff games only (all four seasons), and that it is home minus away.",
      code = {
        testthat::expect_true(exists("q7.dim"))
        testthat::expect_true(is.list(q7.dim) && !is.null(q7.dim$coefficients) && !is.null(q7.dim$std.error), info = "Save the full difference_in_means() output in q7.dim.")
        testthat::expect_true(abs(as.numeric(q7.dim$coefficients) - 5.82022471910112) < 0.02)
      }
    ),
    ottr::TestCase$new(
      name = "q7.dim-std.error",
      failure_message = "The standard error in q7.dim doesn't look right. Check that you used playoff games only (all four seasons).",
      code = {
        testthat::expect_true(exists("q7.dim"))
        testthat::expect_true(is.list(q7.dim) && !is.null(q7.dim$coefficients) && !is.null(q7.dim$std.error), info = "Save the full difference_in_means() output in q7.dim.")
        testthat::expect_true(abs(as.numeric(q7.dim$std.error) - 1.65801909719672) < 0.02)
      }
    )
  )
)
