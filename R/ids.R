#' Returns an artist's the unique spotify id
#'
#' @param artist artist's name (string)
#'
#' @import dplyr
#' @import stringr
#'
#' @export
get_artist_id <- function(artist){

  url <- "https://api.spotify.com/v1/search"
  prep_sys()
  token <- get_spotify_access_token()

  res <- GET(url, query = list(q = artist,
                               type = 'artist',
                               market = 'ES',
                               limit = 1,
                               offset = 0,
                               access_token = token))

  dat <- fromJSON(rawToChar(res$content))
  id <- dat$artists$items$id

  return(id)
}

#' Returns unique track ID
#'
#' @param track track's name (quoted)
#'
#' @return The spotify ID
#'
#' @import glue
#' @import jsonlite
#' @import httr
#' @import spotifyr
#'
#' @export
get_track_id <- function(track) {

  url <- "https://api.spotify.com/v1/search"
  prep_sys()
  token <- get_spotify_access_token()

  res <- GET(url, query = list(q = track,
                               type = 'track',
                               market = 'ES',
                               limit = 1,
                               offset = 0,
                               access_token = token))

  dat <- fromJSON(rawToChar(res$content))
  id <- dat$tracks$items$id

  return(id)

}
