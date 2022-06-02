#' Returns related artists
#'
#' @param artist artist's name
#'
#' @import glue
#' @import jsonlite
#' @import httr
#' @import spotifyr
#'
#' @export
related_artists <- function(artist) {

  id <- get_artist_id(artist)
  url <- glue("https://api.spotify.com/v1/artists/{id}/related-artists")

  prep_sys()
  token <- get_spotify_access_token()

  res <- GET(url, query = list(access_token = token))
  dat <- fromJSON(rawToChar(res$content))

  results <- as.data.frame(dat$artists$name)
  colnames(results) <- "Artist"

  return(results)

}
