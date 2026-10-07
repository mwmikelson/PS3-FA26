test = list(
  name = "q6",
  cases = list(
    ottr::TestCase$new(
      name = "q6-bars",
      failure_message = "Use geom_col() (you already have the heights) with team on the x-axis and avg_points on the y-axis.",
      code = {
        get.map <- function(p, a) {
          m <- p$mapping[[a]]
          for (l in p$layers) if (is.null(m) && !is.null(l$mapping[[a]])) m <- l$mapping[[a]]
          if (is.null(m)) NA_character_ else rlang::as_label(m)
        }
        geoms <- function(p) sapply(p$layers, function(l) class(l$geom)[1])
        built <- function(p, g) ggplot2::ggplot_build(p)$data[[which(geoms(p) %in% g)[1]]]
        lab <- function(p, a) { v <- p$labels[[a]]; if (is.null(v) || length(v) != 1 || is.na(v)) "" else as.character(v) }
        testthat::expect_true(exists("q6.plot") && inherits(q6.plot, "ggplot"), info = "Save your plot as q6.plot (it should be a ggplot object).")
        p <- q6.plot
        testthat::expect_true(any(geoms(p) %in% c("GeomCol", "GeomBar")))
        testthat::expect_true(grepl("team", get.map(p, "x")))
        b <- built(p, c("GeomCol", "GeomBar"))
        testthat::expect_true(isTRUE(all.equal(sort(b$y), c(75.7954545454545, 75.8409090909091, 77.1363636363636, 77.7272727272727, 81.6818181818182, 82.1363636363636, 82.7954545454545, 83.6363636363636, 84.3636363636364, 84.3863636363636, 84.6222222222222, 85.4666666666667, 85.6590909090909))))
      }
    ),
    ottr::TestCase$new(
      name = "q6-horizontal",
      failure_message = "Use coord_flip() to make the bars horizontal.",
      code = {
        get.map <- function(p, a) {
          m <- p$mapping[[a]]
          for (l in p$layers) if (is.null(m) && !is.null(l$mapping[[a]])) m <- l$mapping[[a]]
          if (is.null(m)) NA_character_ else rlang::as_label(m)
        }
        geoms <- function(p) sapply(p$layers, function(l) class(l$geom)[1])
        built <- function(p, g) ggplot2::ggplot_build(p)$data[[which(geoms(p) %in% g)[1]]]
        lab <- function(p, a) { v <- p$labels[[a]]; if (is.null(v) || length(v) != 1 || is.na(v)) "" else as.character(v) }
        testthat::expect_true(exists("q6.plot") && inherits(q6.plot, "ggplot"), info = "Save your plot as q6.plot (it should be a ggplot object).")
        p <- q6.plot
        testthat::expect_true(inherits(p$coordinates, "CoordFlip"))
      }
    ),
    ottr::TestCase$new(
      name = "q6-sorted",
      failure_message = "Sort the bars with reorder(team, avg_points) so the longest bar is at the top.",
      code = {
        get.map <- function(p, a) {
          m <- p$mapping[[a]]
          for (l in p$layers) if (is.null(m) && !is.null(l$mapping[[a]])) m <- l$mapping[[a]]
          if (is.null(m)) NA_character_ else rlang::as_label(m)
        }
        geoms <- function(p) sapply(p$layers, function(l) class(l$geom)[1])
        built <- function(p, g) ggplot2::ggplot_build(p)$data[[which(geoms(p) %in% g)[1]]]
        lab <- function(p, a) { v <- p$labels[[a]]; if (is.null(v) || length(v) != 1 || is.na(v)) "" else as.character(v) }
        testthat::expect_true(exists("q6.plot") && inherits(q6.plot, "ggplot"), info = "Save your plot as q6.plot (it should be a ggplot object).")
        p <- q6.plot
        b <- built(p, c("GeomCol", "GeomBar"))
        testthat::expect_false(is.unsorted(b$y[order(b$x)]))
      }
    )
  )
)
