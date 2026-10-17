test <- list(
  name = "q7",
  cases = list(
    ottr::TestCase$new(
      name = "q7a",
      points = 1,
      hidden = FALSE,
      success_message = "mean_report exists and returns four lines of text.",
      failure_message = "mean_report should return four pieces of text, one for each column.",
      code = {
local({
    st <- as.data.frame(datasets::state.x77)
    colnames(st) <- c("population","income","illiteracy","life_exp","murder","hs_grad","frost","area")
    st$state <- rownames(st)
    st$region <- as.character(datasets::state.region)
    rownames(st) <- NULL
        testthat::expect_true(exists("mean_report"))
        testthat::expect_true(is.function(mean_report))
        testthat::expect_true(is.character(mean_report(st)))
        testthat::expect_equal(length(mean_report(st)), 4)
    })
      }
    ),
    ottr::TestCase$new(
      name = "q7b",
      points = 1,
      hidden = FALSE,
      success_message = "Output matches for all 50 states.",
      failure_message = "Compare your output on the full data to the example in the question. The text must match exactly.",
      code = {
local({
    st <- as.data.frame(datasets::state.x77)
    colnames(st) <- c("population","income","illiteracy","life_exp","murder","hs_grad","frost","area")
    st$state <- rownames(st)
    st$region <- as.character(datasets::state.region)
    rownames(st) <- NULL
        testthat::expect_equal(as.character(mean_report(st)), c(
          "Average income: $4435.8",
          "Average illiteracy: 1.2%",
          "Average life expectancy: 70.9 years",
          "Average high school graduation rate: 53.1%"))
    })
      }
    ),
    ottr::TestCase$new(
      name = "q7c",
      points = 1,
      hidden = FALSE,
      success_message = "Works on subsets of the data.",
      failure_message = "Your function should work on any data frame you give it, such as subset(states, region == \"South\"). Make sure you use the input of your function, not the states data frame, inside it.",
      code = {
local({
    st <- as.data.frame(datasets::state.x77)
    colnames(st) <- c("population","income","illiteracy","life_exp","murder","hs_grad","frost","area")
    st$state <- rownames(st)
    st$region <- as.character(datasets::state.region)
    rownames(st) <- NULL
        for (r in c("South", "West", "North Central", "Northeast")) {
          d <- subset(st, region == r)
          expected <- c(
            paste0("Average income: $", round(mean(d$income), 1)),
            paste0("Average illiteracy: ", round(mean(d$illiteracy), 1), "%"),
            paste0("Average life expectancy: ", round(mean(d$life_exp), 1), " years"),
            paste0("Average high school graduation rate: ", round(mean(d$hs_grad), 1), "%"))
          testthat::expect_equal(as.character(mean_report(d)), expected)
        }
    })
      }
    ),
    ottr::TestCase$new(
      name = "q7d",
      points = 1,
      hidden = FALSE,
      success_message = "Works on a brand new data frame.",
      failure_message = "Your function should work on any data frame with these four columns, so don't use the states data frame inside your function.",
      code = {
        tiny <- data.frame(income = c(100, 200), illiteracy = c(1, 2), life_exp = c(70, 80), hs_grad = c(50, 60))
        testthat::expect_equal(as.character(mean_report(tiny)), c(
          "Average income: $150",
          "Average illiteracy: 1.5%",
          "Average life expectancy: 75 years",
          "Average high school graduation rate: 55%"))
      }
    )
  )
)
