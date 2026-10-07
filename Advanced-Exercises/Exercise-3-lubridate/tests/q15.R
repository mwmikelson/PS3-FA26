test = list(
  name = "q15",
  cases = list(
    ottr::TestCase$new(
      name = "q15",
      code = {
        local({
          raw <- readr::read_csv("ps3_bayarea_flights.csv", show_col_types = FALSE); d <- lubridate::mdy(raw$flight_date)
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
