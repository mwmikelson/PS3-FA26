test = list(
  name = "q5",
  cases = list(
    ottr::TestCase$new(
      name = "q5",
      code = {
        local({
          raw <- getOption("ps3_cache_raw"); d <- getOption("ps3_cache_d"); if (is.null(raw)) { raw <- purrr::map_dfr(list.files("ps3_flights", pattern = "\\.dta$", full.names = TRUE), haven::read_dta); d <- lubridate::mdy(raw$flight_date); options(ps3_cache_raw = raw, ps3_cache_d = d) }
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
