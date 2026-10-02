test = list(
  name = "q13",
  cases = list(
    ottr::TestCase$new(
      name = "q13-teams",
      failure_message = "top5 should have 5 rows with columns team and avg_points, sorted from highest to lowest average points (regular season only).",
      code = {
        testthat::expect_true(exists("top5"))
        d <- as.data.frame(top5)
        testthat::expect_true(all(c("team", "avg_points") %in% names(d)))
        testthat::expect_equal(as.character(d$team), c("Aces", "Liberty", "Wings", "Lynx", "Fever"))
      }
    ),
    ottr::TestCase$new(
      name = "q13-values",
      failure_message = "The average points are off. Did you filter to regular-season games before averaging?",
      code = {
        d <- as.data.frame(top5)
        testthat::expect_true(all(abs(as.numeric(d$avg_points) - c(88.0246913580247, 84.8333333333333, 84.1375, 82.6728395061728, 82.3229813664596)) < 1e-4))
      }
    )
  )
)
