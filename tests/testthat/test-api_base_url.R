
parsed_url <- httr::parse_url(api_base_url())

test_that("api_base_url() returns the correct URL", {
  expect_equal(api_base_url(), "https://data.public.lu/api/1")
})

test_that("api_base_url() returns the correct scheme", {
  scheme <- parsed_url$scheme
  expect_equal(scheme, "https")
})

test_that("api_base_url() returns the correct hostname", {
  hostname <- parsed_url$hostname
  expect_equal(hostname, "data.public.lu")
})

test_that("api_base_url() returns the correct path", {
  path <- parsed_url$path
  expect_equal(path, "api/1")
})
