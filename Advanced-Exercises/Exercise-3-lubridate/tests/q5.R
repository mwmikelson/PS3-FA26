test = list(
  name = "q5",
  cases = list(
    ottr::TestCase$new(
      name = "q5",
      code = {
        local({
          raw <- readr::read_csv("ps3_bayarea_flights.csv", show_col_types = FALSE); d <- lubridate::mdy(raw$flight_date)
          testthat::expect_true(exists("flights.per.year"), info = "Save your answer as flights.per.year")
          testthat::expect_true(all(c("year", "flights") %in% names(flights.per.year)),
                                info = "Need columns named year and flights")
          exp <- dplyr::tibble(year = as.numeric(lubridate::year(d))) %>%
            dplyr::group_by(year) %>% dplyr::summarize(flights = dplyr::n())
          stu <- dplyr::tibble(year = as.numeric(flights.per.year$year),
                               flights = as.numeric(flights.per.year$flights))
          testthat::expect_equal(nrow(stu), nrow(exp))
          j <- dplyr::inner_join(exp, stu, by = "year", suffix = c(".exp", ".stu"))
          testthat::expect_equal(nrow(j), nrow(exp))
          testthat::expect_equal(as.numeric(j$flights.stu), as.numeric(j$flights.exp))
        })
      }
    )
  )
)
