test = list(
  name = "q16",
  cases = list(
    ottr::TestCase$new(
      name = "q16: lines by airport",
      code = {
        local({
          raw <- readr::read_csv("ps3_bayarea_flights.csv", show_col_types = FALSE); d <- lubridate::mdy(raw$flight_date)
          testthat::expect_true(exists("q16.plot"), info = "Save your plot as q16.plot")
          testthat::expect_s3_class(q16.plot, "ggplot")
          geoms <- sapply(q16.plot$layers, function(l) class(l$geom)[1])
          testthat::expect_true("GeomLine" %in% geoms, info = "Use geom_line() for the monthly lines")
          b <- ggplot2::ggplot_build(q16.plot)
          testthat::expect_true(inherits(b$layout$panel_scales_x[[1]], "ScaleContinuousDate"),
                                info = "The x-axis should be dates")
          ld <- b$data[[which(geoms == "GeomLine")[1]]]
          testthat::expect_equal(length(unique(ld$colour)), 3, info = "Color the lines by airport (3 lines)")
          testthat::expect_equal(sum(ld$y), nrow(raw), info = "Each line should show flights per month for one airport")
        })
      }
    ),
    ottr::TestCase$new(
      name = "q16: reference lines and look",
      code = {
        local({
          geoms <- sapply(q16.plot$layers, function(l) class(l$geom)[1])
          testthat::expect_true("GeomVline" %in% geoms, info = "Add the dashed lines with geom_vline()")
          b <- ggplot2::ggplot_build(q16.plot)
          xi <- unlist(lapply(b$data[geoms == "GeomVline"], function(x) x$xintercept))
          testthat::expect_equal(sort(as.numeric(xi)),
                                 as.numeric(as.Date(c("2020-03-19", "2021-06-15"))),
                                 info = "Vertical lines should be at 2020-03-19 and 2021-06-15")
          testthat::expect_false(is.null(q16.plot$labels$title), info = "Add a title with labs()")
          testthat::expect_false(inherits(q16.plot$theme$panel.border, "element_blank") ||
                                 is.null(q16.plot$theme$panel.border), info = "Use theme_bw()")
        })
      }
    )
  )
)
