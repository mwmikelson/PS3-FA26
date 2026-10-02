test = list(
  name = "q11",
  cases = list(
    ottr::TestCase$new(
      name = "q11-structure",
      failure_message = "by.type.home should have 4 rows and columns game_type, home_away, and avg_points.",
      code = {
        testthat::expect_true(exists("by.type.home"))
        d <- as.data.frame(by.type.home)
        testthat::expect_true(all(c("game_type", "home_away", "avg_points") %in% names(d)))
        testthat::expect_equal(nrow(d), 4)
      }
    ),
    ottr::TestCase$new(
      name = "q11-values",
      failure_message = "The averages are off. Check that you grouped by both game_type and home_away.",
      code = {
        d <- as.data.frame(by.type.home)
        get <- function(g, h) d$avg_points[d$game_type == g & d$home_away == h]
        testthat::expect_true(abs(get("playoff", "away") - 78.5280898876404) < 1e-4)
        testthat::expect_true(abs(get("regular", "away") - 81.3123732251521) < 1e-4)
        testthat::expect_true(abs(get("playoff", "home") - 84.3483146067416) < 1e-4)
        testthat::expect_true(abs(get("regular", "home") - 82.8073022312373) < 1e-4)
      }
    )
  )
)
