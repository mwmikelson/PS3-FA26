test = list(
  name = "q15",
  cases = list(
    ottr::TestCase$new(
      name = "q15",
      code = {
        local({
          raw <- getOption("ps3_cache_raw"); d <- getOption("ps3_cache_d"); if (is.null(raw)) { raw <- purrr::map_dfr(list.files("ps3_flights", pattern = "\\.dta$", full.names = TRUE), haven::read_dta); d <- lubridate::mdy(raw$flight_date); options(ps3_cache_raw = raw, ps3_cache_d = d) }
          t <- lubridate::mdy_hm(raw$sched_departure)
          testthat::expect_true(exists("flights.times"), info = "Save your answer as flights.times")
          testthat::expect_true(all(c("sched_dep", "dep_hour") %in% names(flights.times)),
                                info = "Need columns named sched_dep and dep_hour")
          testthat::expect_s3_class(flights.times$sched_dep, "POSIXct")
          testthat::expect_equal(format(flights.times$sched_dep, "%Y-%m-%d %H:%M"), format(t, "%Y-%m-%d %H:%M"))
          testthat::expect_equal(as.numeric(flights.times$dep_hour), as.numeric(lubridate::hour(t)))
        })
      }
    )
  )
)
