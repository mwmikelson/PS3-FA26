test = list(
  name = "q15",
  cases = list(
    ottr::TestCase$new(
      name = "q15-structure",
      failure_message = "playoff.hosts should have columns team and home_games, one row per team that hosted a playoff game, sorted from most to fewest.",
      code = {
        testthat::expect_true(exists("playoff.hosts"))
        d <- as.data.frame(playoff.hosts)
        testthat::expect_true(all(c("team", "home_games") %in% names(d)))
        testthat::expect_equal(nrow(d), 11)
        testthat::expect_false(is.unsorted(rev(d$home_games)))
      }
    ),
    ottr::TestCase$new(
      name = "q15-values",
      failure_message = "The home game counts are off. Did you keep only playoff games where the team was at home?",
      code = {
        d <- as.data.frame(playoff.hosts)
        exp.team <- c("Aces", "Liberty", "Sun", "Lynx", "Mercury", "Sky", "Storm", "Wings", "Fever", "Dream", "Valkyries")
        exp.n <- c(23, 15, 14, 11, 6, 5, 5, 4, 3, 2, 1)
        for (i in seq_along(exp.team)) {
          testthat::expect_equal(as.numeric(d$home_games[as.character(d$team) == exp.team[i]]), exp.n[i])
        }
      }
    )
  )
)
