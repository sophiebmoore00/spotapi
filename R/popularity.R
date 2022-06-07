#' Returns an artist's number of Billboard Top 100 songs for a specified time period
#'
#' @param artist artist's name (quoted)
#'
#' @import glue
#' @import dplyr
#' @import stringr
#'
#' @export
artist_charts <- function(artist) {

  artist_str <- tolower(artist)
  results <- charts_data %>%
    filter(artist_1 == artist_str |
           artist_2 == artist_str |
           artist_3 == artist_str |
           features == artist_str)

  return(results)

}
