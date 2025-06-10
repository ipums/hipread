# hipread 0.2.5
* Fixes problem with `hipread_list()` that caused a segfault in some situations.
* Require Rcpp >= 1.0.12 to avoid installation errors related to format string 
  security (see ipums/ipumsr#93).

# hipread 0.2.4
* Fixes for one warning and one note from CRAN checks

# hipread 0.2.3
* hipread now uses roxygen2 version 7.2.1.

# hipread 0.2.2
* hipread now uses roxygen2 version 7.1.0, which generates some additional 
  documentation for R6 classes.

# hipread 0.2.1
* progress bar will show by default even if readr hasn't been loaded (#12).

# hipread 0.2.0
* Added `yield` functions (`hipread_long_yield()` and `hipread_list_yield()`) which
  are another take on reading data in chunks that allow for more flexibility.

* Progress bar now ends at 100% instead of looking like the read was incomplete (#6)

* Several performance improvements

# hipread 0.1.1

* Fixes for platform-specific bugs revealed by CRAN checks (Solaris, UBSAN, Fedora)
