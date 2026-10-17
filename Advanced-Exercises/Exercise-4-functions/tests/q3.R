test <- list(
  name = "q3",
  cases = list(
    ottr::TestCase$new(
      name = "q3a",
      points = 1,
      hidden = FALSE,
      success_message = "state_sentence exists and is a function.",
      failure_message = "Make sure you ran the cell that defines a function called state_sentence.",
      code = {
        testthat::expect_true(exists("state_sentence"))
        testthat::expect_true(is.function(state_sentence))
      }
    ),
    ottr::TestCase$new(
      name = "q3b",
      points = 1,
      hidden = FALSE,
      success_message = "Text matches exactly.",
      failure_message = "The text has to match exactly, including spaces and the period at the end. Compare your output to the example.",
      code = {
        testthat::expect_equal(state_sentence("Alabama", 15.1), "Alabama has a murder rate of 15.1 per 100,000 people.")
        testthat::expect_equal(state_sentence("Michigan", 11.1), "Michigan has a murder rate of 11.1 per 100,000 people.")
      }
    ),
    ottr::TestCase$new(
      name = "q3c",
      points = 1,
      hidden = FALSE,
      success_message = "Rounding works.",
      failure_message = "Remember to round the rate to one decimal place before putting it in the sentence.",
      code = {
        testthat::expect_equal(state_sentence("Utah", 3.456), "Utah has a murder rate of 3.5 per 100,000 people.")
      }
    )
  )
)
