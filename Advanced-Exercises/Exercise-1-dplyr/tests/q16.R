test = list(
  name = "q16",
  cases = list(
    ottr::TestCase$new(
      name = "q16-structure",
      failure_message = "gap.by.type should have 2 rows and columns game_type and gap.",
      code = {
        testthat::expect_true(exists("gap.by.type"))
        d <- as.data.frame(gap.by.type)
        testthat::expect_true(all(c("game_type", "gap") %in% names(d)))
        testthat::expect_equal(nrow(d), 2)
      }
    ),
    ottr::TestCase$new(
      name = "q16-values",
      failure_message = "The gaps are off. They should be home-team average points minus away-team average points within each game type.",
      code = {
        d <- as.data.frame(gap.by.type)
        testthat::expect_true(abs(d$gap[d$game_type == "regular"] - 1.49492900608519) < 1e-4)
        testthat::expect_true(abs(d$gap[d$game_type == "playoff"] - 5.82022471910112) < 1e-4)
      }
    )
  )
)
