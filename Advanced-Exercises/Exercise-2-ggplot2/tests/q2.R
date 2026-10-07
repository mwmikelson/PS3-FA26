test = list(
  name = "q2",
  cases = list(
    ottr::TestCase$new(
      name = "q2-color",
      failure_message = "Color the points by home_away. Remember: a variable goes inside aes().",
      code = {
        get.map <- function(p, a) {
          m <- p$mapping[[a]]
          for (l in p$layers) if (is.null(m) && !is.null(l$mapping[[a]])) m <- l$mapping[[a]]
          if (is.null(m)) NA_character_ else rlang::as_label(m)
        }
        geoms <- function(p) sapply(p$layers, function(l) class(l$geom)[1])
        built <- function(p, g) ggplot2::ggplot_build(p)$data[[which(geoms(p) %in% g)[1]]]
        lab <- function(p, a) { v <- p$labels[[a]]; if (is.null(v) || length(v) != 1 || is.na(v)) "" else as.character(v) }
        testthat::expect_true(exists("q2.plot") && inherits(q2.plot, "ggplot"), info = "Save your plot as q2.plot (it should be a ggplot object).")
        p <- q2.plot
        testthat::expect_true("GeomPoint" %in% geoms(p))
        testthat::expect_identical(get.map(p, "colour"), "home_away")
      }
    ),
    ottr::TestCase$new(
      name = "q2-alpha",
      failure_message = "Set alpha = 0.4 for the points. This is the same for every point, so it goes outside aes().",
      code = {
        get.map <- function(p, a) {
          m <- p$mapping[[a]]
          for (l in p$layers) if (is.null(m) && !is.null(l$mapping[[a]])) m <- l$mapping[[a]]
          if (is.null(m)) NA_character_ else rlang::as_label(m)
        }
        geoms <- function(p) sapply(p$layers, function(l) class(l$geom)[1])
        built <- function(p, g) ggplot2::ggplot_build(p)$data[[which(geoms(p) %in% g)[1]]]
        lab <- function(p, a) { v <- p$labels[[a]]; if (is.null(v) || length(v) != 1 || is.na(v)) "" else as.character(v) }
        testthat::expect_true(exists("q2.plot") && inherits(q2.plot, "ggplot"), info = "Save your plot as q2.plot (it should be a ggplot object).")
        p <- q2.plot
        pt <- p$layers[[which(geoms(p) == "GeomPoint")[1]]]
        testthat::expect_true(isTRUE(all.equal(as.numeric(pt$aes_params$alpha), 0.4)))
      }
    ),
    ottr::TestCase$new(
      name = "q2-x-axis",
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
        testthat::expect_true(exists("q2.plot") && inherits(q2.plot, "ggplot"), info = "Save your plot as q2.plot (it should be a ggplot object).")
        p <- q2.plot
        testthat::expect_true(any(geoms(p) %in% c("GeomPoint")))
        b <- built(p, c("GeomPoint"))
        testthat::expect_true(abs(sum(b$x) - 43452) < 1e-3)
      }
    ),
    ottr::TestCase$new(
      name = "q2-y-axis",
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
        testthat::expect_true(exists("q2.plot") && inherits(q2.plot, "ggplot"), info = "Save your plot as q2.plot (it should be a ggplot object).")
        p <- q2.plot
        testthat::expect_true(any(geoms(p) %in% c("GeomPoint")))
        b <- built(p, c("GeomPoint"))
        testthat::expect_true(abs(sum(b$y) - 176318) < 1e-3)
      }
    )
  )
)
