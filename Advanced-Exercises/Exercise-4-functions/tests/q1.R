test <- list(
  name = "q1",
  cases = list(
    ottr::TestCase$new(
      name = "q1a",
      points = 1,
      hidden = FALSE,
      success_message = "to_millions exists and is a function.",
      failure_message = "Make sure you ran the cell that defines a function called to_millions.",
      code = {
        testthat::expect_true(exists("to_millions"))
        testthat::expect_true(is.function(to_millions))
      }
    ),
    ottr::TestCase$new(
      name = "q1b",
      points = 1,
      hidden = FALSE,
      success_message = "Correct for single numbers.",
      failure_message = "Try to_millions(5000). It should return 5 (5,000 thousand = 5 million). Make sure you use return().",
      code = {
        testthat::expect_equal(to_millions(5000), 5)
        testthat::expect_equal(to_millions(250), 0.25)
      }
    ),
    ottr::TestCase$new(
      name = "q1c",
      points = 1,
      hidden = FALSE,
      success_message = "Works on a whole column too.",
      failure_message = "Your function should also work when the input is a whole column of numbers.",
      code = {
local({
    st <- as.data.frame(datasets::state.x77)
    colnames(st) <- c("population","income","illiteracy","life_exp","murder","hs_grad","frost","area")
    st$state <- rownames(st)
    st$region <- as.character(datasets::state.region)
    rownames(st) <- NULL
        testthat::expect_equal(to_millions(c(1000, 2500, 40000)), c(1, 2.5, 40))
        testthat::expect_equal(to_millions(st$population), st$population / 1000)
    })
      }
    )
  )
)
