## Reason for release

* Replaced call to `Rf_error()` with `Rcpp::stop()` as suggested by Rcpp 
  developers (see issue #10).

## R CMD check results

0 errors | 0 warnings | 0 notes

## Downstream dependencies
There is one downstream dependency (ipumsr) and it is not affected by the update.
