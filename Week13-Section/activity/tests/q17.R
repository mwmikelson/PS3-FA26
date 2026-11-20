test = list(
  name = "q17",
  cases = list(
    ottr::TestCase$new(
      name = "q17-1",
      code = {
        testthat::expect_equal(contig.joint, 0.063138383, tolerance = 1e-4)
        testthat::expect_equal(contig.other, 0.034884728, tolerance = 1e-4)
      },
      failure_message = "Not quite. Check your answer and try again."
    )
  )
)
