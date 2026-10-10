test = list(
  name = "q5",
  cases = list(
    ottr::TestCase$new(
      name = "q5",
      hidden = FALSE,
      points = 1,
      code = {
    truth <- estimatr::difference_in_means(procedural ~ treat, subset(clayton, issue == 'harassment' & country == 'Mexico'), condition1 = 'all_male', condition2 = 'balanced')
    testthat::expect_equal(as.numeric(mexico.dim$coefficients), as.numeric(truth$coefficients))
    testthat::expect_equal(as.numeric(mexico.dim$std.error), as.numeric(truth$std.error))
    testthat::expect_equal(as.numeric(mexico.dim$conf.low), as.numeric(truth$conf.low))
    testthat::expect_equal(as.numeric(mexico.dim$conf.high), as.numeric(truth$conf.high))
      }
    )
  )
)
