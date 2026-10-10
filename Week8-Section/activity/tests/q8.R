test = list(
  name = "q8",
  cases = list(
    ottr::TestCase$new(
      name = "q8",
      hidden = FALSE,
      points = 1,
      code = {
    truth <- estimatr::difference_in_means(procedural ~ treat, subset(clayton, issue == 'harassment' & country == 'United States'), condition1 = 'all_male', condition2 = 'balanced')
    testthat::expect_equal(as.numeric(us.pessimistic), as.numeric(truth$conf.low))
    testthat::expect_equal(as.numeric(us.optimistic), as.numeric(truth$conf.high))
      }
    )
  )
)
