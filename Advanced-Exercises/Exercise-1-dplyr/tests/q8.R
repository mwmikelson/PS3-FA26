test = list(
  name = "q8",
  cases = list(
    ottr::TestCase$new(
      name = "q8-columns",
      failure_message = "no.stats should keep every column except assists, rebounds, turnovers, and threes_made.",
      code = {
        testthat::expect_true(exists("no.stats"))
        testthat::expect_equal(names(no.stats), c("season", "game_id", "game_date", "game_type", "team", "home_away", "points", "opp_points", "win", "reg_win_pct"))
      }
    )
  )
)
