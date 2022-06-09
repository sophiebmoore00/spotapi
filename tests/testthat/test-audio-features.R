#example_track_audio_features <- track_audio_features("pyramids")
#usethis::use_data(example_track_audio_features, overwrite = TRUE)
test_that("track_audio_features works", {

  res <- track_audio_features("pyramids")
  expect_equal(example_track_audio_features, res)

})

#example_artist_audio_features <- artist_audio_features("frank ocean")
#usethis::use_data(example_artist_audio_features, overwrite = TRUE)
test_that("artist_audio_features works", {

  res <- artist_audio_features("frank ocean")
  expect_equal(example_artist_audio_features, res)

})
