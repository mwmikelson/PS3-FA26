test = list(
  name = "q6",
  cases = list(
    ottr::TestCase$new(
      name = "q6.team",
      failure_message = "q6.team should be the name (text) of the team with the fewest points in a single game.",
      code = {
        testthat::expect_true(exists("q6.team"))
        testthat::expect_true(as.character(q6.team) %in% c("Mercury"))
      }
    )
  )
)
