## Reasons for release

Fixes to resolve one warning and one note from https://cran.r-project.org/web/checks/check_results_hipread.html

* Warning: Pass a string literal for the format argument of Rf_warning(), to 
  avoid -Wformat-security warning.
* Remove `SystemRequirements: C++11` from Description file to avoid note about 
  old C++ version.

## Test environments
* local Windows, R 4.3.2
* win builder release and devel
* MacOS (release), Windows (release), and Ubuntu (devel, release, old release) 
  via GitHub Actions

## R CMD check results

0 errors | 0 warnings | 0 notes

## Downstream dependencies
There is 1 downstream dependency and it is not affected by the update.
