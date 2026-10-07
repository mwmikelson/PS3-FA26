test = list(
  name = "q4",
  cases = list(
    ottr::TestCase$new(
      name = "q4",
      code = {
        local({
          raw <- readr::read_csv("ps3_bayarea_flights.csv", show_col_types = FALSE); d <- lubridate::mdy(raw$flight_date)
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
