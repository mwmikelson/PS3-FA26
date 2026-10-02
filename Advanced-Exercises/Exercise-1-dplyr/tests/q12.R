test = list(
  name = "q12",
  cases = list(
    ottr::TestCase$new(
      name = "q12-structure",
      failure_message = "team.summary should have 13 rows (one per team) and columns team, games, win_pct, avg_points.",
      code = {
        testthat::expect_true(exists("team.summary"))
        d <- as.data.frame(team.summary)
        testthat::expect_true(all(c("team", "games", "win_pct", "avg_points") %in% names(d)))
        testthat::expect_equal(nrow(d), 13)
      }
    ),
    ottr::TestCase$new(
      name = "q12-values",
      failure_message = "The values are off. Check n() for games and mean(win) for win_pct.",
      code = {
        d <- as.data.frame(team.summary)
        exp.team <- c("Aces", "Dream", "Fever", "Liberty", "Lynx", "Mercury", "Mystics", "Sky", "Sparks", "Storm", "Sun", "Valkyries", "Wings")
        exp.games <- c(199, 167, 171, 189, 183, 175, 164, 171, 160, 171, 186, 46, 168)
        exp.win <- c(0.733668341708543, 0.473053892215569, 0.391812865497076, 0.656084656084656, 0.595628415300546, 0.428571428571429, 0.432926829268293, 0.415204678362573, 0.36875, 0.497076023391813, 0.559139784946237, 0.5, 0.369047619047619)
        exp.pts <- c(87.6331658291457, 80.5449101796407, 82.1812865497076, 84.1798941798942, 82.5136612021858, 80.6342857142857, 79.280487804878, 79.9122807017544, 80.75625, 81.6783625730994, 80.8225806451613, 77.5217391304348, 83.9285714285714)
        for (i in seq_along(exp.team)) {
          r <- d[as.character(d$team) == exp.team[i], ]
          testthat::expect_equal(nrow(r), 1)
          testthat::expect_equal(as.numeric(r$games), exp.games[i])
          testthat::expect_true(abs(as.numeric(r$win_pct) - exp.win[i]) < 1e-4)
          testthat::expect_true(abs(as.numeric(r$avg_points) - exp.pts[i]) < 1e-4)
        }
      }
    )
  )
)
