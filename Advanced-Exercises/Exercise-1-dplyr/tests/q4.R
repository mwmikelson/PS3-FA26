test = list(
  name = "q4",
  cases = list(
    ottr::TestCase$new(
      name = "q4-rows",
      failure_message = "trio.2024 should have every 2024 game played by one of the three teams.",
      code = {
        testthat::expect_true(exists("trio.2024"))
        testthat::expect_equal(nrow(trio.2024), 151)
      }
    ),
    ottr::TestCase$new(
      name = "q4-values",
      failure_message = "Every row should be a 2024 game for the Aces, Liberty, or Lynx.",
      code = {
        d <- as.data.frame(trio.2024)
        testthat::expect_true(all(d$season == 2024) && all(d$team %in% c("Aces", "Liberty", "Lynx")))
      }
    )
  )
)
