test = list(
  name = "q10",
  cases = list(
    ottr::TestCase$new(
      name = "q10-plot",
      failure_message = "Keep your Q2 scatterplot: points colored by home_away.",
      code = {
        get.map <- function(p, a) {
          m <- p$mapping[[a]]
          for (l in p$layers) if (is.null(m) && !is.null(l$mapping[[a]])) m <- l$mapping[[a]]
          if (is.null(m)) NA_character_ else rlang::as_label(m)
        }
        geoms <- function(p) sapply(p$layers, function(l) class(l$geom)[1])
        built <- function(p, g) ggplot2::ggplot_build(p)$data[[which(geoms(p) %in% g)[1]]]
        lab <- function(p, a) { v <- p$labels[[a]]; if (is.null(v) || length(v) != 1 || is.na(v)) "" else as.character(v) }
        testthat::expect_true(exists("q10.plot") && inherits(q10.plot, "ggplot"), info = "Save your plot as q10.plot (it should be a ggplot object).")
        p <- q10.plot
        testthat::expect_true("GeomPoint" %in% geoms(p))
        testthat::expect_identical(get.map(p, "colour"), "home_away")
      }
    ),
    ottr::TestCase$new(
      name = "q10-theme",
      failure_message = "Add theme_bw() to the plot.",
      code = {
        get.map <- function(p, a) {
          m <- p$mapping[[a]]
          for (l in p$layers) if (is.null(m) && !is.null(l$mapping[[a]])) m <- l$mapping[[a]]
          if (is.null(m)) NA_character_ else rlang::as_label(m)
        }
        geoms <- function(p) sapply(p$layers, function(l) class(l$geom)[1])
        built <- function(p, g) ggplot2::ggplot_build(p)$data[[which(geoms(p) %in% g)[1]]]
        lab <- function(p, a) { v <- p$labels[[a]]; if (is.null(v) || length(v) != 1 || is.na(v)) "" else as.character(v) }
        testthat::expect_true(exists("q10.plot") && inherits(q10.plot, "ggplot"), info = "Save your plot as q10.plot (it should be a ggplot object).")
        p <- q10.plot
        testthat::expect_true(identical(p$theme$panel.border, ggplot2::theme_bw()$panel.border) && identical(p$theme$panel.background, ggplot2::theme_bw()$panel.background))
      }
    ),
    ottr::TestCase$new(
      name = "q10-legend",
      failure_message = "Put the legend at the bottom with theme(legend.position = 'bottom'), and add it AFTER theme_bw().",
      code = {
        get.map <- function(p, a) {
          m <- p$mapping[[a]]
          for (l in p$layers) if (is.null(m) && !is.null(l$mapping[[a]])) m <- l$mapping[[a]]
          if (is.null(m)) NA_character_ else rlang::as_label(m)
        }
        geoms <- function(p) sapply(p$layers, function(l) class(l$geom)[1])
        built <- function(p, g) ggplot2::ggplot_build(p)$data[[which(geoms(p) %in% g)[1]]]
        lab <- function(p, a) { v <- p$labels[[a]]; if (is.null(v) || length(v) != 1 || is.na(v)) "" else as.character(v) }
        testthat::expect_true(exists("q10.plot") && inherits(q10.plot, "ggplot"), info = "Save your plot as q10.plot (it should be a ggplot object).")
        p <- q10.plot
        testthat::expect_identical(p$theme$legend.position, "bottom")
      }
    )
  )
)
