test = list(
  name = "q5",
  cases = list(
    ottr::TestCase$new(
      name = "q5",
      code = {
        d <- read.csv("moneyball_batters.csv")
        expected <- estimatr::difference_in_means(obp ~ oakland, data = subset(d, year == 2001), weights = pa)
        testthat::expect_true(inherits(weighted.2001, "difference_in_means"))
        testthat::expect_equal(unname(weighted.2001$coefficients), unname(expected$coefficients))
        testthat::expect_equal(unname(weighted.2001$p.value), unname(expected$p.value))
        testthat::expect_equal(unname(weighted.2001$conf.low), unname(expected$conf.low))
        expected <- estimatr::difference_in_means(obp ~ oakland, data = subset(d, year == 2003), weights = pa)
        testthat::expect_true(inherits(weighted.2003, "difference_in_means"))
        testthat::expect_equal(unname(weighted.2003$coefficients), unname(expected$coefficients))
        testthat::expect_equal(unname(weighted.2003$p.value), unname(expected$p.value))
        testthat::expect_equal(unname(weighted.2003$conf.low), unname(expected$conf.low))
      }
    )
  )
)
