test = list(
  name = "q2",
  cases = list(
    ottr::TestCase$new(
      name = "q2",
      hidden = FALSE,
      points = 1,
      code = {
    truth <- estimatr::difference_in_means(procedural ~ treat, subset(clayton, issue == 'animals'), condition1 = 'all_male', condition2 = 'balanced')
    testthat::expect_equal(as.numeric(animal.dim$coefficients), as.numeric(truth$coefficients))
    testthat::expect_equal(as.numeric(animal.dim$std.error), as.numeric(truth$std.error))
    testthat::expect_equal(as.numeric(animal.dim$conf.low), as.numeric(truth$conf.low))
    testthat::expect_equal(as.numeric(animal.dim$conf.high), as.numeric(truth$conf.high))
      }
    )
  )
)
