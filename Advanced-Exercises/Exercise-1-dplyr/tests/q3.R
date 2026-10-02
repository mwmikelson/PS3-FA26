test = list(
  name = "q3",
  cases = list(
    ottr::TestCase$new(
      name = "q3-rows",
      failure_message = "big.nights should include every team-game that meets either condition.",
      code = {
        testthat::expect_true(exists("big.nights"))
        testthat::expect_equal(nrow(big.nights), 164)
      }
    ),
    ottr::TestCase$new(
      name = "q3-values",
      failure_message = "Every row should meet at least one of the two conditions.",
      code = {
        d <- as.data.frame(big.nights)
        testthat::expect_true(all(d$points >= 100 | d$threes_made >= 15))
      }
    )
  )
)
