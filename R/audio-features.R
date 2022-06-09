#' Get the audio features of a track
#'
#' @param track Track name (quoted)
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

  top_songs <- top_songs(artist)
  full <- data.frame()

  #save the audio features for each track
  for (i in 1:nrow(top_songs)) {
    step <- track_audio_features(top_songs[i,])
    full <- rbind(full, step)
  }

  #find the averages
  avgs <- full %>%
    select(-id) %>%
    summarise(across(everything(), mean))

  return(avgs)

}
