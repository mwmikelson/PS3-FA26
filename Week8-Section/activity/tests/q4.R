test = list(
  name = "q4",
  cases = list(
    ottr::TestCase$new(
      name = "q4",
      hidden = FALSE,
      points = 1,
      code = {
    truth <- estimatr::difference_in_means(procedural ~ treat, subset(clayton, issue == 'harassment' & country == 'United States'), condition1 = 'all_male', condition2 = 'balanced')
    testthat::expect_equal(as.numeric(us.dim$coefficients), as.numeric(truth$coefficients))
    testthat::expect_equal(as.numeric(us.dim$std.error), as.numeric(truth$std.error))
    testthat::expect_equal(as.numeric(us.dim$conf.low), as.numeric(truth$conf.low))
    testthat::expect_equal(as.numeric(us.dim$conf.high), as.numeric(truth$conf.high))
      }
    )
  )
)
