#' Returns an artist's unique Spotify ID
#'
#' \code{get_artist_id} communicates with the Spotify API to retrieve the unique identifier
#' for the selected artist. This ID is necessary to access information related to a given
#' artist in the Spotify API.
#'
#' @param artist Artist's name (quoted)
#'
#' @return A string of the artist's unique Spotify ID
#'
#' @examples
#' get_artist_id("johnny cash")
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

#' Returns an individual track's unique Spotify ID
#'
#' \code{get_track_id} communicates with the Spotify API to retrieve the unique identifier
#' for the selected track. This ID is necessary to access information related to a given
#' track in the Spotify API.
#'
#' @param track Track's name (quoted)
#'
#' @return A string of the track's unique Spotify ID
#'
#' @examples
#' get_track_id("rich spirit")
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
