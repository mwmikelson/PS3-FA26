test = list(
  name = "q6",
  cases = list(
    ottr::TestCase$new(
      name = "q6",
      code = {
        local({
          raw <- getOption("ps3_cache_raw"); d <- getOption("ps3_cache_d"); if (is.null(raw)) { raw <- purrr::map_dfr(list.files("ps3_flights", pattern = "\\.dta$", full.names = TRUE), haven::read_dta); d <- lubridate::mdy(raw$flight_date); options(ps3_cache_raw = raw, ps3_cache_d = d) }
          testthat::expect_true(exists("weekday.counts"), info = "Save your answer as weekday.counts")
          testthat::expect_true(all(c("weekday", "flights") %in% names(weekday.counts)),
                                info = "Need columns named weekday and flights")
          testthat::expect_equal(nrow(weekday.counts), 7)
          exp <- dplyr::tibble(weekday = substr(as.character(lubridate::wday(d, label = TRUE)), 1, 3)) %>%
            dplyr::group_by(weekday) %>% dplyr::summarize(flights = dplyr::n())
          stu <- dplyr::tibble(weekday = substr(as.character(weekday.counts$weekday), 1, 3),
                               flights = as.numeric(weekday.counts$flights))
          j <- dplyr::inner_join(exp, stu, by = "weekday", suffix = c(".exp", ".stu"))
          testthat::expect_equal(nrow(j), 7, info = "weekday should hold day names (use label = TRUE)")
          testthat::expect_equal(as.numeric(j$flights.stu), as.numeric(j$flights.exp))
        })
      }
    )
  )
)
