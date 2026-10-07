test = list(
  name = "q9",
  cases = list(
    ottr::TestCase$new(
      name = "q9",
      code = {
        local({
          raw <- readr::read_csv("ps3_bayarea_flights.csv", show_col_types = FALSE); d <- lubridate::mdy(raw$flight_date)
          testthat::expect_true(exists("flights.order"), info = "Save your answer as flights.order")
          testthat::expect_true("days_since_order" %in% names(flights.order),
                                info = "The new column should be called days_since_order")
          testthat::expect_true(is.numeric(flights.order$days_since_order),
                                info = "Use as.numeric() to turn the time difference into a plain number")
          testthat::expect_equal(nrow(flights.order), nrow(raw))
          testthat::expect_equal(as.numeric(flights.order$days_since_order),
                                 as.numeric(d - lubridate::ymd("2020-03-19")))
        })
      }
    )
  )
)
