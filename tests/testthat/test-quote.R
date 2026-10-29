test_that("quote returns n quotes", {
  expect_length(get_quote(), 1)
  expect_length(quote(n = 3), 3)
})

test_that("quote filters by theme", {
  for (th in c("perseverance", "learning", "courage", "action")) {
    out <- get_quote(theme = th, n = 2)
    expect_length(out, 2)
  }
})

test_that("quote validates theme", {
  expect_error(get_quote(theme = "bogus"), "Unknown theme")
})

test_that("quote warns and truncates when n exceeds pool", {
  expect_warning(out <- get_quote(theme = "learning", n = 100), "returning all")
  expect_length(out, 3) # 3 learning quotes in db
})
