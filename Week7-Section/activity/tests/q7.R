test = list(
  name = "q7",
  cases = list(
    ottr::TestCase$new(
      name = "q7.2023",
      failure_message = "q7.2023 should be the proportion of the 2023 shuffled gaps that are at least as large as the 2023 actual gap.",
      code = {
        testthat::expect_true(exists("q7.2023"))
        testthat::expect_true(is.numeric(q7.2023) && length(q7.2023) == 1)
        testthat::expect_true(q7.2023 >= 0 && q7.2023 <= 1, info = "A p-value is a probability between 0 and 1.")
        testthat::expect_true(abs(as.numeric(q7.2023) - 0.0544) < 0.01)
      }
    ),
    ottr::TestCase$new(
      name = "q7.2024",
      failure_message = "q7.2024 should be the proportion of the 2024 shuffled gaps that are at least as large as the 2024 actual gap.",
      code = {
        testthat::expect_true(exists("q7.2024"))
        testthat::expect_true(is.numeric(q7.2024) && length(q7.2024) == 1)
        testthat::expect_true(q7.2024 >= 0 && q7.2024 <= 1, info = "A p-value is a probability between 0 and 1.")
        testthat::expect_true(abs(as.numeric(q7.2024) - 0.0219) < 0.01)
      }
    ),
    ottr::TestCase$new(
      name = "q7.2025",
      failure_message = "q7.2025 should be the proportion of the 2025 shuffled gaps that are at least as large as the 2025 actual gap.",
      code = {
        testthat::expect_true(exists("q7.2025"))
        testthat::expect_true(is.numeric(q7.2025) && length(q7.2025) == 1)
        testthat::expect_true(q7.2025 >= 0 && q7.2025 <= 1, info = "A p-value is a probability between 0 and 1.")
        testthat::expect_true(abs(as.numeric(q7.2025) - 0.0355) < 0.01)
      }
    )
  )
)
