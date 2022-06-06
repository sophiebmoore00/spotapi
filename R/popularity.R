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
    filter(str_detect(.$artist, artist_str))

  return(results)

}
