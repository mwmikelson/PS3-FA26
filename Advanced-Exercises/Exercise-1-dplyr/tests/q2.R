test = list(
  name = "q2",
  cases = list(
    ottr::TestCase$new(
      name = "q2-rows",
      failure_message = "playoff.2025 should have exactly the 2025 playoff team-games.",
      code = {
        testthat::expect_true(exists("playoff.2025"))
        testthat::expect_equal(nrow(playoff.2025), 48)
      }
    ),
    ottr::TestCase$new(
      name = "q2-values",
      failure_message = "Every row should be a 2025 playoff game.",
      code = {
        d <- as.data.frame(playoff.2025)
        testthat::expect_true(all(d$season == 2025) && all(d$game_type == "playoff"))
      }
    )
  )
)
