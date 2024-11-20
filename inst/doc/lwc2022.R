## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
options(rmarkdown.html_vignette.check_title = FALSE)

## -----------------------------------------------------------------------------
# Installing package
# devtools::install_github("C-Monaghan/lwc2022")

# Loading package
library(lwc2022)

# Load the example dataset
data(cog_data)

# Alternatively load the real HRS 2022 cognition data
# cog_data <- haven::read_sav(here::here("../path_to_file.sav"))

# Extract the relevant cognitive test variables
extracted_data <- extract(cog_data)

# Score the cognitive tests
scored_data <- score(extracted_data)

# Classify individuals based on their total cognitive score
classified_data <- classify(scored_data)

# View the first few rows of the classified data
head(classified_data)

