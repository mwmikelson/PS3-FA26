test = list(
  name = "q1",
  cases = list(
    ottr::TestCase$new(
      name = "q1",
      code = {
        d <- read.csv("moneyball_batters.csv")
        expected <- estimatr::difference_in_means(obp ~ oakland, data = subset(d, year == 2002))
        testthat::expect_true(inherits(unweighted.2002, "difference_in_means"))
        testthat::expect_equal(unname(unweighted.2002$coefficients), unname(expected$coefficients))
        testthat::expect_equal(unname(unweighted.2002$p.value), unname(expected$p.value))
        testthat::expect_equal(unname(unweighted.2002$conf.low), unname(expected$conf.low))
      }
    )
  )
)
