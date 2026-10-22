test = list(
  name = "q2",
  cases = list(
    ottr::TestCase$new(
      name = "q2",
      code = {
        d <- read.csv("moneyball_batters.csv")
        expected <- estimatr::difference_in_means(obp ~ oakland, data = subset(d, year == 2002), weights = pa)
        testthat::expect_true(inherits(weighted.2002, "difference_in_means"))
        testthat::expect_equal(unname(weighted.2002$coefficients), unname(expected$coefficients))
        testthat::expect_equal(unname(weighted.2002$p.value), unname(expected$p.value))
        testthat::expect_equal(unname(weighted.2002$conf.low), unname(expected$conf.low))
      }
    )
  )
)
