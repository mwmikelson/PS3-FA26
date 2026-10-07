test = list(
  name = "q8",
  cases = list(
    ottr::TestCase$new(
      name = "q8-plot",
      failure_message = "Keep your Q7 bar graph (2024 only) and add labels to it.",
      code = {
        get.map <- function(p, a) {
          m <- p$mapping[[a]]
          for (l in p$layers) if (is.null(m) && !is.null(l$mapping[[a]])) m <- l$mapping[[a]]
          if (is.null(m)) NA_character_ else rlang::as_label(m)
        }
        geoms <- function(p) sapply(p$layers, function(l) class(l$geom)[1])
        built <- function(p, g) ggplot2::ggplot_build(p)$data[[which(geoms(p) %in% g)[1]]]
        lab <- function(p, a) { v <- p$labels[[a]]; if (is.null(v) || length(v) != 1 || is.na(v)) "" else as.character(v) }
        testthat::expect_true(exists("q8.plot") && inherits(q8.plot, "ggplot"), info = "Save your plot as q8.plot (it should be a ggplot object).")
        p <- q8.plot
        testthat::expect_true(any(geoms(p) %in% c("GeomCol", "GeomBar")))
        b <- built(p, c("GeomCol", "GeomBar"))
        testthat::expect_true(abs(sum(b$y) - 3489355.74196878) < 1)
      }
    ),
    ottr::TestCase$new(
      name = "q8-title-subtitle-caption",
      failure_message = "Add a title, a subtitle, and a caption inside labs().",
      code = {
        get.map <- function(p, a) {
          m <- p$mapping[[a]]
          for (l in p$layers) if (is.null(m) && !is.null(l$mapping[[a]])) m <- l$mapping[[a]]
          if (is.null(m)) NA_character_ else rlang::as_label(m)
        }
        geoms <- function(p) sapply(p$layers, function(l) class(l$geom)[1])
        built <- function(p, g) ggplot2::ggplot_build(p)$data[[which(geoms(p) %in% g)[1]]]
        lab <- function(p, a) { v <- p$labels[[a]]; if (is.null(v) || length(v) != 1 || is.na(v)) "" else as.character(v) }
        testthat::expect_true(exists("q8.plot") && inherits(q8.plot, "ggplot"), info = "Save your plot as q8.plot (it should be a ggplot object).")
        p <- q8.plot
        testthat::expect_true(nchar(lab(p, "title")) > 0 && nchar(lab(p, "subtitle")) > 0 && nchar(lab(p, "caption")) > 0)
      }
    ),
    ottr::TestCase$new(
      name = "q8-axis-labels",
      failure_message = "Give the x-axis and y-axis plain-English labels (not the variable names month and riders).",
      code = {
        get.map <- function(p, a) {
          m <- p$mapping[[a]]
          for (l in p$layers) if (is.null(m) && !is.null(l$mapping[[a]])) m <- l$mapping[[a]]
          if (is.null(m)) NA_character_ else rlang::as_label(m)
        }
        geoms <- function(p) sapply(p$layers, function(l) class(l$geom)[1])
        built <- function(p, g) ggplot2::ggplot_build(p)$data[[which(geoms(p) %in% g)[1]]]
        lab <- function(p, a) { v <- p$labels[[a]]; if (is.null(v) || length(v) != 1 || is.na(v)) "" else as.character(v) }
        testthat::expect_true(exists("q8.plot") && inherits(q8.plot, "ggplot"), info = "Save your plot as q8.plot (it should be a ggplot object).")
        p <- q8.plot
        testthat::expect_true(nchar(lab(p, "x")) > 0 && !(lab(p, "x") %in% c("month", "x")))
        testthat::expect_true(nchar(lab(p, "y")) > 0 && !(lab(p, "y") %in% c("riders", "y")))
      }
    ),
    ottr::TestCase$new(
      name = "q8-legend-title",
      failure_message = "Give the legend a title with labs(fill = ...) that isn't the variable name day_type.",
      code = {
        get.map <- function(p, a) {
          m <- p$mapping[[a]]
          for (l in p$layers) if (is.null(m) && !is.null(l$mapping[[a]])) m <- l$mapping[[a]]
          if (is.null(m)) NA_character_ else rlang::as_label(m)
        }
        geoms <- function(p) sapply(p$layers, function(l) class(l$geom)[1])
        built <- function(p, g) ggplot2::ggplot_build(p)$data[[which(geoms(p) %in% g)[1]]]
        lab <- function(p, a) { v <- p$labels[[a]]; if (is.null(v) || length(v) != 1 || is.na(v)) "" else as.character(v) }
        testthat::expect_true(exists("q8.plot") && inherits(q8.plot, "ggplot"), info = "Save your plot as q8.plot (it should be a ggplot object).")
        p <- q8.plot
        testthat::expect_true(nchar(lab(p, "fill")) > 0 && lab(p, "fill") != "day_type")
      }
    )
  )
)
