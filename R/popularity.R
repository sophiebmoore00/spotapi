#' Returns an artist's number of Billboard Top 100 songs since 1958
#'
#' \code{artist_charts} returns a dataframe of all the selected artist's songs that have made
#' the Billboard Top 100 from 1958—2021. Each row of the dataframe of a single instance of a track
#' making the Top 100. Variables include date, rank, song title, the full artist, the main artist(s),
#' features, peak rank on the chart, and the number of weeks the track spent on the charts.
#'
#' @param artist Artist's name (quoted)
#'
#' @return A dataframe of all the artist's songs that have made the Billboard Top 100
#'
#' @examples
#' artist_charts("kendrick lamar")
#'
#' @import glue
#' @import dplyr
#' @import stringr
#'
#' @export
artist_charts <- function(artist) {

  artist_str <- tolower(artist)
  results <- charts_data %>%
    filter(artist_1 == artist_str |
           artist_2 == artist_str |
           artist_3 == artist_str |
           features == artist_str)

  return(results)

}
