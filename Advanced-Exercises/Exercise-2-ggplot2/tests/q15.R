test = list(
  name = "q15",
  cases = list(
    ottr::TestCase$new(
      name = "q15-scatter",
      failure_message = "Use geom_point() with avg_threes on the x-axis and win_pct on the y-axis (49 team-seasons).",
      code = {
        get.map <- function(p, a) {
          m <- p$mapping[[a]]
          for (l in p$layers) if (is.null(m) && !is.null(l$mapping[[a]])) m <- l$mapping[[a]]
          if (is.null(m)) NA_character_ else rlang::as_label(m)
        }
        geoms <- function(p) sapply(p$layers, function(l) class(l$geom)[1])
        built <- function(p, g) ggplot2::ggplot_build(p)$data[[which(geoms(p) %in% g)[1]]]
        lab <- function(p, a) { v <- p$labels[[a]]; if (is.null(v) || length(v) != 1 || is.na(v)) "" else as.character(v) }
        testthat::expect_true(exists("q15.plot") && inherits(q15.plot, "ggplot"), info = "Save your plot as q15.plot (it should be a ggplot object).")
        p <- q15.plot
        testthat::expect_true("GeomPoint" %in% geoms(p))
        b <- built(p, "GeomPoint")
        testthat::expect_equal(nrow(b), 49)
        testthat::expect_true(abs(sum(b$x) - 383.810155277228) < 1e-6)
        testthat::expect_true(abs(sum(b$y) - 24.4516489882344) < 1e-6)
      }
    ),
    ottr::TestCase$new(
      name = "q15-hline",
      failure_message = "Add geom_hline(yintercept = 0.5) for the reference line.",
      code = {
        get.map <- function(p, a) {
          m <- p$mapping[[a]]
          for (l in p$layers) if (is.null(m) && !is.null(l$mapping[[a]])) m <- l$mapping[[a]]
          if (is.null(m)) NA_character_ else rlang::as_label(m)
        }
        geoms <- function(p) sapply(p$layers, function(l) class(l$geom)[1])
        built <- function(p, g) ggplot2::ggplot_build(p)$data[[which(geoms(p) %in% g)[1]]]
        lab <- function(p, a) { v <- p$labels[[a]]; if (is.null(v) || length(v) != 1 || is.na(v)) "" else as.character(v) }
        testthat::expect_true(exists("q15.plot") && inherits(q15.plot, "ggplot"), info = "Save your plot as q15.plot (it should be a ggplot object).")
        p <- q15.plot
        testthat::expect_true("GeomHline" %in% geoms(p))
        h <- p$layers[[which(geoms(p) == "GeomHline")[1]]]
        testthat::expect_true(isTRUE(all.equal(as.numeric(h$data$yintercept), 0.5)))
      }
    ),
    ottr::TestCase$new(
      name = "q15-hline-style",
      failure_message = "Make the line dashed (linetype = 'dashed') and red (color = 'red'), outside aes().",
      code = {
        get.map <- function(p, a) {
          m <- p$mapping[[a]]
          for (l in p$layers) if (is.null(m) && !is.null(l$mapping[[a]])) m <- l$mapping[[a]]
          if (is.null(m)) NA_character_ else rlang::as_label(m)
        }
        geoms <- function(p) sapply(p$layers, function(l) class(l$geom)[1])
        built <- function(p, g) ggplot2::ggplot_build(p)$data[[which(geoms(p) %in% g)[1]]]
        lab <- function(p, a) { v <- p$labels[[a]]; if (is.null(v) || length(v) != 1 || is.na(v)) "" else as.character(v) }
        testthat::expect_true(exists("q15.plot") && inherits(q15.plot, "ggplot"), info = "Save your plot as q15.plot (it should be a ggplot object).")
        p <- q15.plot
        h <- p$layers[[which(geoms(p) == "GeomHline")[1]]]
        testthat::expect_identical(h$aes_params$linetype, "dashed")
        testthat::expect_true(h$aes_params$colour %in% c("red", "#FF0000"))
      }
    ),
    ottr::TestCase$new(
      name = "q15-percent",
      failure_message = "Use scale_y_continuous(labels = scales::percent) to show the y-axis as percentages.",
      code = {
        get.map <- function(p, a) {
          m <- p$mapping[[a]]
          for (l in p$layers) if (is.null(m) && !is.null(l$mapping[[a]])) m <- l$mapping[[a]]
          if (is.null(m)) NA_character_ else rlang::as_label(m)
        }
        geoms <- function(p) sapply(p$layers, function(l) class(l$geom)[1])
        built <- function(p, g) ggplot2::ggplot_build(p)$data[[which(geoms(p) %in% g)[1]]]
        lab <- function(p, a) { v <- p$labels[[a]]; if (is.null(v) || length(v) != 1 || is.na(v)) "" else as.character(v) }
        testthat::expect_true(exists("q15.plot") && inherits(q15.plot, "ggplot"), info = "Save your plot as q15.plot (it should be a ggplot object).")
        p <- q15.plot
        sc <- p$scales$get_scales("y")
        testthat::expect_true(!is.null(sc) && is.function(sc$labels))
      }
    )
  )
)
