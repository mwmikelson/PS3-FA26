test = list(
  name = "q12",
  cases = list(
    ottr::TestCase$new(
      name = "q12",
      code = {
        local({
          raw <- readr::read_csv("ps3_bayarea_flights.csv", show_col_types = FALSE); d <- lubridate::mdy(raw$flight_date)
          testthat::expect_true(exists("flights.period"), info = "Save your answer as flights.period")
          testthat::expect_true("period" %in% names(flights.period), info = "The new column should be called period")
          exp <- dplyr::case_when(d < lubridate::ymd("2020-03-19") ~ "pre",
                                  d < lubridate::ymd("2021-06-15") ~ "during",
                                  TRUE ~ "post")
          testthat::expect_equal(nrow(flights.period), nrow(raw))
          testthat::expect_equal(as.character(flights.period$period), exp)
        })
      }
    )
  )
)
