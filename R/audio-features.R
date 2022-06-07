#' Get all of an artist's tracks that are on Spotify
#'
#' @param artist Artist's name (quoted)
#'
#' @return A dataframe of an artist's entire Spotify discography
#'
#' @import dplyr
#' @import jsonlite
#' @import httr
#' @import spotifyr
#'
#' @export
get_artist_tracks <- function(artist) {

}

#' Get the audio features of a track
#'
#' @param track Track spotify id (quoted)
#'
#' @return A dataframe with the audio features of a single track
#'
#' @import dplyr
#' @import jsonlite
#' @import httr
#' @import spotifyr
#' @import glue
#'
#' @export
track_audio_features <- function(track_id) {

  url <- glue("https://api.spotify.com/v1/audio-features/{track_id}")

  prep_sys()
  token <- get_spotify_access_token()

  res <- GET(url, query = list(access_token = token, market = 'US'))
  dat <- fromJSON(rawToChar(res$content))

  results <- as.data.frame(dat)

  return(results)

}

#' Get the average audio features for an artist
#'
#' @param artist Artist's name (quoted)
#'
#' @return A dataframe of an artist's averages for audio feature metrics
#'
#' @import dplyr
#' @import jsonlite
#' @import httr
#' @import spotifyr
#'
#' @export
artist_audio_features <- function(artist) {

}
