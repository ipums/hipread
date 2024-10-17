library(hipread)

context("Read list")

test_that("basic example matches long format", {
  data_list <- hipread_list(
    hipread_example("test-basic.dat"),
    list(
      H = hip_fwf_widths(
        c(1, 3, 3, 3, 2),
        c("rt", "hhnum", "hh_char", "hh_dbl", "hh_impdbl"),
        c("character", "character", "character", "double", "double"),
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
  )

  data_long <- hipread_long(
    hipread_example("test-basic.dat"),
    list(
      H = hip_fwf_widths(
        c(1, 3, 3, 3, 2),
        c("rt", "hhnum", "hh_char", "hh_dbl", "hh_impdbl"),
        c("character", "character", "character", "double", "double"),
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
  )

  expect_equal(
    data_long[data_long$rt == "H", c("rt", "hhnum", "hh_char", "hh_dbl", "hh_impdbl")],
    data_list$H
  )
  expect_equal(
    data_long[data_long$rt == "P", c("rt","hhnum", "pernum", "per_dbl", "per_mix")],
    data_list$P
  )
})

test_that("Can read rectangular into a list", {
  actual <- hipread_list(
    hipread_example("test-basic.dat"),
    hip_fwf_widths(
      c(1, 2, 1),
      c("var1", "var2", "var3"),
      c("character", "character", "character")
    ),
    hip_rt(1, 0)
  )

  expect_true(is.list(actual))
  expect_equal(length(actual), 1)
  expect_equal(nrow(actual[[1]]), 9)
  expect_equal(ncol(actual[[1]]), 3)
  expect_equal(
    actual[[1]]$var1,
    c("H", "P", "P", "P", "H", "P", "P", "H", "P")
  )
})
