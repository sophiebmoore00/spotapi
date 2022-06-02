#' Prepares your system to get an access token
#' *run this code in functions trying to access the api
prep_sys <- function(){
  id <- '9e2e5c1f98a04bed8b93827f57f33251'
  secret <- 'df848e02d56c4b689d5a5af453dc3904'
  Sys.setenv(SPOTIFY_CLIENT_ID = id)
  Sys.setenv(SPOTIFY_CLIENT_SECRET = secret)
}
