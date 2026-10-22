test = list(
  name = "q7",
  cases = list(
    ottr::TestCase$new(
      name = "q7",
      code = {
        d <- read.csv("moneyball_batters.csv")
        expected <- estimatr::difference_in_means(ops ~ salary_group, data = subset(d, year == 2002), condition1 = "low", condition2 = "high", weights = ab)
        testthat::expect_true(inherits(ops.by.salary, "difference_in_means"))
        testthat::expect_equal(unname(ops.by.salary$coefficients), unname(expected$coefficients))
        testthat::expect_equal(unname(ops.by.salary$p.value), unname(expected$p.value))
        testthat::expect_equal(unname(ops.by.salary$conf.low), unname(expected$conf.low))
      }
    )
  )
)
