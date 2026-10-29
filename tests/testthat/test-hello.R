test_that("hello_ralnor greets correctly", {
  expect_equal(hello_ralnor(), "Hello, world!")
  expect_equal(hello_ralnor("R"), "Hello, R!")
})

test_that("hello_ralnor validates input", {
  expect_error(hello_ralnor(1))
  expect_error(hello_ralnor(c("a", "b")))
})
