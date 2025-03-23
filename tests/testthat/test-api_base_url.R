
parsed_url <- httr::parse_url(api_base_url())

test_that("api_base_url returns the correct URL", {
  expect_equal(api_base_url(), "https://data.public.lu/api/1")
})

test_that("api_base_url returns the correct scheme", {
  scheme <- parsed_url$scheme
  expect_equal(scheme, "https")
})

test_that("api_base_url returns the correct hostname", {
  hostname <- parsed_url$hostname
  expect_equal(hostname, "data.public.lu")
})

test_that("api_base_url returns the correct path", {
  path <- parsed_url$path
  expect_equal(path, "api/1")
})

test_that("api_base_url returns a character vector", {
  expect_type(api_base_url(), "character")
})

test_that("api_base_url returns a vector of length 1", {
  expect_length(api_base_url(), 1)
})

test_that("api_base_url output is not null", {
  expect_false(is.null(api_base_url()))
})

test_that("api_base_url output is not NA", {
  expect_false(anyNA(api_base_url()))
})

test_that("api_base_url output is not empty", {
  expect_true(nchar(api_base_url()) > 0)
})

test_that("api_base_url is consistent", {
  expect_identical(api_base_url(), api_base_url())
  expect_identical(api_base_url(), "https://data.public.lu/api/1")
})
