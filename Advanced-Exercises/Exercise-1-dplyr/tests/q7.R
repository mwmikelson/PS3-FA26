test = list(
  name = "q7",
  cases = list(
    ottr::TestCase$new(
      name = "q7-columns",
      failure_message = "compact should have exactly these columns, in this order: season, team, home_away, points.",
      code = {
        testthat::expect_true(exists("compact"))
        testthat::expect_equal(names(compact), c("season", "team", "home_away", "points"))
      }
    ),
    ottr::TestCase$new(
      name = "q7-rows",
      failure_message = "compact should still have every row of wnba.",
      code = {
        testthat::expect_equal(nrow(compact), 2150)
      }
    )
  )
)
