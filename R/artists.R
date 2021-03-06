#' Returns related artists
#'
#' \code{related_artists} communicates with the Spotify API to return 20 artists that are
#' related to the selected artist.
#'
#' @param artist Artist's name (quoted)
#'
#' @return A dataframe of related artists
#'
#' @examples
#' related_artists("pitbull")
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

#' Returns an artist's top songs on Spotify
#'
#' \code{top_songs} communicates with the Spotify API to return the artist's current
#' 10 top songs on Spotify.
#'
#' @param artist Artist's name (quoted)
#'
#' @return A dataframe of the artist's top 10 songs on Spotify
#'
#' @examples
#' top_songs("bruno mars")
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

  results <- as.data.frame(cbind(dat$tracks$name, dat$tracks$duration_ms/1000, dat$tracks$popularity))
  colnames(results) <- c("Song", "Duration", "Popularity")

  return(results)

}
