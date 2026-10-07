test = list(
  name = "q5",
  cases = list(
    ottr::TestCase$new(
      name = "q5-bars",
      failure_message = "Use geom_bar() with game_type on the x-axis. geom_bar() counts the rows for you.",
      code = {
        get.map <- function(p, a) {
          m <- p$mapping[[a]]
          for (l in p$layers) if (is.null(m) && !is.null(l$mapping[[a]])) m <- l$mapping[[a]]
          if (is.null(m)) NA_character_ else rlang::as_label(m)
        }
        geoms <- function(p) sapply(p$layers, function(l) class(l$geom)[1])
        built <- function(p, g) ggplot2::ggplot_build(p)$data[[which(geoms(p) %in% g)[1]]]
        lab <- function(p, a) { v <- p$labels[[a]]; if (is.null(v) || length(v) != 1 || is.na(v)) "" else as.character(v) }
        testthat::expect_true(exists("q5.plot") && inherits(q5.plot, "ggplot"), info = "Save your plot as q5.plot (it should be a ggplot object).")
        p <- q5.plot
        testthat::expect_true("GeomBar" %in% geoms(p))
        testthat::expect_true(grepl("game_type", get.map(p, "x")))
      }
    ),
    ottr::TestCase$new(
      name = "q5-counts",
      failure_message = "The bar heights should be the number of team-games in each game type.",
      code = {
        get.map <- function(p, a) {
          m <- p$mapping[[a]]
          for (l in p$layers) if (is.null(m) && !is.null(l$mapping[[a]])) m <- l$mapping[[a]]
          if (is.null(m)) NA_character_ else rlang::as_label(m)
        }
        geoms <- function(p) sapply(p$layers, function(l) class(l$geom)[1])
        built <- function(p, g) ggplot2::ggplot_build(p)$data[[which(geoms(p) %in% g)[1]]]
        lab <- function(p, a) { v <- p$labels[[a]]; if (is.null(v) || length(v) != 1 || is.na(v)) "" else as.character(v) }
        testthat::expect_true(exists("q5.plot") && inherits(q5.plot, "ggplot"), info = "Save your plot as q5.plot (it should be a ggplot object).")
        p <- q5.plot
        b <- built(p, c("GeomBar", "GeomCol"))
        testthat::expect_equal(sort(b$y), c(178, 1972))
      }
    )
  )
)
