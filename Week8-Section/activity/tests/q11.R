test = list(
  name = "q11",
  cases = list(
    ottr::TestCase$new(
      name = "q11",
      hidden = FALSE,
      points = 1,
      code = {
    truth <- estimatr::difference_in_means(substantive ~ treat, subset(clayton, issue == 'harassment' & country == 'United States'), condition1 = 'balanced', condition2 = 'quota')
    testthat::expect_equal(as.numeric(us.penalty$coefficients), as.numeric(truth$coefficients))
    testthat::expect_equal(as.numeric(us.penalty$std.error), as.numeric(truth$std.error))
    testthat::expect_equal(as.numeric(us.penalty$conf.low), as.numeric(truth$conf.low))
    testthat::expect_equal(as.numeric(us.penalty$conf.high), as.numeric(truth$conf.high))
    truth <- estimatr::difference_in_means(substantive ~ treat, subset(clayton, issue == 'harassment' & country == 'Mexico'), condition1 = 'balanced', condition2 = 'quota')
    testthat::expect_equal(as.numeric(mexico.penalty$coefficients), as.numeric(truth$coefficients))
    testthat::expect_equal(as.numeric(mexico.penalty$std.error), as.numeric(truth$std.error))
    testthat::expect_equal(as.numeric(mexico.penalty$conf.low), as.numeric(truth$conf.low))
    testthat::expect_equal(as.numeric(mexico.penalty$conf.high), as.numeric(truth$conf.high))
      }
    )
  )
)
