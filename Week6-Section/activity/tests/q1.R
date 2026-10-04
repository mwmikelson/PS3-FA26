test = list(
  name = "q1",
  cases = list(
    ottr::TestCase$new(
      name = "q1.dim-estimate",
      failure_message = "The estimate in q1.dim doesn't look right. Check that you used 2023 regular-season games only, and that it is home minus away.",
      code = {
        testthat::expect_true(exists("q1.dim"))
        testthat::expect_true(is.list(q1.dim) && !is.null(q1.dim$coefficients) && !is.null(q1.dim$std.error), info = "Save the full difference_in_means() output in q1.dim.")
        testthat::expect_true(abs(as.numeric(q1.dim$coefficients) - 1.52697095435686) < 0.01)
      }
    ),
    ottr::TestCase$new(
      name = "q1.dim-std.error",
      failure_message = "The standard error in q1.dim doesn't look right. Check that you used 2023 regular-season games only.",
      code = {
        testthat::expect_true(exists("q1.dim"))
        testthat::expect_true(is.list(q1.dim) && !is.null(q1.dim$coefficients) && !is.null(q1.dim$std.error), info = "Save the full difference_in_means() output in q1.dim.")
        testthat::expect_true(abs(as.numeric(q1.dim$std.error) - 1.02841370079825) < 0.01)
      }
    )
  )
)
