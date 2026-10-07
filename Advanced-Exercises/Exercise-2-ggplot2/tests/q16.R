test = list(
  name = "q16",
  cases = list(
    ottr::TestCase$new(
      name = "q16-bars",
      failure_message = "Use geom_col() with month on the x-axis and riders on the y-axis, for 2024 only (36 bars).",
      code = {
        get.map <- function(p, a) {
          m <- p$mapping[[a]]
          for (l in p$layers) if (is.null(m) && !is.null(l$mapping[[a]])) m <- l$mapping[[a]]
          if (is.null(m)) NA_character_ else rlang::as_label(m)
        }
        geoms <- function(p) sapply(p$layers, function(l) class(l$geom)[1])
        built <- function(p, g) ggplot2::ggplot_build(p)$data[[which(geoms(p) %in% g)[1]]]
        lab <- function(p, a) { v <- p$labels[[a]]; if (is.null(v) || length(v) != 1 || is.na(v)) "" else as.character(v) }
        testthat::expect_true(exists("q16.plot") && inherits(q16.plot, "ggplot"), info = "Save your plot as q16.plot (it should be a ggplot object).")
        p <- q16.plot
        testthat::expect_true(any(geoms(p) %in% c("GeomCol", "GeomBar")))
        b <- built(p, c("GeomCol", "GeomBar"))
        testthat::expect_equal(nrow(b), 36)
        testthat::expect_true(abs(sum(b$y) - 3489355.74196878) < 1)
      }
    ),
    ottr::TestCase$new(
      name = "q16-facets",
      failure_message = "Use facet_wrap(~ day_type) to make one panel per day type.",
      code = {
        get.map <- function(p, a) {
          m <- p$mapping[[a]]
          for (l in p$layers) if (is.null(m) && !is.null(l$mapping[[a]])) m <- l$mapping[[a]]
          if (is.null(m)) NA_character_ else rlang::as_label(m)
        }
        geoms <- function(p) sapply(p$layers, function(l) class(l$geom)[1])
        built <- function(p, g) ggplot2::ggplot_build(p)$data[[which(geoms(p) %in% g)[1]]]
        lab <- function(p, a) { v <- p$labels[[a]]; if (is.null(v) || length(v) != 1 || is.na(v)) "" else as.character(v) }
        testthat::expect_true(exists("q16.plot") && inherits(q16.plot, "ggplot"), info = "Save your plot as q16.plot (it should be a ggplot object).")
        p <- q16.plot
        testthat::expect_true(inherits(p$facet, "FacetWrap"))
        testthat::expect_true("day_type" %in% names(p$facet$params$facets))
      }
    ),
    ottr::TestCase$new(
      name = "q16-theme",
      failure_message = "Add theme_minimal() to the plot.",
      code = {
        get.map <- function(p, a) {
          m <- p$mapping[[a]]
          for (l in p$layers) if (is.null(m) && !is.null(l$mapping[[a]])) m <- l$mapping[[a]]
          if (is.null(m)) NA_character_ else rlang::as_label(m)
        }
        geoms <- function(p) sapply(p$layers, function(l) class(l$geom)[1])
        built <- function(p, g) ggplot2::ggplot_build(p)$data[[which(geoms(p) %in% g)[1]]]
        lab <- function(p, a) { v <- p$labels[[a]]; if (is.null(v) || length(v) != 1 || is.na(v)) "" else as.character(v) }
        testthat::expect_true(exists("q16.plot") && inherits(q16.plot, "ggplot"), info = "Save your plot as q16.plot (it should be a ggplot object).")
        p <- q16.plot
        testthat::expect_true(identical(p$theme$panel.background, ggplot2::theme_minimal()$panel.background) && identical(p$theme$axis.ticks, ggplot2::theme_minimal()$axis.ticks))
      }
    ),
    ottr::TestCase$new(
      name = "q16-labels",
      failure_message = "Add a title, subtitle, and caption, and plain-English x and y labels (not month and riders).",
      code = {
        get.map <- function(p, a) {
          m <- p$mapping[[a]]
          for (l in p$layers) if (is.null(m) && !is.null(l$mapping[[a]])) m <- l$mapping[[a]]
          if (is.null(m)) NA_character_ else rlang::as_label(m)
        }
        geoms <- function(p) sapply(p$layers, function(l) class(l$geom)[1])
        built <- function(p, g) ggplot2::ggplot_build(p)$data[[which(geoms(p) %in% g)[1]]]
        lab <- function(p, a) { v <- p$labels[[a]]; if (is.null(v) || length(v) != 1 || is.na(v)) "" else as.character(v) }
        testthat::expect_true(exists("q16.plot") && inherits(q16.plot, "ggplot"), info = "Save your plot as q16.plot (it should be a ggplot object).")
        p <- q16.plot
        testthat::expect_true(nchar(lab(p, "title")) > 0 && nchar(lab(p, "subtitle")) > 0 && nchar(lab(p, "caption")) > 0)
        testthat::expect_true(nchar(lab(p, "x")) > 0 && !(lab(p, "x") %in% c("month", "x")))
        testthat::expect_true(nchar(lab(p, "y")) > 0 && !(lab(p, "y") %in% c("riders", "y")))
      }
    ),
    ottr::TestCase$new(
      name = "q16-no-legend",
      failure_message = "Remove the legend with theme(legend.position = 'none'), added AFTER theme_minimal().",
      code = {
        get.map <- function(p, a) {
          m <- p$mapping[[a]]
          for (l in p$layers) if (is.null(m) && !is.null(l$mapping[[a]])) m <- l$mapping[[a]]
          if (is.null(m)) NA_character_ else rlang::as_label(m)
        }
        geoms <- function(p) sapply(p$layers, function(l) class(l$geom)[1])
        built <- function(p, g) ggplot2::ggplot_build(p)$data[[which(geoms(p) %in% g)[1]]]
        lab <- function(p, a) { v <- p$labels[[a]]; if (is.null(v) || length(v) != 1 || is.na(v)) "" else as.character(v) }
        testthat::expect_true(exists("q16.plot") && inherits(q16.plot, "ggplot"), info = "Save your plot as q16.plot (it should be a ggplot object).")
        p <- q16.plot
        testthat::expect_true(identical(p$theme$legend.position, "none") || is.na(get.map(p, "fill")))
      }
    )
  )
)
