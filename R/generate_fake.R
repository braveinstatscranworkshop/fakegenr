

#' Title
#'
#' @param n_rows (int) number of rows to get
#'
#' @return a tibble
#' @export
#'

generate_fake_compagnies <- function(n_rows) {


  if (!is.numeric(n_rows)) {
    stop("n_rows must be an integer")
  }

  res <- httr::GET(
    url = glue::glue("https://fakerapi.it/api/v2/companies?_quantity={n_rows}")
  )

  res_list <- httr::content(res)

  data_field <- res_list$data

  data_field_tbl <- tibble::enframe(data_field)

  data_field_tbl <- dplyr::select(data_field_tbl, value)

  res_tbl <- tidyr::unnest_wider(
    data = data_field_tbl,
    col = value
  )

  res_tbl

}



#' Title
#'
#' @return tibble
#' @export
#'
#
generate_fake_passenger <- function() {

  file_path <- system.file("passenger_data.csv", package = "fakegenr")
  data <- read.csv(file_path)

  tibble::tibble(data)

}
