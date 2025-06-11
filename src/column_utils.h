#ifndef VECTOR_UTILS_H
#define VECTOR_UTILS_H

#include <Rinternals.h>
#include <algorithm>
#include <cstring>  // for memcpy

inline SEXP resize_numeric_vector(SEXP original, int old_size, int new_size) {
  SEXP new_vec = PROTECT(Rf_allocVector(REALSXP, new_size));
  double* new_data = REAL(new_vec);

  std::fill_n(new_data, new_size, NA_REAL);

  if (original != R_NilValue && old_size > 0) {
    int copy_len = std::min(old_size, new_size);
    memcpy(new_data, REAL(original), copy_len * sizeof(double));
  }

  UNPROTECT(1);
  return new_vec;
}

inline SEXP resize_integer_vector(SEXP original, int old_size, int new_size) {
  SEXP new_vec = PROTECT(Rf_allocVector(INTSXP, new_size));
  int* new_data = INTEGER(new_vec);

  std::fill_n(new_data, new_size, NA_INTEGER);

  if (original != R_NilValue && old_size > 0) {
    int copy_len = std::min(old_size, new_size);
    memcpy(new_data, INTEGER(original), copy_len * sizeof(int));
  }

  UNPROTECT(1);
  return new_vec;
}

inline SEXP resize_character_vector(SEXP original, int old_size, int new_size) {
  SEXP new_vec = PROTECT(Rf_allocVector(STRSXP, new_size));

  for (int i = 0; i < new_size; ++i) {
    SET_STRING_ELT(new_vec, i, NA_STRING);
  }

  if (original != R_NilValue && old_size > 0) {
    int copy_len = std::min(old_size, new_size);
    for (int i = 0; i < copy_len; ++i) {
      SET_STRING_ELT(new_vec, i, STRING_ELT(original, i));
    }
  }

  UNPROTECT(1);
  return new_vec;
}

#endif // VECTOR_UTILS_H
