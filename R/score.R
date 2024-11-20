#' Calculate Cognitive Test Scores
#'
#' This function calculates various cognitive test scores from a dataset, including word recall,
#' serial subtraction, and backwards counting. It computes total scores for immediate and delayed word recall,
#' scores for serial subtraction tasks, and a total score for backwards counting.
#'
#' @param data A dataframe containing the cognitive test data, including columns for word recall,
#'   serial subtraction, and backwards counting tasks.
#'
#' @return A dataframe with the following computed scores:
#' \itemize{
#'   \item \code{Total_I}: Total score for immediate word recall.
#'   \item \code{Total_D}: Total score for delayed word recall.
#'   \item \code{Total_Sub}: Total score for serial subtraction.
#'   \item \code{Total_Count}: Total score for backwards counting.
#' }
#'
#' @details
#' The function applies scoring functions to the cognitive test data:
#' \itemize{
#'   \item Word recall: Scores immediate and delayed recall using the \code{score_recall} function, and computes total scores.
#'   \item Serial subtraction: Applies the \code{score_subtraction} function to calculate scores for each subtraction step, and computes the total score.
#'   \item Backwards counting: Assigns 2 points for correct counting on the first try, 1 point for correct counting on the second try, and 0 for incorrect counting.
#' }
#'
#' @examples
#' # Assuming `cog_data` is a dataframe with the relevant columns
#' scored_data <- score(cog_data)
#'
#' @importFrom dplyr mutate across case_when select starts_with
#' @export
#'
score <- function(data) {
  # Ensure the dataset contains the correct column names by comparing
  # to the output of extract()
  expected_columns <- c(
    "HHID", "PN",                                          # Identifiers
    "SD182M1", "SD182M2", "SD182M3", "SD182M4", "SD182M5", # Immediate recall
    "SD183M1", "SD183M2", "SD183M3", "SD183M4", "SD183M5", # Delayed recall
    "SD142", "SD143", "SD144", "SD145", "SD146",           # Serial subtraction
    "SD124", "SD129")                                      # Backwards counting

  # Check if the columns in the data match the expected columns
  if (!all(expected_columns %in% names(data))) {
    stop("Please run extract() first to ensure the correct data format.")
  }

  data |>
    dplyr::mutate(
      # Word recall --------------------------------------------------------------
      # Apply the score_recall function to immediate and delayed word recall columns
      dplyr::across(dplyr::starts_with("SD182M") | dplyr::starts_with("SD183M"), score_recall),

      # Creating total scores for immediate and delayed word recall
      Total_I = rowSums(across(starts_with("SD182M")), na.rm = TRUE),
      Total_D = rowSums(across(starts_with("SD183M")), na.rm = TRUE),

      # Serial subtraction -------------------------------------------------------
      # Apply the score_subtraction function for each subtraction step
      Sub_1 = score_subtraction(100 - SD142, 7),
      Sub_2 = score_subtraction(SD142 - SD143, 7),
      Sub_3 = score_subtraction(SD143 - SD144, 7),
      Sub_4 = score_subtraction(SD144 - SD145, 7),
      Sub_5 = score_subtraction(SD145 - SD146, 7),
      # Calculate the total score for serial subtraction
      Total_Sub = rowSums(across(Sub_1:Sub_5), na.rm = TRUE),

      # Backwards counting -------------------------------------------------------
      # Assign points based on backwards counting performance:
      # 2 points for correct on the first try (SD124), 1 point for correct on the second try (SD129), 0 otherwise
      Total_Count = dplyr::case_when(
        SD124 == 1 ~ 2,
        SD129 == 1 ~ 1,
        TRUE ~ 0)
    ) |>
    # Select key variables to return
    dplyr::select(HHID, PN, Total_I, Total_D, Total_Sub, Total_Count)
}
