test <- list(
  name = "q11",
  cases = list(
    ottr::TestCase$new(
      name = "q11a",
      points = 1,
      hidden = FALSE,
      success_message = "south_vs_west exists.",
      failure_message = "Save your answer as south_vs_west. It should be the output of compare_regions.",
      code = {
        testthat::expect_true(exists("south_vs_west"))
        testthat::expect_s3_class(south_vs_west, "difference_in_means")
      }
    ),
    ottr::TestCase$new(
      name = "q11b",
      points = 1,
      hidden = FALSE,
      success_message = "Correct!",
      failure_message = "Make sure you compare South (region1) to West (region2) using all of the states data.",
      code = {
local({
    st <- as.data.frame(datasets::state.x77)
    colnames(st) <- c("population","income","illiteracy","life_exp","murder","hs_grad","frost","area")
    st$state <- rownames(st)
    st$region <- as.character(datasets::state.region)
    rownames(st) <- NULL
        exp <- estimatr::difference_in_means(murder ~ region, data = subset(st, region == "South" | region == "West"),
                                             condition1 = "South", condition2 = "West")
        testthat::expect_equal(as.numeric(south_vs_west$coefficients), as.numeric(exp$coefficients))
        testthat::expect_equal(south_vs_west$conf.low, exp$conf.low)
        testthat::expect_equal(south_vs_west$conf.high, exp$conf.high)
    })
      }
    )
  )
)
