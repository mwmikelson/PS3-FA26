test = list(
  name = "q13",
  cases = list(
    ottr::TestCase$new(
      name = "q13-bars",
      failure_message = "Use geom_bar() with season on the x-axis. There should be 8 bars: 4 seasons x 2 game types.",
      code = {
        get.map <- function(p, a) {
          m <- p$mapping[[a]]
          for (l in p$layers) if (is.null(m) && !is.null(l$mapping[[a]])) m <- l$mapping[[a]]
          if (is.null(m)) NA_character_ else rlang::as_label(m)
        }
        geoms <- function(p) sapply(p$layers, function(l) class(l$geom)[1])
        built <- function(p, g) ggplot2::ggplot_build(p)$data[[which(geoms(p) %in% g)[1]]]
        lab <- function(p, a) { v <- p$labels[[a]]; if (is.null(v) || length(v) != 1 || is.na(v)) "" else as.character(v) }
        testthat::expect_true(exists("q13.plot") && inherits(q13.plot, "ggplot"), info = "Save your plot as q13.plot (it should be a ggplot object).")
        p <- q13.plot
        testthat::expect_true("GeomBar" %in% geoms(p))
        testthat::expect_true(grepl("season", get.map(p, "x")))
        b <- built(p, "GeomBar")
        testthat::expect_equal(nrow(b), 8)
        testthat::expect_equal(sum(b$y), 2150)
      }
    ),
    ottr::TestCase$new(
      name = "q13-facet",
      failure_message = "Use facet_wrap(~ game_type) to make one panel per game type.",
      code = {
        get.map <- function(p, a) {
          m <- p$mapping[[a]]
          for (l in p$layers) if (is.null(m) && !is.null(l$mapping[[a]])) m <- l$mapping[[a]]
          if (is.null(m)) NA_character_ else rlang::as_label(m)
        }
        geoms <- function(p) sapply(p$layers, function(l) class(l$geom)[1])
        built <- function(p, g) ggplot2::ggplot_build(p)$data[[which(geoms(p) %in% g)[1]]]
        lab <- function(p, a) { v <- p$labels[[a]]; if (is.null(v) || length(v) != 1 || is.na(v)) "" else as.character(v) }
        testthat::expect_true(exists("q13.plot") && inherits(q13.plot, "ggplot"), info = "Save your plot as q13.plot (it should be a ggplot object).")
        p <- q13.plot
        testthat::expect_true(inherits(p$facet, "FacetWrap"))
        testthat::expect_true("game_type" %in% names(p$facet$params$facets))
      }
    ),
    ottr::TestCase$new(
      name = "q13-free-y",
      failure_message = "Add scales = 'free_y' to facet_wrap() so each panel has its own y-axis.",
      code = {
        get.map <- function(p, a) {
          m <- p$mapping[[a]]
          for (l in p$layers) if (is.null(m) && !is.null(l$mapping[[a]])) m <- l$mapping[[a]]
          if (is.null(m)) NA_character_ else rlang::as_label(m)
        }
        geoms <- function(p) sapply(p$layers, function(l) class(l$geom)[1])
        built <- function(p, g) ggplot2::ggplot_build(p)$data[[which(geoms(p) %in% g)[1]]]
        lab <- function(p, a) { v <- p$labels[[a]]; if (is.null(v) || length(v) != 1 || is.na(v)) "" else as.character(v) }
        testthat::expect_true(exists("q13.plot") && inherits(q13.plot, "ggplot"), info = "Save your plot as q13.plot (it should be a ggplot object).")
        p <- q13.plot
        testthat::expect_true(isTRUE(p$facet$params$free$y))
        testthat::expect_false(isTRUE(p$facet$params$free$x))
      }
    )
  )
)
