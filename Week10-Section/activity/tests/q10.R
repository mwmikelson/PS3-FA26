test = list(
  name = "q10",
  cases = list(
    ottr::TestCase$new(
      name = "q10",
      code = {
        d <- read.csv("moneyball_batters.csv")
        exp <- subset(d, year == 2002 & !is.na(salary_millions))
        testthat::expect_true(inherits(salary.graph.with.line, "ggplot"))
        ld <- ggplot2::layer_data(salary.graph.with.line, 1)
        ld <- ld[complete.cases(ld[, c("x", "y")]), ]
        testthat::expect_equal(nrow(ld), nrow(exp))
        testthat::expect_equal(sort(ld$x), sort(exp$salary_millions))
        testthat::expect_equal(sort(ld$y), sort(exp$obp))
        geoms <- sapply(salary.graph.with.line$layers, function(l) class(l$geom)[1])
        testthat::expect_true("GeomPoint" %in% geoms)
        testthat::expect_true("GeomSmooth" %in% geoms)
        smooth <- salary.graph.with.line$layers[[which(geoms == "GeomSmooth")[1]]]
        testthat::expect_equal(as.character(smooth$stat_params$method), "lm")
      }
    )
  )
)
