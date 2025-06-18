## Reason for release

Fix to resolve a note from CRAN checks: 
https://cran.r-project.org/web/checks/check_results_hipread.html

* Found non-API calls to R: ‘SETLENGTH’, ‘SET_TRUELENGTH’
  
  Compiled code should not call non-API entry points in R.

## Test environments

* local Windows, R 4.5.0
* win builder devel
* MacOS (release), Windows (release), and Ubuntu (devel, release, old release) 
  via GitHub Actions

## R CMD check results

0 errors | 0 warnings | 0 notes

## Downstream dependencies
There is one downstream dependency (ipumsr) and it is not affected by the update.
