test = list(
  name = "q4",
  cases = list(
    ottr::TestCase$new(
      name = "q4-layers",
      failure_message = "You need two layers: geom_point() for the points and geom_smooth(method = 'lm') for the line of best fit.",
      code = {
        get.map <- function(p, a) {
          m <- p$mapping[[a]]
          for (l in p$layers) if (is.null(m) && !is.null(l$mapping[[a]])) m <- l$mapping[[a]]
          if (is.null(m)) NA_character_ else rlang::as_label(m)
        }
        geoms <- function(p) sapply(p$layers, function(l) class(l$geom)[1])
        built <- function(p, g) ggplot2::ggplot_build(p)$data[[which(geoms(p) %in% g)[1]]]
        lab <- function(p, a) { v <- p$labels[[a]]; if (is.null(v) || length(v) != 1 || is.na(v)) "" else as.character(v) }
        testthat::expect_true(exists("q4.plot") && inherits(q4.plot, "ggplot"), info = "Save your plot as q4.plot (it should be a ggplot object).")
        p <- q4.plot
        testthat::expect_true("GeomPoint" %in% geoms(p))
        testthat::expect_true("GeomSmooth" %in% geoms(p))
      }
    ),
    ottr::TestCase$new(
      name = "q4-line",
      failure_message = "Use method = 'lm' in geom_smooth() to get a straight line of best fit.",
      code = {
        get.map <- function(p, a) {
          m <- p$mapping[[a]]
          for (l in p$layers) if (is.null(m) && !is.null(l$mapping[[a]])) m <- l$mapping[[a]]
          if (is.null(m)) NA_character_ else rlang::as_label(m)
        }
        geoms <- function(p) sapply(p$layers, function(l) class(l$geom)[1])
        built <- function(p, g) ggplot2::ggplot_build(p)$data[[which(geoms(p) %in% g)[1]]]
        lab <- function(p, a) { v <- p$labels[[a]]; if (is.null(v) || length(v) != 1 || is.na(v)) "" else as.character(v) }
        testthat::expect_true(exists("q4.plot") && inherits(q4.plot, "ggplot"), info = "Save your plot as q4.plot (it should be a ggplot object).")
        p <- q4.plot
        sm <- p$layers[[which(geoms(p) == "GeomSmooth")[1]]]
        m <- sm$stat_params$method
        testthat::expect_true(identical(m, "lm") || identical(m, stats::lm))
      }
    ),
    ottr::TestCase$new(
      name = "q4-x-axis",
      failure_message = "The x-axis should show threes_made.",
      code = {
        get.map <- function(p, a) {
          m <- p$mapping[[a]]
          for (l in p$layers) if (is.null(m) && !is.null(l$mapping[[a]])) m <- l$mapping[[a]]
          if (is.null(m)) NA_character_ else rlang::as_label(m)
        }
        geoms <- function(p) sapply(p$layers, function(l) class(l$geom)[1])
        built <- function(p, g) ggplot2::ggplot_build(p)$data[[which(geoms(p) %in% g)[1]]]
        lab <- function(p, a) { v <- p$labels[[a]]; if (is.null(v) || length(v) != 1 || is.na(v)) "" else as.character(v) }
        testthat::expect_true(exists("q4.plot") && inherits(q4.plot, "ggplot"), info = "Save your plot as q4.plot (it should be a ggplot object).")
        p <- q4.plot
        testthat::expect_true(any(geoms(p) %in% c("GeomPoint")))
        b <- built(p, c("GeomPoint"))
        testthat::expect_true(abs(sum(b$x) - 16868) < 1e-3)
      }
    ),
    ottr::TestCase$new(
      name = "q4-y-axis",
      failure_message = "The y-axis should show points.",
      code = {
        get.map <- function(p, a) {
          m <- p$mapping[[a]]
          for (l in p$layers) if (is.null(m) && !is.null(l$mapping[[a]])) m <- l$mapping[[a]]
          if (is.null(m)) NA_character_ else rlang::as_label(m)
        }
        geoms <- function(p) sapply(p$layers, function(l) class(l$geom)[1])
        built <- function(p, g) ggplot2::ggplot_build(p)$data[[which(geoms(p) %in% g)[1]]]
        lab <- function(p, a) { v <- p$labels[[a]]; if (is.null(v) || length(v) != 1 || is.na(v)) "" else as.character(v) }
        testthat::expect_true(exists("q4.plot") && inherits(q4.plot, "ggplot"), info = "Save your plot as q4.plot (it should be a ggplot object).")
        p <- q4.plot
        testthat::expect_true(any(geoms(p) %in% c("GeomPoint")))
        b <- built(p, c("GeomPoint"))
        testthat::expect_true(abs(sum(b$y) - 176318) < 1e-3)
      }
    )
  )
)
