test = list(
  name = "q11",
  cases = list(
    ottr::TestCase$new(
      name = "q11-scatter",
      failure_message = "Keep the scatterplot of assists (x) vs. points (y) with one point per team-game.",
      code = {
        get.map <- function(p, a) {
          m <- p$mapping[[a]]
          for (l in p$layers) if (is.null(m) && !is.null(l$mapping[[a]])) m <- l$mapping[[a]]
          if (is.null(m)) NA_character_ else rlang::as_label(m)
        }
        geoms <- function(p) sapply(p$layers, function(l) class(l$geom)[1])
        built <- function(p, g) ggplot2::ggplot_build(p)$data[[which(geoms(p) %in% g)[1]]]
        lab <- function(p, a) { v <- p$labels[[a]]; if (is.null(v) || length(v) != 1 || is.na(v)) "" else as.character(v) }
        testthat::expect_true(exists("q11.plot") && inherits(q11.plot, "ggplot"), info = "Save your plot as q11.plot (it should be a ggplot object).")
        p <- q11.plot
        testthat::expect_true("GeomPoint" %in% geoms(p))
        b <- built(p, "GeomPoint")
        testthat::expect_equal(nrow(b), 2150)
        testthat::expect_true(abs(sum(b$x) - 43452) < 1e-3)
      }
    ),
    ottr::TestCase$new(
      name = "q11-facet-wrap",
      failure_message = "Use facet_wrap(~ season) to make one panel per season.",
      code = {
        get.map <- function(p, a) {
          m <- p$mapping[[a]]
          for (l in p$layers) if (is.null(m) && !is.null(l$mapping[[a]])) m <- l$mapping[[a]]
          if (is.null(m)) NA_character_ else rlang::as_label(m)
        }
        geoms <- function(p) sapply(p$layers, function(l) class(l$geom)[1])
        built <- function(p, g) ggplot2::ggplot_build(p)$data[[which(geoms(p) %in% g)[1]]]
        lab <- function(p, a) { v <- p$labels[[a]]; if (is.null(v) || length(v) != 1 || is.na(v)) "" else as.character(v) }
        testthat::expect_true(exists("q11.plot") && inherits(q11.plot, "ggplot"), info = "Save your plot as q11.plot (it should be a ggplot object).")
        p <- q11.plot
        testthat::expect_true(inherits(p$facet, "FacetWrap"))
        testthat::expect_true("season" %in% names(p$facet$params$facets))
      }
    ),
    ottr::TestCase$new(
      name = "q11-two-columns",
      failure_message = "Set ncol = 2 inside facet_wrap().",
      code = {
        get.map <- function(p, a) {
          m <- p$mapping[[a]]
          for (l in p$layers) if (is.null(m) && !is.null(l$mapping[[a]])) m <- l$mapping[[a]]
          if (is.null(m)) NA_character_ else rlang::as_label(m)
        }
        geoms <- function(p) sapply(p$layers, function(l) class(l$geom)[1])
        built <- function(p, g) ggplot2::ggplot_build(p)$data[[which(geoms(p) %in% g)[1]]]
        lab <- function(p, a) { v <- p$labels[[a]]; if (is.null(v) || length(v) != 1 || is.na(v)) "" else as.character(v) }
        testthat::expect_true(exists("q11.plot") && inherits(q11.plot, "ggplot"), info = "Save your plot as q11.plot (it should be a ggplot object).")
        p <- q11.plot
        testthat::expect_equal(p$facet$params$ncol, 2)
      }
    )
  )
)
