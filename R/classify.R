#' Classify Cognitive Function Based on Total Scores
#'
#' This function classifies individuals into cognitive function groups based on their total cognition score,
#' which is calculated from immediate word recall, delayed word recall, serial subtraction, and backwards counting scores.
#' The classification creates three categories of cognitive function.
#'
#' @param data A dataframe containing cognitive test scores, including total immediate word recall, delayed word recall,
#'   serial subtraction, and backwards counting scores.
#'
#' @return A dataframe with:
#' \itemize{
#'   \item \code{Total_cog_score}: Total cognitive score (sum of all individual task scores).
#'   \item \code{Class}: Cognitive function classification (1 = Normal, 2 = Cognitive impairment no dementia, 3 = Demented).
#'   \item Renamed columns with updated labels for 2022 data: \code{imrc_imp2022}, \code{dlrc_imp2022},
#'   \code{ser7_imp2022}, \code{bwc20_imp2022}, \code{cogtot27_imp2022}, and \code{cogfunction2022}.
#' }
#'
#' @details
#' The function creates a total cognitive score by summing the scores for immediate word recall, delayed word recall,
#' serial subtraction, and backwards counting. It then classifies the cognitive function into three levels:
#' \itemize{
#'   \item Class 1: Normal (total score >= 12).
#'   \item Class 2: Cognitive impairment no dementia (total score between 7 and 11).
#'   \item Class 3: Demented (total score <= 6).
#' }
#'
#' @examples
#' # Assuming `cog_data` is a dataframe with the relevant columns
#' classified_data <- classify(cog_data_score)
#'
#' @importFrom dplyr mutate case_when rename across
#' @export
#'
classify <- function(data) {
  # Ensure the dataset contains the correct column names by comparing
  # to the output of score()
  expected_columns <- c(
    "HHID", "PN", "Total_I",
    "Total_D", "Total_Sub", "Total_Count")

  # Check if the columns in the data match the expected columns
  if (!all(expected_columns %in% names(data))) {
    stop("Please run score() first to ensure the correct data format.")
  }

  data |>
    # Calculate total cognition score by summing immediate recall, delayed recall, subtraction, and backwards counting scores
    dplyr::mutate(
      Total_cog_score = rowSums(dplyr::across(Total_I:Total_Count), na.rm = TRUE)) |>

      # Classify individuals into cognitive function groups based on their total cognition score
      dplyr::mutate(
        Class = dplyr::case_when(
        Total_cog_score >= 12 ~ 1,  # High cognitive function
        Total_cog_score <= 11 & Total_cog_score >= 7 ~ 2,  # Moderate cognitive function
        Total_cog_score <= 6 ~ 3  # Low cognitive function
      )) |>

      # Rename columns to reflect cognitive scores for 2022 data
      dplyr::rename(
        imrc_imp2022 = Total_I,        # Immediate recall score
        dlrc_imp2022 = Total_D,        # Delayed recall score
        ser7_imp2022 = Total_Sub,      # Serial subtraction score
        bwc20_imp2022 = Total_Count,   # Backwards counting score
        cogtot27_imp2022 = Total_cog_score,  # Total cognitive score
        cogfunction2022 = Class        # Cognitive function class
      )
}
