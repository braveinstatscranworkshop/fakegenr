
testthat::test_that(desc = "Expect the generate_fake_passenger function to work", code = {

  results <- generate_fake_passenger()

  testthat::expect_s3_class(
    object = results,
    class = "data.frame"
  )

  number_rows_tibble <- nrow(results)
  number_rows_to_expect <- 10

  testthat::expect_equal(
    object = number_rows_tibble,
    expected = number_rows_to_expect
  )

  testthat::expect_gt(
    object = number_rows_tibble,
    expected = 10
  )



})


testthat::test_that(desc = "Expect the generate_fake_compagnies to fail with invalid inputs", code = {

  testthat::skip_on_cran()

  testthat::expect_error(
    {
      generate_fake_compagnies("fefe")
    }
  )




})
