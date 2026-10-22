test = list(
  name = "q9",
  cases = list(
    ottr::TestCase$new(
      name = "q9",
      code = {
        d <- read.csv("moneyball_batters.csv")
        exp <- subset(d, year == 2002 & !is.na(salary_millions))
        testthat::expect_true(inherits(salary.graph, "ggplot"))
        ld <- ggplot2::layer_data(salary.graph, 1)
        ld <- ld[complete.cases(ld[, c("x", "y")]), ]
        testthat::expect_equal(nrow(ld), nrow(exp))
        testthat::expect_equal(sort(ld$x), sort(exp$salary_millions))
        testthat::expect_equal(sort(ld$y), sort(exp$obp))
      }
    )
  )
)
