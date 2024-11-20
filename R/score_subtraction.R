#' Score Serial Subtraction Task
#'
#' This function scores a serial subtraction task where respondents are scored based on
#' their ability to successfully subtract a specific value (e.g., 7) from the previous value.
#' A score of 1 is given for correct subtraction, and a score of 0 is given for incorrect
#' subtraction. However, a respondent can still receive a score of 1 if they recover
#' from an initial mistake by correctly subtracting later.
#'
#' @param val A numeric vector representing the respondent's current answer.
#' @param diff A numeric vector representing the correct difference (e.g., expected subtraction value).
#'
#' @return A numeric vector where:
#' \itemize{
#'   \item \code{1}: Correct subtraction.
#'   \item \code{0}: Incorrect subtraction.
#'   \item \code{NA}: If the original value is missing (NA), it remains NA.
#' }
#'
#' @details
#' The function checks if the respondent's answer (\code{val}) is equal to the correct subtraction
#' difference (\code{diff}). If so, they are awarded a score of 1. If they make a mistake, they get 0.
#' However, if they correct their mistake in the next step, they can receive a score of 1 for that step.
#' Missing values (NA) in the input remain as NA in the output.
#'
#' @examples
#' responses <- c(93, 86, 79, 72, NA)
#' correct_diffs <- c(93, 86, 79, 72, 65) - 7
#' score_subtraction(responses, correct_diffs)
#'
#' @export
#'
score_subtraction <- function(val, diff) {
  ifelse(is.na(val), NA, ifelse(val == diff, 1, 0))
}
