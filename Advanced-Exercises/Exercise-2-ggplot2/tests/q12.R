test = list(
  name = "q12",
  cases = list(
    ottr::TestCase$new(
      name = "q12-bars",
      failure_message = "Use geom_col() with month on the x-axis and riders on the y-axis (108 bars: 12 months x 3 day types x 3 years).",
      code = {
        get.map <- function(p, a) {
          m <- p$mapping[[a]]
          for (l in p$layers) if (is.null(m) && !is.null(l$mapping[[a]])) m <- l$mapping[[a]]
          if (is.null(m)) NA_character_ else rlang::as_label(m)
        }
        geoms <- function(p) sapply(p$layers, function(l) class(l$geom)[1])
        built <- function(p, g) ggplot2::ggplot_build(p)$data[[which(geoms(p) %in% g)[1]]]
        lab <- function(p, a) { v <- p$labels[[a]]; if (is.null(v) || length(v) != 1 || is.na(v)) "" else as.character(v) }
        testthat::expect_true(exists("q12.plot") && inherits(q12.plot, "ggplot"), info = "Save your plot as q12.plot (it should be a ggplot object).")
        p <- q12.plot
        testthat::expect_true(any(geoms(p) %in% c("GeomCol", "GeomBar")))
        b <- built(p, c("GeomCol", "GeomBar"))
        testthat::expect_equal(nrow(b), 108)
        testthat::expect_true(abs(sum(b$y) - 10170779.7025663) < 1)
      }
    ),
    ottr::TestCase$new(
      name = "q12-facet-grid",
      failure_message = "Use facet_grid(day_type ~ year): the variable before the ~ goes in the rows, the one after goes in the columns.",
      code = {
        get.map <- function(p, a) {
          m <- p$mapping[[a]]
          for (l in p$layers) if (is.null(m) && !is.null(l$mapping[[a]])) m <- l$mapping[[a]]
          if (is.null(m)) NA_character_ else rlang::as_label(m)
        }
        geoms <- function(p) sapply(p$layers, function(l) class(l$geom)[1])
        built <- function(p, g) ggplot2::ggplot_build(p)$data[[which(geoms(p) %in% g)[1]]]
        lab <- function(p, a) { v <- p$labels[[a]]; if (is.null(v) || length(v) != 1 || is.na(v)) "" else as.character(v) }
        testthat::expect_true(exists("q12.plot") && inherits(q12.plot, "ggplot"), info = "Save your plot as q12.plot (it should be a ggplot object).")
        p <- q12.plot
        testthat::expect_true(inherits(p$facet, "FacetGrid"))
        testthat::expect_true("day_type" %in% names(p$facet$params$rows))
        testthat::expect_true("year" %in% names(p$facet$params$cols))
      }
    )
  )
)
