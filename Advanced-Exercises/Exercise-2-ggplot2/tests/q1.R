test = list(
  name = "q1",
  cases = list(
    ottr::TestCase$new(
      name = "q1-scatterplot",
      failure_message = "Use geom_point() to make a scatterplot with one point for every team-game.",
      code = {
        get.map <- function(p, a) {
          m <- p$mapping[[a]]
          for (l in p$layers) if (is.null(m) && !is.null(l$mapping[[a]])) m <- l$mapping[[a]]
          if (is.null(m)) NA_character_ else rlang::as_label(m)
        }
        geoms <- function(p) sapply(p$layers, function(l) class(l$geom)[1])
        built <- function(p, g) ggplot2::ggplot_build(p)$data[[which(geoms(p) %in% g)[1]]]
        lab <- function(p, a) { v <- p$labels[[a]]; if (is.null(v) || length(v) != 1 || is.na(v)) "" else as.character(v) }
        testthat::expect_true(exists("q1.plot") && inherits(q1.plot, "ggplot"), info = "Save your plot as q1.plot (it should be a ggplot object).")
        p <- q1.plot
        testthat::expect_true("GeomPoint" %in% geoms(p))
        testthat::expect_equal(nrow(built(p, "GeomPoint")), 2150)
      }
    ),
    ottr::TestCase$new(
      name = "q1-x-axis",
      failure_message = "The x-axis should show assists.",
      code = {
        get.map <- function(p, a) {
          m <- p$mapping[[a]]
          for (l in p$layers) if (is.null(m) && !is.null(l$mapping[[a]])) m <- l$mapping[[a]]
          if (is.null(m)) NA_character_ else rlang::as_label(m)
        }
        geoms <- function(p) sapply(p$layers, function(l) class(l$geom)[1])
        built <- function(p, g) ggplot2::ggplot_build(p)$data[[which(geoms(p) %in% g)[1]]]
        lab <- function(p, a) { v <- p$labels[[a]]; if (is.null(v) || length(v) != 1 || is.na(v)) "" else as.character(v) }
        testthat::expect_true(exists("q1.plot") && inherits(q1.plot, "ggplot"), info = "Save your plot as q1.plot (it should be a ggplot object).")
        p <- q1.plot
        testthat::expect_true(any(geoms(p) %in% c("GeomPoint")))
        b <- built(p, c("GeomPoint"))
        testthat::expect_true(abs(sum(b$x) - 43452) < 1e-3)
      }
    ),
    ottr::TestCase$new(
      name = "q1-y-axis",
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
        testthat::expect_true(exists("q1.plot") && inherits(q1.plot, "ggplot"), info = "Save your plot as q1.plot (it should be a ggplot object).")
        p <- q1.plot
        testthat::expect_true(any(geoms(p) %in% c("GeomPoint")))
        b <- built(p, c("GeomPoint"))
        testthat::expect_true(abs(sum(b$y) - 176318) < 1e-3)
      }
    )
  )
)
