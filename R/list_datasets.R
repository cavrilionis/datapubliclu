#' Lists all available datasets
#'
#' @returns A tibble
#' @export
#'
#' @examples
#' df <- list_datasets()
list_datasets <- function() {
  base_url <- api_base_url()
  page <- 1
  url <- paste0(base_url, "/datasets/", "?page=", page, "&page_size=100")

  all_data <- tibble::tibble()

  response <- tryCatch({
    httr::GET(url, httr::add_headers("Accept" = "application/json"))
  }, error = function(e) {
    stop(paste("Error fetching URL:", url, "\n", e$message))
  })

  if (httr::http_type(response) != "application/json") {
    stop(
      paste0(
        "API did not return JSON. Status code: ",
        httr::status_code(response),
        ". Content type: ",
        httr::http_type(response)
      )
    )
  }

  content <- httr::content(response, "text", encoding = "UTF-8")
  data <- jsonlite::fromJSON(content)

  if (is.null(data) || is.null(data$total)) {
    stop("API response missing 'total' pages.")
  }

  total_pages <- data$total

  pb <- utils::txtProgressBar(min = 0, max = total_pages, initial = 0, style = 3)

  for (page in seq(1, total_pages)) {

    utils::setTxtProgressBar(pb, page)

    url <- paste0(base_url, "/datasets/", "?page=", page, "&page_size=100")

    response <- tryCatch({
      httr::GET(url, httr::add_headers("Accept" = "application/json"))
    }, error = function(e) {
      stop(paste("Error fetching URL:", url, "\n", e$message))
    })

    content <- httr::content(response, "text", encoding = "UTF-8")
    data <- jsonlite::fromJSON(content)

    if (is.list(data)) {
      data_df <- tibble::as_tibble(data$data)
    } else {
      stop("Unexpected data structure from API.")
    }

    all_data <- dplyr::bind_rows(all_data, data_df)
  }

  close(pb)

  return(all_data)
}
