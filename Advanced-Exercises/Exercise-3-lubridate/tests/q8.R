test = list(
  name = "q8",
  cases = list(
    ottr::TestCase$new(
      name = "q8",
      code = {
        local({
          raw <- readr::read_csv("ps3_bayarea_flights.csv", show_col_types = FALSE); d <- lubridate::mdy(raw$flight_date)
          start <- lubridate::ymd("2020-03-19")
          keep  <- d >= start & d <= start + lubridate::days(30)
          testthat::expect_true(exists("after.order"), info = "Save your answer as after.order")
          testthat::expect_true("date" %in% names(after.order), info = "Start from flights.dates so there is a date column")
          testthat::expect_equal(nrow(after.order), sum(keep))
          testthat::expect_equal(sort(after.order$date), sort(d[keep]))
        })
      }
    )
  )
)
