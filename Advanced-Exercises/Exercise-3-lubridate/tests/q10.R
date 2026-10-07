test = list(
  name = "q10",
  cases = list(
    ottr::TestCase$new(
      name = "q10",
      code = {
        local({
          raw <- getOption("ps3_cache_raw"); d <- getOption("ps3_cache_d"); if (is.null(raw)) { raw <- purrr::map_dfr(list.files("ps3_flights", pattern = "\\.dta$", full.names = TRUE), haven::read_dta); d <- lubridate::mdy(raw$flight_date); options(ps3_cache_raw = raw, ps3_cache_d = d) }
          testthat::expect_true(exists("monthly"), info = "Save your answer as monthly")
          testthat::expect_true(all(c("month_start", "flights") %in% names(monthly)),
                                info = "Need columns named month_start and flights")
          testthat::expect_s3_class(monthly$month_start, "Date")
          exp <- dplyr::tibble(month_start = lubridate::floor_date(d, "month")) %>%
            dplyr::group_by(month_start) %>% dplyr::summarize(flights = dplyr::n())
          testthat::expect_equal(nrow(monthly), nrow(exp))
          stu <- dplyr::tibble(month_start = monthly$month_start, flights = as.numeric(monthly$flights))
          j <- dplyr::inner_join(exp, stu, by = "month_start", suffix = c(".exp", ".stu"))
          testthat::expect_equal(nrow(j), nrow(exp), info = "month_start should be the first day of each month")
          testthat::expect_equal(as.numeric(j$flights.stu), as.numeric(j$flights.exp))
        })
      }
    )
  )
)
