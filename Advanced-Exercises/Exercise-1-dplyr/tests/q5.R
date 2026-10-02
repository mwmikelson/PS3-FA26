test = list(
  name = "q5",
  cases = list(
    ottr::TestCase$new(
      name = "q5-rows",
      failure_message = "top.scorers should have exactly 10 rows.",
      code = {
        testthat::expect_true(exists("top.scorers"))
        testthat::expect_equal(nrow(top.scorers), 10)
      }
    ),
    ottr::TestCase$new(
      name = "q5-values",
      failure_message = "top.scorers should be the 10 highest-scoring team-games, sorted from most to fewest points.",
      code = {
        testthat::expect_equal(as.numeric(as.data.frame(top.scorers)$points), c(118, 117, 116, 116, 113, 113, 113, 112, 112, 111))
      }
    )
  )
)
