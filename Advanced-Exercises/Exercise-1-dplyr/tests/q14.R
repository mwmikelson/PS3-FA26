test = list(
  name = "q14",
  cases = list(
    ottr::TestCase$new(
      name = "q14-structure",
      failure_message = "blowout.rates should have 8 rows and columns season, game_type, blowout_share.",
      code = {
        testthat::expect_true(exists("blowout.rates"))
        d <- as.data.frame(blowout.rates)
        testthat::expect_true(all(c("season", "game_type", "blowout_share") %in% names(d)))
        testthat::expect_equal(nrow(d), 8)
      }
    ),
    ottr::TestCase$new(
      name = "q14-values",
      failure_message = "The shares are off. Check how you defined a blowout and what you grouped by.",
      code = {
        d <- as.data.frame(blowout.rates)
        get <- function(s, g) d$blowout_share[d$season == s & d$game_type == g]
        testthat::expect_true(abs(get(2022, "playoff") - 0.217391304347826) < 1e-4)
        testthat::expect_true(abs(get(2023, "playoff") - 0.25) < 1e-4)
        testthat::expect_true(abs(get(2024, "playoff") - 0.0454545454545455) < 1e-4)
        testthat::expect_true(abs(get(2025, "playoff") - 0.166666666666667) < 1e-4)
        testthat::expect_true(abs(get(2022, "regular") - 0.142857142857143) < 1e-4)
        testthat::expect_true(abs(get(2023, "regular") - 0.161825726141079) < 1e-4)
        testthat::expect_true(abs(get(2024, "regular") - 0.0912863070539419) < 1e-4)
        testthat::expect_true(abs(get(2025, "regular") - 0.18815331010453) < 1e-4)
      }
    )
  )
)
