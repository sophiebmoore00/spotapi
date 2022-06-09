#example_artist_charts <- artist_charts("drake")
#usethis::use_data(example_artist_charts, overwrite = TRUE)
test_that("artist_charts works", {

  res <- artist_charts("drake")
  expect_equal(example_artist_charts, res)

})
