#' quote: get an inspirational quote
#'
#' Returns a random inspirational quote. Optionally filtered by theme.
#'
#' @param theme Character. Optional theme to filter by. One of
#'   "perseverance", "learning", "courage", "action", or NULL (default)
#'   for quotes from any theme.
#' @param n Integer. Number of quotes to return. Default 1.
#' @return A character vector of quotes.
#' @export
#' @examples
#' quote()
#' quote(theme = "perseverance")
#' quote(n = 3)
quote <- function(theme = NULL, n = 1) {
  themes <- c("perseverance", "learning", "courage", "action")

  if (!is.null(theme)) {
    if (!theme %in% themes) {
      stop(
        "Unknown theme: '", theme, "'. ",
        "Valid themes: ", paste(themes, collapse = ", ")
      )
    }
    pool <- quotes_db[quotes_db$theme == theme, ]
  } else {
    pool <- quotes_db
  }

  if (n > nrow(pool)) {
    warning("Only ", nrow(pool), " quotes available; returning all of them.")
    n <- nrow(pool)
  }

  sample(pool$quote, n)
}

# Internal quote database
quotes_db <- data.frame(
  quote = c(
    "It always seems impossible until it's done. - Nelson Mandela",
    "Fall seven times, stand up eight. - Japanese proverb",
    "The only way out is through. - Robert Frost",
    "Perseverance is not a long race; it is many short races one after the other. - Walter Elliot",
    "Live as if you were to die tomorrow. Learn as if you were to live forever. - Mahatma Gandhi",
    "The beautiful thing about learning is that no one can take it away from you. - B.B. King",
    "Tell me and I forget. Teach me and I remember. Involve me and I learn. - Benjamin Franklin",
    "Courage is not the absence of fear, but the triumph over it. - Nelson Mandela",
    "You miss 100% of the shots you don't take. - Wayne Gretzky",
    "Do one thing every day that scares you. - Eleanor Roosevelt",
    "The best way to get something done is to begin. - Unknown",
    "Well done is better than well said. - Benjamin Franklin",
    "Action is the foundational key to all success. - Pablo Picasso"
  ),
  theme = c(
    "perseverance", "perseverance", "perseverance", "perseverance",
    "learning", "learning", "learning",
    "courage", "courage", "courage",
    "action", "action", "action"
  ),
  stringsAsFactors = FALSE
)
