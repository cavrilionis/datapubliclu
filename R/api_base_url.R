#' Retrieve the Base URL for the data.public.lu API
#'
#' This function returns the base URL used to access the data.public.lu open data API.
#' It provides a consistent and easily accessible way to construct API requests.
#'
#' @return A character string representing the base URL of the data.public.lu API.
#' @export
#'
#' @examples
#' # Obtain the base URL for the API.
#' base_url <- api_base_url()
#' print(base_url)
#'
#' # Construct a full API request for a specific endpoint (example).
#' endpoint <- "datasets"
#' full_url <- paste0(api_base_url(), "/", endpoint)
#' print(full_url)
api_base_url <- function() {
  return("https://data.public.lu/api/1")
}
