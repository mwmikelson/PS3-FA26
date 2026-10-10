test = list(
  name = "q12",
  cases = list(
    ottr::TestCase$new(
      name = "q12",
      hidden = FALSE,
      points = 1,
      code = {
    u <- estimatr::difference_in_means(substantive ~ treat, subset(clayton, issue == 'harassment' & country == 'United States'), condition1 = 'balanced', condition2 = 'quota')
    m <- estimatr::difference_in_means(substantive ~ treat, subset(clayton, issue == 'harassment' & country == 'Mexico'), condition1 = 'balanced', condition2 = 'quota')
    u0 <- u$conf.low < 0 & u$conf.high > 0
    m0 <- m$conf.low < 0 & m$conf.high > 0
    ans <- if (u0 & m0) "C" else if (u0) "A" else if (m0) "B" else "D"
    testthat::expect_true(toupper(q12) %in% c("A","B","C","D"))
    testthat::expect_equal(toupper(q12), ans)
      }
    )
  )
)
