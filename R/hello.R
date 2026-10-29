#' hello_ralnor: example exported function
#'
#' A placeholder function demonstrating the roxygen2 doc + export pattern.
#' Replace or delete once you add real functions.
#'
#' @param name Character. Who to greet.
#' @return A greeting string.
#' @export
#' @examples
#' hello_ralnor("world")
hello_ralnor <- function(name = "world") {
  stopifnot(is.character(name), length(name) == 1)
  paste0("Hello, ", name, "!")
}
