test = list(
  name = "q11",
  cases = list(
    ottr::TestCase$new(
      name = "q11",
      code = {
        local({
          raw <- getOption("ps3_cache_raw"); d <- getOption("ps3_cache_d"); if (is.null(raw)) { raw <- purrr::map_dfr(list.files("ps3_flights", pattern = "\\.dta$", full.names = TRUE), haven::read_dta); d <- lubridate::mdy(raw$flight_date); options(ps3_cache_raw = raw, ps3_cache_d = d) }
          testthat::expect_true(exists("q11.plot"), info = "Save your plot as q11.plot")
          testthat::expect_s3_class(q11.plot, "ggplot")
          geoms <- sapply(q11.plot$layers, function(l) class(l$geom)[1])
          testthat::expect_true("GeomLine" %in% geoms, info = "Use geom_line() to draw the line")
          b <- ggplot2::ggplot_build(q11.plot)
          testthat::expect_true(inherits(b$layout$panel_scales_x[[1]], "ScaleContinuousDate"),
                                info = "The x-axis should be dates (month_start)")
          exp <- dplyr::tibble(month_start = lubridate::floor_date(d, "month")) %>%
            dplyr::group_by(month_start) %>% dplyr::summarize(flights = dplyr::n())
          ly <- b$data[[which(geoms == "GeomLine")[1]]]$y
          testthat::expect_equal(sort(as.numeric(ly)), sort(as.numeric(exp$flights)),
                                 info = "The y-axis should be the number of flights per month")
          testthat::expect_false(is.null(q11.plot$labels$title), info = "Add a title with labs()")
        })
      }
    )
  )
)
