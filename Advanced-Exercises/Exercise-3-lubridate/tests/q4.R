test = list(
  name = "q4",
  cases = list(
    ottr::TestCase$new(
      name = "q4",
      code = {
        local({
          raw <- getOption("ps3_cache_raw"); d <- getOption("ps3_cache_d"); if (is.null(raw)) { raw <- purrr::map_dfr(list.files("ps3_flights", pattern = "\\.dta$", full.names = TRUE), haven::read_dta); d <- lubridate::mdy(raw$flight_date); options(ps3_cache_raw = raw, ps3_cache_d = d) }
          testthat::expect_true(exists("q4.flights"), info = "Save your answer as q4.flights")
          testthat::expect_true(all(c("year", "month", "day") %in% names(q4.flights)),
                                info = "Need columns named year, month, and day")
          testthat::expect_true(is.numeric(q4.flights$year) && is.numeric(q4.flights$month) && is.numeric(q4.flights$day),
                                info = "year, month, and day should be plain numbers (don't use label = TRUE)")
          testthat::expect_equal(as.numeric(q4.flights$year),  as.numeric(lubridate::year(d)))
          testthat::expect_equal(as.numeric(q4.flights$month), as.numeric(lubridate::month(d)))
          testthat::expect_equal(as.numeric(q4.flights$day),   as.numeric(lubridate::day(d)))
        })
      }
    )
  )
)
