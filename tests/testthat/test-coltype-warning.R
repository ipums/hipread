test_that("bad column types generates warning", {
  expect_warning(
    hipread_long(
      hipread_example("test-basic.dat"),
      list(
        H = hip_fwf_widths(
          c(1, 3, 3, 3, 2),
          c("rt", "hhnum", "hh_char", "hh_dbl", "hh_impdbl"),
          # Misspecify hh_char as a double type
          c("character", "character", "double", "double", "double"),
          trim_ws = c(TRUE, FALSE, TRUE, NA, NA),
          imp_dec = c(NA, NA, NA, 0, 1)
        ),
        P = hip_fwf_widths(
          c(1, 3, 1, 3, 1),
          c("rt", "hhnum", "pernum", "per_dbl", "per_mix"),
          c("character", "character", "integer", "double", "character"),
          trim_ws = c(TRUE, FALSE, NA, NA, TRUE),
          imp_dec = c(NA, NA, NA, 0, NA)
        )
      ),
      hip_rt(1, 1)
    ),
    regexp = "could not convert"
  )
})
