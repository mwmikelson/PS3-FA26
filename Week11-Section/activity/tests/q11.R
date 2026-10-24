test = list(
  name = "q11",
  cases = list(
    ottr::TestCase$new(
      name = "q11",
      hidden = FALSE,
      code = {
        testthat::expect_true(inherits(q11, "ggplot"), info = "q11 should be a plot made with qplot().")
        if (inherits(q11, "ggplot")) {
          x.var <- gsub("[~ ]", "", rlang::as_label(q11$mapping$x))
          y.var <- gsub("[~ ]", "", rlang::as_label(q11$mapping$y))
          testthat::expect_equal(x.var, "fatality_percent", info = "Check which variable is on the x-axis.")
          testthat::expect_equal(y.var, "lutheran_percent", info = "Check which variable is on the y-axis.")
          testthat::expect_equal(nrow(q11$data), 807, info = "Use all counties in data.")
          has.points <- any(vapply(q11$layers, function(l) inherits(l$geom, "GeomPoint"), logical(1)))
          testthat::expect_true(has.points, info = "The plot should be a scatterplot.")
          smooth <- Filter(function(l) inherits(l$geom, "GeomSmooth"), q11$layers)
          testthat::expect_true(length(smooth) > 0, info = "Add the line of best fit.")
          if (length(smooth) > 0) {
            m <- smooth[[1]]$stat_params$method
            testthat::expect_true(identical(m, "lm") || identical(m, lm), info = "Use method = 'lm' for the line of best fit.")
          }
        }
      }
    )
  )
)
