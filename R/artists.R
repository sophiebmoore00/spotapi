#' Returns related artists
#'
#' @param artist artist's name (quoted)
#'
#' @return A dataframe of related artists
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

#' Returns an artist's 10 top songs on Spotify
#'
#' @param artist artist's name (quoted)
#'
#' @return A dataframe of the artist's top 10 songs on Spotify
#'
#' @import glue
#' @import jsonlite
#' @import httr
#' @import spotifyr
#'
#' @export
top_songs <- function(artist) {
  id <- get_artist_id(artist)
  url <- glue("https://api.spotify.com/v1/artists/{id}/top-tracks")

  prep_sys()
  token <- get_spotify_access_token()

  res <- GET(url, query = list(access_token = token, market = 'US'))
  dat <- fromJSON(rawToChar(res$content))

  results <- as.data.frame(dat$tracks$name)
  colnames(results) <- "Song"

  return(results)

}
