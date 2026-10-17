test <- list(
  name = "q10",
  cases = list(
    ottr::TestCase$new(
      name = "q10a",
      points = 1,
      hidden = FALSE,
      success_message = "compare_regions exists and returns difference_in_means output.",
      failure_message = "compare_regions should return the output of difference_in_means().",
      code = {
local({
    st <- as.data.frame(datasets::state.x77)
    colnames(st) <- c("population","income","illiteracy","life_exp","murder","hs_grad","frost","area")
    st$state <- rownames(st)
    st$region <- as.character(datasets::state.region)
    rownames(st) <- NULL
        testthat::expect_true(exists("compare_regions"))
        testthat::expect_true(is.function(compare_regions))
        testthat::expect_s3_class(compare_regions(st, "South", "West"), "difference_in_means")
    })
      }
    ),
    ottr::TestCase$new(
      name = "q10b",
      points = 1,
      hidden = FALSE,
      success_message = "Correct for South vs. West.",
      failure_message = "Check the murder rate comparison: region1 is condition1 and region2 is condition2.",
      code = {
local({
    st <- as.data.frame(datasets::state.x77)
    colnames(st) <- c("population","income","illiteracy","life_exp","murder","hs_grad","frost","area")
    st$state <- rownames(st)
    st$region <- as.character(datasets::state.region)
    rownames(st) <- NULL
        res <- compare_regions(st, "South", "West")
        exp <- estimatr::difference_in_means(murder ~ region, data = subset(st, region == "South" | region == "West"),
                                             condition1 = "South", condition2 = "West")
        testthat::expect_equal(as.numeric(res$coefficients), as.numeric(exp$coefficients))
        testthat::expect_equal(res$conf.low, exp$conf.low)
        testthat::expect_equal(res$conf.high, exp$conf.high)
    })
      }
    ),
    ottr::TestCase$new(
      name = "q10c",
      points = 1,
      hidden = FALSE,
      success_message = "Works for any two regions.",
      failure_message = "Your function should work for any two regions, so don't hard code South and West inside it.",
      code = {
local({
    st <- as.data.frame(datasets::state.x77)
    colnames(st) <- c("population","income","illiteracy","life_exp","murder","hs_grad","frost","area")
    st$state <- rownames(st)
    st$region <- as.character(datasets::state.region)
    rownames(st) <- NULL
        res <- compare_regions(st, "North Central", "Northeast")
        exp <- estimatr::difference_in_means(murder ~ region, data = subset(st, region == "North Central" | region == "Northeast"),
                                             condition1 = "North Central", condition2 = "Northeast")
        testthat::expect_equal(as.numeric(res$coefficients), as.numeric(exp$coefficients))
        testthat::expect_equal(res$conf.low, exp$conf.low)
        testthat::expect_equal(res$conf.high, exp$conf.high)
    })
      }
    ),
    ottr::TestCase$new(
      name = "q10d",
      points = 1,
      hidden = FALSE,
      success_message = "Order of regions is handled correctly.",
      failure_message = "Swapping region1 and region2 should flip the sign of the estimate.",
      code = {
local({
    st <- as.data.frame(datasets::state.x77)
    colnames(st) <- c("population","income","illiteracy","life_exp","murder","hs_grad","frost","area")
    st$state <- rownames(st)
    st$region <- as.character(datasets::state.region)
    rownames(st) <- NULL
        res <- compare_regions(data = st, region1 = "West", region2 = "South")
        exp <- estimatr::difference_in_means(murder ~ region, data = subset(st, region == "South" | region == "West"),
                                             condition1 = "West", condition2 = "South")
        testthat::expect_equal(as.numeric(res$coefficients), as.numeric(exp$coefficients))
    })
      }
    )
  )
)
