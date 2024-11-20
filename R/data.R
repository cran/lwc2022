#' Cognition Data
#'
#' @description A simulated dataset with cognition test scores, following the same methodology as the Health and Retirement Study (HRS).
#' The dataset includes immediate word recall, delayed word recall, serial subtraction, backwards counting tasks, and mouse click clicking
#' with scores representing cognitive performance on these tests.
#'
#' @format A dataframe with 10 rows and 35 variables:
#' \describe{
#'   \item{HHID}{Household identifier, a unique 6-digit integer.}
#'   \item{PN}{Person number, a unique 1- or 2-digit integer within each household.}
#'
#'   \item{SD182M1}{Immediate word recall test score for the first word.}
#'   \item{SD182M2}{Immediate word recall test score for the second word.}
#'   \item{SD182M3}{Immediate word recall test score for the third word.}
#'   \item{SD182M4}{Immediate word recall test score for the fourth word.}
#'   \item{SD182M5}{Immediate word recall test score for the fifth word.}
#'   \item{SD182M6}{Immediate word recall test score for the sixth word.}
#'   \item{SD182M7}{Immediate word recall test score for the seventh word.}
#'   \item{SD182M8}{Immediate word recall test score for the eight word.}
#'   \item{SD182M9}{Immediate word recall test score for the ninth word.}
#'   \item{SD182M10}{Immediate word recall test score for the tenth word.}
#'
#'   \item{SD183M1}{Delayed word recall test score for the first word.}
#'   \item{SD183M2}{Delayed word recall test score for the second word.}
#'   \item{SD183M3}{Delayed word recall test score for the third word.}
#'   \item{SD183M4}{Delayed word recall test score for the fourth word.}
#'   \item{SD183M5}{Delayed word recall test score for the fifth word.}
#'   \item{SD183M6}{Delayed word recall test score for the sixth word.}
#'   \item{SD183M7}{Delayed word recall test score for the seventh word.}
#'   \item{SD183M8}{Delayed word recall test score for the eight word.}
#'   \item{SD183M9}{Delayed word recall test score for the ninth word.}
#'   \item{SD183M10}{Delayed word recall test score for the tenth word.}
#'
#'   \item{SD142}{Serial subtraction, result of subtracting 7 from 100.}
#'   \item{SD143}{Serial subtraction, result of subtracting 7 from the previous number.}
#'   \item{SD144}{Serial subtraction, result of subtracting 7 from the previous number.}
#'   \item{SD145}{Serial subtraction, result of subtracting 7 from the previous number.}
#'   \item{SD146}{Serial subtraction, result of subtracting 7 from the previous number.}
#'
#'   \item{SD124}{Backwards counting test, success on the first attempt (1 = success, 0 = fail).}
#'   \item{SD129}{Backwards counting test, success on the second attempt (1 = success, 0 = fail).}
#'
#'   \item{SD237WA}{Mouse clicking test: accuracy result (first attemp)}
#'   \item{SD237WC}{Mouse clicking test: total click count (first attemp)}
#'   \item{SD237WT}{Mouse clicking test: total time spent (in seconds; first attempt)}
#'   \item{SD238WA}{Mouse clicking test: accuracy result (second attemp)}
#'   \item{SD238WC}{Mouse clicking test: total click count (second attemp)}
#'   \item{SD238WT}{Mouse clicking test: total time spent (in seconds; second attempt)}
#' }
#'
#' @examples
#' # Load the data
#' data(cog_data)
#'
#' # View the first few rows
#' head(cog_data)
#'
"cog_data"

#' Scored Cognition Data
#'
#' @description A simulated dataset with scored cognition test results. This dataset contains calculated total scores for immediate recall, delayed recall, serial subtraction.
#'
#' @format A dataframe with 10 rows and 6 variables:
#' \describe{
#'   \item{HHID}{Household identifier, a unique 6-digit integer.}
#'   \item{PN}{Person number, a unique 1- or 2-digit integer within each household.}
#'
#'   \item{Total_I}{Total immediate word recall score, ranging from 0 to 5 (sum of 5 items from the immediate recall test).}
#'   \item{Total_D}{Total delayed word recall score, ranging from 0 to 5 (sum of 5 items from the delayed recall test).}
#'
#'   \item{Total_Sub}{Total serial subtraction score, ranging from 0 to 5 (sum of successful subtractions from the serial subtraction test).}
#'
#'   \item{Total_Count}{Total backwards counting score, ranging from 0 to 2 (2 points for success on the first try, 1 point for success on the second try, and 0 for failure).}
#' }
#'
#' @examples
#' # Load the data
#' data(cog_data_score)
#'
#' # View the first few rows
#' head(cog_data_score)
#'
"cog_data_score"

