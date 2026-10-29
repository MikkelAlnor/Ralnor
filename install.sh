#!/usr/bin/env bash
# Install the RAlnor package and its development dependencies.
# Usage: ./install.sh [--deps-only | --no-deps]
set -euo pipefail

cd "$(dirname "$0")"

DEPS_ONLY=0
SKIP_DEPS=0
for arg in "$@"; do
  case "$arg" in
    --deps-only) DEPS_ONLY=1 ;;
    --no-deps)   SKIP_DEPS=1 ;;
    *) echo "Unknown option: $arg"; echo "Usage: $0 [--deps-only | --no-deps]"; exit 1 ;;
  esac
done

Rscript - <<'RS'
deps_only <- "--deps-only" %in% commandArgs(TRUE)
skip_deps <- "--no-deps" %in% commandArgs(TRUE)

needed <- function(p) !requireNamespace(p, quietly = TRUE)

# Core dev dependencies
if (!skip_deps) {
  core <- c("roxygen2", "testthat")
  missing <- Filter(needed, core)
  if (length(missing)) {
    message("Installing: ", paste(missing, collapse = ", "))
    install.packages(missing, repos = "https://cloud.r-project.org")
  } else {
    message("Core dependencies already installed.")
  }

  # devtools is optional but recommended
  if (needed("devtools")) {
    message("Optionally installing devtools (skip with --no-deps)...")
    try(install.packages("devtools", repos = "https://cloud.r-project.org"), silent = TRUE)
  }
}

if (deps_only) {
  message("Dependencies installed. Skipping package install.")
} else {
  message("Installing RAlnor...")
  install.packages(
    ".",
    repos = NULL,
    type = "source",
    INSTALL_opts = "--with-keep.source"
  )
  # Verify
  stopifnot(requireNamespace("RAlnor", quietly = TRUE))
  message("RAlnor installed successfully: ",
          as.character(packageVersion("RAlnor")))
}
RS
