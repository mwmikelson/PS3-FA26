test = list(
  name = "q9",
  cases = list(
    ottr::TestCase$new(
      name = "q9-values",
      failure_message = "wnba2 should have a margin column equal to points - opp_points.",
      code = {
        testthat::expect_true(exists("wnba2"))
        testthat::expect_true("margin" %in% names(wnba2))
        d <- as.data.frame(wnba2)
        testthat::expect_equal(as.numeric(d$margin), as.numeric(d$points - d$opp_points))
      }
    ),
    ottr::TestCase$new(
      name = "q9-rows",
      failure_message = "wnba2 should still have every row of wnba.",
      code = {
        testthat::expect_equal(nrow(wnba2), 2150)
      }
    )
  )
)
