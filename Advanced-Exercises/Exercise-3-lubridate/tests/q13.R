test = list(
  name = "q13",
  cases = list(
    ottr::TestCase$new(
      name = "q13",
      code = {
        local({
          raw <- getOption("ps3_cache_raw"); d <- getOption("ps3_cache_d"); if (is.null(raw)) { raw <- purrr::map_dfr(list.files("ps3_flights", pattern = "\\.dta$", full.names = TRUE), haven::read_dta); d <- lubridate::mdy(raw$flight_date); options(ps3_cache_raw = raw, ps3_cache_d = d) }
          testthat::expect_true(exists("period.summary"), info = "Save your answer as period.summary")
          testthat::expect_true(all(c("period", "flights", "cancel_rate", "avg_dep_delay") %in% names(period.summary)),
                                info = "Need columns named period, flights, cancel_rate, and avg_dep_delay")
          testthat::expect_equal(nrow(period.summary), 3)
          per <- dplyr::case_when(d < lubridate::ymd("2020-03-19") ~ "pre",
                                  d < lubridate::ymd("2021-06-15") ~ "during",
                                  TRUE ~ "post")
          exp <- dplyr::tibble(period = per, cancelled = raw$cancelled, dep_delay = raw$dep_delay) %>%
            dplyr::group_by(period) %>%
            dplyr::summarize(flights = dplyr::n(), cancel_rate = mean(cancelled),
                             avg_dep_delay = mean(dep_delay, na.rm = TRUE))
          stu <- dplyr::tibble(period = as.character(period.summary$period),
                               flights = as.numeric(period.summary$flights),
                               cancel_rate = as.numeric(period.summary$cancel_rate),
                               avg_dep_delay = as.numeric(period.summary$avg_dep_delay))
          j <- dplyr::inner_join(exp, stu, by = "period", suffix = c(".exp", ".stu"))
          testthat::expect_equal(nrow(j), 3, info = "period should be pre, during, and post")
          testthat::expect_equal(j$flights.stu, as.numeric(j$flights.exp))
          testthat::expect_equal(j$cancel_rate.stu, j$cancel_rate.exp)
          testthat::expect_equal(j$avg_dep_delay.stu, j$avg_dep_delay.exp)
        })
      }
    )
  )
)
