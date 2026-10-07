test = list(
  name = "q3",
  cases = list(
    ottr::TestCase$new(
      name = "q3",
      code = {
        local({
          testthat::expect_true(exists("covid.dates"), info = "Save your answer as covid.dates")
          testthat::expect_s3_class(covid.dates, "Date")
          testthat::expect_equal(covid.dates, as.Date(c("2020-03-11", "2020-03-19", "2021-06-15")))
        })
      }
    )
  )
)
