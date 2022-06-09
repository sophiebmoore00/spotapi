test_that("get_artist_id works", {
  expect_equal(get_artist_id("pitbull"), "0TnOYISbd1XYRBk9myaseg")
})

test_that("get_track_id works", {
  expect_equal(get_track_id("pyramids"), "4QhWbupniDd44EDtnh2bFJ")
})
