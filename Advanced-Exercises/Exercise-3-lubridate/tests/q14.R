test = list(
  name = "q14",
  cases = list(
    ottr::TestCase$new(
      name = "q14",
      code = {
        local({
          raw <- getOption("ps3_cache_raw"); d <- getOption("ps3_cache_d"); if (is.null(raw)) { raw <- purrr::map_dfr(list.files("ps3_flights", pattern = "\\.dta$", full.names = TRUE), haven::read_dta); d <- lubridate::mdy(raw$flight_date); options(ps3_cache_raw = raw, ps3_cache_d = d) }
          testthat::expect_true(exists("delay.year.airport"), info = "Save your answer as delay.year.airport")
          testthat::expect_true(all(c("year", "airport", "avg_dep_delay") %in% names(delay.year.airport)),
                                info = "Need columns named year, airport, and avg_dep_delay")
          testthat::expect_equal(nrow(delay.year.airport), 10,
                                 info = "Expect 10 rows: 5 years x 2 airports (departing flights only)")
          exp <- dplyr::tibble(year = as.numeric(lubridate::year(d)), airport = raw$airport,
                               direction = raw$direction, dep_delay = raw$dep_delay) %>%
            dplyr::filter(direction == "departing") %>%
            dplyr::group_by(year, airport) %>%
            dplyr::summarize(avg_dep_delay = mean(dep_delay, na.rm = TRUE), .groups = "drop")
          stu <- dplyr::tibble(year = as.numeric(delay.year.airport$year),
                               airport = as.character(delay.year.airport$airport),
                               avg_dep_delay = as.numeric(delay.year.airport$avg_dep_delay))
          j <- dplyr::inner_join(exp, stu, by = c("year", "airport"), suffix = c(".exp", ".stu"))
          testthat::expect_equal(nrow(j), nrow(exp))
          testthat::expect_equal(j$avg_dep_delay.stu, j$avg_dep_delay.exp,
                                 info = "Did you use only departing flights, and na.rm = TRUE?")
        })
      }
    )
  )
)
