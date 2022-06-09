#' Returns the audio features of a track
#'
#' \code{track_audio_features} communicates with the Spotify API to pull audio features for
#' the selected track. Variables include multiple characteristics of tracks, including
#' danceability, energy, key, acousticness, and more.
#'
#' @param track Track name (quoted)
#'
#' @return A dataframe with the audio features of a single track
#'
#' @example
#' track_audio_features("hotline bling")
#'
#' @import dplyr
#' @import jsonlite
#' @import httr
#' @import spotifyr
#' @import glue
#'
#' @export
track_audio_features <- function(track) {

  id <- get_track_id(track)
  url <- glue("https://api.spotify.com/v1/audio-features/{id}")

  prep_sys()
  token <- get_spotify_access_token()

  res <- GET(url, query = list(access_token = token, market = 'US'))
  dat <- fromJSON(rawToChar(res$content))

  results <- as.data.frame(dat)
  results <- select(results, -type, -uri, -track_href, -analysis_url)

  return(results)

}

#' Returns the average audio features for an artist's top songs
#'
#' \code{artist_audio_features} communicates with the Spotify API to pull the audio features
#' of an artist's current top 10 songs on Spotify and averages these variables across all the songs
#' to provide an estimation of the artist's average for these audio features.
#'
#' @param artist Artist's name (quoted)
#'
#' @return A dataframe of an artist's averages for audio feature metrics
#'
#' @example
#' artist_audio_features("amy winehouse")
#'
#' @import dplyr
#' @import jsonlite
#' @import httr
#'
#' @export
artist_audio_features <- function(artist) {

  top_songs <- top_songs(artist) #save the artist's top 10 songs
  full <- data.frame()

  #save the audio features for each track
  for (i in 1:nrow(top_songs)) {
    step <- track_audio_features(top_songs[i, 1])
    full <- rbind(full, step)
  }

  #find the averages
  avgs <- full %>%
    select(-id) %>%
    summarise(across(everything(), mean))

  return(avgs)

}
