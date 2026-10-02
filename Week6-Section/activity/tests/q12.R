test = list(
  name = "q12",
  cases = list(
    ottr::TestCase$new(
      name = "q12.reg.table",
      failure_message = "q12.reg.table should be a team-by-home/away table for regular-season games only.",
      code = {
        testthat::expect_true(exists("q12.reg.table"))
        testthat::expect_true(inherits(q12.reg.table, "table"))
        expected <- c(81, 80, 81, 81, 81, 80, 80, 80, 80, 80, 80, 22, 80, 81, 80, 80, 81, 81, 80, 80, 81, 80, 80, 80, 22, 80)
        a <- as.vector(q12.reg.table); b <- as.vector(t(q12.reg.table))
        testthat::expect_true((length(a) == length(expected) && all(a == expected)) || (length(b) == length(expected) && all(b == expected)))
      }
    ),
    ottr::TestCase$new(
      name = "q12.po.table",
      failure_message = "q12.po.table should be a team-by-home/away table for playoff games only.",
      code = {
        testthat::expect_true(exists("q12.po.table"))
        testthat::expect_true(inherits(q12.po.table, "table"))
        expected <- c(14, 5, 7, 12, 10, 9, 4, 5, 6, 12, 1, 4, 23, 2, 3, 15, 11, 6, 0, 5, 5, 14, 1, 4)
        a <- as.vector(q12.po.table); b <- as.vector(t(q12.po.table))
        testthat::expect_true((length(a) == length(expected) && all(a == expected)) || (length(b) == length(expected) && all(b == expected)))
      }
    )
  )
)
