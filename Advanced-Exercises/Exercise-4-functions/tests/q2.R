test <- list(
  name = "q2",
  cases = list(
    ottr::TestCase$new(
      name = "q2a",
      points = 1,
      hidden = FALSE,
      success_message = "pct_change exists and is a function.",
      failure_message = "Make sure you ran the cell that defines a function called pct_change.",
      code = {
        testthat::expect_true(exists("pct_change"))
        testthat::expect_true(is.function(pct_change))
      }
    ),
    ottr::TestCase$new(
      name = "q2b",
      points = 1,
      hidden = FALSE,
      success_message = "Correct on the examples.",
      failure_message = "Check the examples: going from 50 to 75 should give 50 and going from 200 to 150 should give -25.",
      code = {
        testthat::expect_equal(pct_change(50, 75), 50)
        testthat::expect_equal(pct_change(200, 150), -25)
      }
    ),
    ottr::TestCase$new(
      name = "q2c",
      points = 1,
      hidden = FALSE,
      success_message = "Works when inputs are named and when they are columns.",
      failure_message = "Your function should work when the inputs are given by name (new = ..., old = ...) and when they are several numbers at once.",
      code = {
        testthat::expect_equal(pct_change(new = 75, old = 50), 50)
        testthat::expect_equal(pct_change(old = c(10, 20), new = c(15, 10)), c(50, -50))
      }
    )
  )
)
