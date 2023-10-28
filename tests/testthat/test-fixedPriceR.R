test_that("same currency works", {
  expect_equal(fixed_convert_currencies(c(1,2),"PLN","PLN"), c(1,2))
})


test_that("same currency works", {
  expect_equal(fixed_convert_currencies(c(1),"PLN","EUR",as.Date.character("2023-10-01")), 0.21642414)
})


