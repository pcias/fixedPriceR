# fixedPriceR
#
# This is a fix overlay on top of package priceR, that solves
# 1) issue when convert_currencies called with same currency
# 2) memoisation on disk for API saving
#
# You can learn more about package authoring with RStudio at:
#
#   http://r-pkgs.had.co.nz/
#
# Some useful keyboard shortcuts for package authoring:
#
#   Install Package:           'Cmd + Shift + B'
#   Check Package:             'Cmd + Shift + E'
#   Test Package:              'Cmd + Shift + T'

library(memoise)
library(purrr)
library(priceR)


#' fixed_convert_currencies
#' @export
#' @param price_start A vector of values in 'from' currency.
#' @param from A currency to convert from.
#' @param to A currency to convert to.
#' @param date A date for currency coversion.
#' @param floor_unit See priceR::convert_currencies
#' @returns A vector of values in 'to' currency
fixed_convert_currencies <- function(price_start,from, to, date = lubridate::today(), floor_unit = "day") {
  purrr::map_vec(price_start, \(x) ifelse(from!=to, convert_currencies(x, from, to, date, floor_unit), x))
}
