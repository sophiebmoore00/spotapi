example_related_artists <- related_artists("frank ocean")
usethis::use_data(example_related_artists, overwrite = TRUE)
test_that("related_artists works", {

  res <- related_artists("frank ocean")
  expect_equal(example_related_artists, res)

})

example_top_songs <- top_songs("frank ocean")
usethis::use_data(example_top_songs, overwrite = TRUE)
test_that("top_songs works", {

  res <- top_songs("frank ocean")
  expect_equal(example_top_songs, res)

})
