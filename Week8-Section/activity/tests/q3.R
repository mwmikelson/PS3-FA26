test = list(
  name = "q3",
  cases = list(
    ottr::TestCase$new(
      name = "q3",
      hidden = FALSE,
      points = 1,
      code = {
    h <- estimatr::difference_in_means(procedural ~ treat, subset(clayton, issue == 'harassment'), condition1 = 'all_male', condition2 = 'balanced')
    a <- estimatr::difference_in_means(procedural ~ treat, subset(clayton, issue == 'animals'), condition1 = 'all_male', condition2 = 'balanced')
    ans <- if (h$coefficients > a$coefficients) "A" else "B"
    testthat::expect_true(toupper(q3) %in% c("A","B"))
    testthat::expect_equal(toupper(q3), ans)
      }
    )
  )
)
