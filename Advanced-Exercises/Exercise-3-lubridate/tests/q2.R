test = list(
  name = "q2",
  cases = list(
    ottr::TestCase$new(
      name = "q2: new column",
      code = {
        local({
          raw <- readr::read_csv("ps3_bayarea_flights.csv", show_col_types = FALSE); d <- lubridate::mdy(raw$flight_date)
          testthat::expect_true(exists("q2.flights"), info = "Save your answer as q2.flights")
          testthat::expect_true(is.data.frame(q2.flights))
          testthat::expect_true("date" %in% names(q2.flights), info = "The new column should be called date")
          testthat::expect_true("flight_date" %in% names(q2.flights), info = "Keep the original columns too")
          testthat::expect_equal(nrow(q2.flights), nrow(raw))
        })
      }
    ),
    ottr::TestCase$new(
      name = "q2: real dates",
      code = {
        local({
          raw <- readr::read_csv("ps3_bayarea_flights.csv", show_col_types = FALSE); d <- lubridate::mdy(raw$flight_date)
          testthat::expect_s3_class(q2.flights$date, "Date")
          testthat::expect_equal(q2.flights$date, d)
        })
      }
    )
  )
)
