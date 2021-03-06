% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/audio-features.R
\name{artist_audio_features}
\alias{artist_audio_features}
\title{Returns the average audio features for an artist's top songs}
\usage{
artist_audio_features(artist)
}
\arguments{
\item{artist}{Artist's name (quoted)}
}
\value{
A dataframe of an artist's averages for audio feature metrics
}
\description{
\code{artist_audio_features} communicates with the Spotify API to pull the audio features
of an artist's current top 10 songs on Spotify and averages these variables across all the songs
to provide an estimation of the artist's average for these audio features.
}
\examples{
artist_audio_features("amy winehouse")

}
