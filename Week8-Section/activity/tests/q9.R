test = list(
  name = "q9",
  cases = list(
    ottr::TestCase$new(
      name = "q9",
      hidden = FALSE,
      points = 1,
      code = {
    u <- estimatr::difference_in_means(procedural ~ treat, subset(clayton, issue == 'harassment' & country == 'United States'), condition1 = 'all_male', condition2 = 'balanced')
    m <- estimatr::difference_in_means(procedural ~ treat, subset(clayton, issue == 'harassment' & country == 'Mexico'), condition1 = 'all_male', condition2 = 'balanced')
    ans <- if ((u$conf.high - u$conf.low) > (m$conf.high - m$conf.low)) "A" else "B"
    testthat::expect_true(toupper(q9) %in% c("A","B"))
    testthat::expect_equal(toupper(q9), ans)
      }
    )
  )
)
