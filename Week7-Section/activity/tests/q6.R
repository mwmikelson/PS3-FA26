library(testthat)

test = list(
  name = "q6",
  cases = list(
    ottr::TestCase$new(
      hidden = FALSE,
      name = NA,
      points = 1,
      code = {
        test_that("q6", {
          expect_equal(q6.2023, mean(shuffled.2023 >= actual.2023))
          expect_equal(q6.2024, mean(shuffled.2024 >= actual.2024))
          expect_equal(q6.2025, mean(shuffled.2025 >= actual.2025))
        })
      }
    )
  )
)
