test <- list(
  name = "q4",
  cases = list(
    ottr::TestCase$new(
      name = "q4a",
      points = 1,
      hidden = FALSE,
      success_message = "michigan_sentence exists and is text.",
      failure_message = "Save your answer as michigan_sentence.",
      code = {
        testthat::expect_true(exists("michigan_sentence"))
        testthat::expect_true(is.character(michigan_sentence))
      }
    ),
    ottr::TestCase$new(
      name = "q4b",
      points = 1,
      hidden = FALSE,
      success_message = "Correct!",
      failure_message = "Your sentence doesn't match. Make sure you are using Michigan's murder rate from the data, and your function from Question 3.",
      code = {
        testthat::expect_equal(michigan_sentence, "Michigan has a murder rate of 11.1 per 100,000 people.")
      }
    )
  )
)
