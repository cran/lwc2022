#' Extract Key Cognitive Measures from Dataset
#'
#' This function extracts specific cognitive measures from a dataset, including immediate
#' and delayed word recall, serial subtraction, and backwards counting, along with household
#' and person identifiers.
#'
#' @param data A dataframe containing the full dataset from which specific variables will be selected.
#'
#' @return A dataframe with the following variables:
#' \itemize{
#'   \item \code{HHID}: Household ID.
#'   \item \code{PN}: Person number (individual identifier).
#'   \item Immediate and delayed word recall variables (columns starting with \code{"SD182M"} and \code{"SD183M"}).
#'   \item Serial subtraction variables (\code{SD142} to \code{SD146}).
#'   \item Backwards counting variables (\code{SD124}, \code{SD129}).
#' }
#'
#' @details
#' The function selects key cognitive test results and identifiers from the dataset.
#' It uses \code{dplyr::select()} to retrieve:
#' \itemize{
#'   \item Immediate and delayed word recall variables (those starting with "SD182M" and "SD183M").
#'   \item Serial subtraction results (\code{SD142} to \code{SD146}).
#'   \item Backwards counting variables (\code{SD124}, \code{SD129}).
#' }
#'
#' @examples
#' # Assuming `cog_data` is a dataframe with the relevant columns
#' extract(cog_data)
#'
#' @importFrom dplyr select starts_with
#' @export
#'
extract <- function(data){
  data |>
    dplyr::select(
      # Identifiers: Household ID (HHID) and Person number (PN)
      HHID, PN,
      # Immediate and delayed word recall (columns starting with "SD182M" and "SD183M")
      dplyr::starts_with("SD182M"), dplyr::starts_with("SD183M"),
      # Serial subtraction: Variables SD142 to SD146
      SD142:SD146,
      # Backwards counting: Variables SD124 and SD129
      SD124, SD129
    )
}
