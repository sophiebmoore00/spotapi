#' Returns an artist's the unique spotify id
#'
#' @param artist artist's name (string)
#'
#' @import dplyr
#' @import stringr
#'
#' @export
get_artist_id <- function(artist){
  artist_str <- tolower(artist)
  id <- artist_id_data %>%
    filter(artist == artist_str) %>%
    pull(id)

  return(id)
}
