test <- list(
  name = "q8",
  cases = list(
    ottr::TestCase$new(
      name = "q8a",
      points = 1,
      hidden = FALSE,
      success_message = "south_report exists and has four lines.",
      failure_message = "Save your answer as south_report. It should have four lines of text.",
      code = {
        testthat::expect_true(exists("south_report"))
        testthat::expect_true(is.character(south_report))
        testthat::expect_equal(length(south_report), 4)
      }
    ),
    ottr::TestCase$new(
      name = "q8b",
      points = 1,
      hidden = FALSE,
      success_message = "Correct!",
      failure_message = "Make sure you give your function only the states in the South.",
      code = {
local({
    st <- as.data.frame(datasets::state.x77)
    colnames(st) <- c("population","income","illiteracy","life_exp","murder","hs_grad","frost","area")
    st$state <- rownames(st)
    st$region <- as.character(datasets::state.region)
    rownames(st) <- NULL
        d <- subset(st, region == "South")
        expected <- c(
          paste0("Average income: $", round(mean(d$income), 1)),
          paste0("Average illiteracy: ", round(mean(d$illiteracy), 1), "%"),
          paste0("Average life expectancy: ", round(mean(d$life_exp), 1), " years"),
          paste0("Average high school graduation rate: ", round(mean(d$hs_grad), 1), "%"))
        testthat::expect_equal(as.character(south_report), expected)
    })
      }
    )
  )
)
