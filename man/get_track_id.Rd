% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ids.R
\name{get_track_id}
\alias{get_track_id}
\title{Returns an individual track's unique Spotify ID}
\usage{
get_track_id(track)
}
\arguments{
\item{track}{Track's name (quoted)}
}
\value{
A string of the track's unique Spotify ID
}
\description{
\code{get_track_id} communicates with the Spotify API to retrieve the unique identifier
for the selected track. This ID is necessary to access information related to a given
track in the Spotify API.
}
\examples{
get_track_id("rich spirit")

}
