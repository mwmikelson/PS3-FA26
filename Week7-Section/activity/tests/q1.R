test = list(
  name = "q1",
  cases = list(
    ottr::TestCase$new(
      name = "q1.dim-estimate",
      failure_message = "The estimate in q1.dim doesn't look right. Check that you used October 2024 and only routes with all three day types, with weekday minus Sunday, and which group is the baseline.",
      code = {
        testthat::expect_true(exists("q1.dim"))
        testthat::expect_true(is.list(q1.dim) && !is.null(q1.dim$coefficients) && !is.null(q1.dim$std.error), info = "Save the full difference_in_means() output in q1.dim.")
        testthat::expect_true(abs(as.numeric(q1.dim$coefficients) - 974.751053734622) < 1)
      }
    ),
    ottr::TestCase$new(
      name = "q1.dim-std.error",
      failure_message = "The standard error in q1.dim doesn't look right. Check that you used October 2024 and only routes with all three day types, with weekday minus Sunday.",
      code = {
        testthat::expect_true(exists("q1.dim"))
        testthat::expect_true(is.list(q1.dim) && !is.null(q1.dim$coefficients) && !is.null(q1.dim$std.error), info = "Save the full difference_in_means() output in q1.dim.")
        testthat::expect_true(abs(as.numeric(q1.dim$std.error) - 416.948999597511) < 2)
      }
    )
  )
)
