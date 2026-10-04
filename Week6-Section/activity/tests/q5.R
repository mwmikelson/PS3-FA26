test = list(
  name = "q5",
  cases = list(
    ottr::TestCase$new(
      name = "q5.dim-estimate",
      failure_message = "The estimate in q5.dim doesn't look right. Check that you used all four regular seasons and regular-season games only, and that it is home minus away.",
      code = {
        testthat::expect_true(exists("q5.dim"))
        testthat::expect_true(is.list(q5.dim) && !is.null(q5.dim$coefficients) && !is.null(q5.dim$std.error), info = "Save the full difference_in_means() output in q5.dim.")
        testthat::expect_true(abs(as.numeric(q5.dim$coefficients) - 1.49492900608519) < 0.01)
      }
    ),
    ottr::TestCase$new(
      name = "q5.dim-std.error",
      failure_message = "The standard error in q5.dim doesn't look right. Check that you used all four regular seasons and regular-season games only.",
      code = {
        testthat::expect_true(exists("q5.dim"))
        testthat::expect_true(is.list(q5.dim) && !is.null(q5.dim$coefficients) && !is.null(q5.dim$std.error), info = "Save the full difference_in_means() output in q5.dim.")
        testthat::expect_true(abs(as.numeric(q5.dim$std.error) - 0.500908017536863) < 0.01)
      }
    )
  )
)
