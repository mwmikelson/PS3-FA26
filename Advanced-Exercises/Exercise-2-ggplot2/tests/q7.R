test = list(
  name = "q7",
  cases = list(
    ottr::TestCase$new(
      name = "q7-bars",
      failure_message = "Use geom_col() with month on the x-axis and riders on the y-axis, for 2024 only (36 bars: 12 months x 3 day types).",
      code = {
        get.map <- function(p, a) {
          m <- p$mapping[[a]]
          for (l in p$layers) if (is.null(m) && !is.null(l$mapping[[a]])) m <- l$mapping[[a]]
          if (is.null(m)) NA_character_ else rlang::as_label(m)
        }
        geoms <- function(p) sapply(p$layers, function(l) class(l$geom)[1])
        built <- function(p, g) ggplot2::ggplot_build(p)$data[[which(geoms(p) %in% g)[1]]]
        lab <- function(p, a) { v <- p$labels[[a]]; if (is.null(v) || length(v) != 1 || is.na(v)) "" else as.character(v) }
        testthat::expect_true(exists("q7.plot") && inherits(q7.plot, "ggplot"), info = "Save your plot as q7.plot (it should be a ggplot object).")
        p <- q7.plot
        testthat::expect_true(any(geoms(p) %in% c("GeomCol", "GeomBar")))
        b <- built(p, c("GeomCol", "GeomBar"))
        testthat::expect_equal(nrow(b), 36)
        testthat::expect_true(isTRUE(all.equal(sort(b$y), c(64450.2119965244, 68515.9836248907, 68598.6897901532, 69032.7506846883, 69889.1316342991, 73878.7097081982, 74339.2800397, 74668.9097081216, 75440.9364371472, 75967.4391642876, 76646.5164562333, 77262.5311293685, 79991.095813484, 80198.7178756839, 80584.6152647975, 80659.7723773919, 80771.2830096856, 81135.3118639242, 84607.0053305823, 84758.2874329503, 85132.5468322812, 88207.764417219, 90096.223368161, 92005.6893140145, 112112.256849315, 120333.903912009, 126621.272934828, 127667.077271238, 133749.746680152, 134355.02441881, 134997.389992618, 138609.745366711, 138735.789269406, 139457.329045734, 152115.022866908, 153761.780087264), tolerance = 1e-6)))
      }
    ),
    ottr::TestCase$new(
      name = "q7-fill",
      failure_message = "Map day_type to fill (inside aes()) so each day type gets its own color.",
      code = {
        get.map <- function(p, a) {
          m <- p$mapping[[a]]
          for (l in p$layers) if (is.null(m) && !is.null(l$mapping[[a]])) m <- l$mapping[[a]]
          if (is.null(m)) NA_character_ else rlang::as_label(m)
        }
        geoms <- function(p) sapply(p$layers, function(l) class(l$geom)[1])
        built <- function(p, g) ggplot2::ggplot_build(p)$data[[which(geoms(p) %in% g)[1]]]
        lab <- function(p, a) { v <- p$labels[[a]]; if (is.null(v) || length(v) != 1 || is.na(v)) "" else as.character(v) }
        testthat::expect_true(exists("q7.plot") && inherits(q7.plot, "ggplot"), info = "Save your plot as q7.plot (it should be a ggplot object).")
        p <- q7.plot
        testthat::expect_identical(get.map(p, "fill"), "day_type")
      }
    ),
    ottr::TestCase$new(
      name = "q7-dodge",
      failure_message = "Use position = 'dodge' in geom_col() to put the bars side by side instead of stacking them.",
      code = {
        get.map <- function(p, a) {
          m <- p$mapping[[a]]
          for (l in p$layers) if (is.null(m) && !is.null(l$mapping[[a]])) m <- l$mapping[[a]]
          if (is.null(m)) NA_character_ else rlang::as_label(m)
        }
        geoms <- function(p) sapply(p$layers, function(l) class(l$geom)[1])
        built <- function(p, g) ggplot2::ggplot_build(p)$data[[which(geoms(p) %in% g)[1]]]
        lab <- function(p, a) { v <- p$labels[[a]]; if (is.null(v) || length(v) != 1 || is.na(v)) "" else as.character(v) }
        testthat::expect_true(exists("q7.plot") && inherits(q7.plot, "ggplot"), info = "Save your plot as q7.plot (it should be a ggplot object).")
        p <- q7.plot
        l <- p$layers[[which(geoms(p) %in% c("GeomCol", "GeomBar"))[1]]]
        testthat::expect_true(inherits(l$position, "PositionDodge"))
      }
    )
  )
)
