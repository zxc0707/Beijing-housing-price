#### Preamble ####
# Purpose: Clean and collect the raw original data set and ensure the availability for using in each part of report
# Author: Xincheng Zhang 
# Date: March 30 2024
# Contact: xinchenggg.zhang@mail.utoronto.ca


#### Workspace setup ####


## Load the necessary packages
library(readr)
library(dplyr)
beijing <- read_csv("/cloud/project/input/beijing.csv")
# Select the desired columns for using 
selected_data <- select(beijing, id, Lng, Lat, totalPrice, square, livingRoom, price, drawingRoom, kitchen, bathRoom, constructionTime, buildingType, buildingStructure, elevator) 
# View the first few rows of the selected columns to check 
head(selected_data)
## Filter the data that contains other irrelevant symbols
cleaned_data <- selected_data %>%
  filter(constructionTime != "δ֪")
cleaned_data <- cleaned_data %>%
  filter(buildingType != "NaN")

# Filter rows within the specified ranges and sample 125 rows randomly from each range
## Randomly pick the data sample by the constrcution time
sampled_data <- cleaned_data %>%
  filter(constructionTime >= 1980 & constructionTime < 1990) %>%
  sample_n(125) %>%
  bind_rows(
    cleaned_data %>%
      filter(constructionTime >= 1990 & constructionTime < 2000) %>%
      sample_n(125)
  ) %>%
  bind_rows(
    cleaned_data %>%
      filter(constructionTime >= 2000 & constructionTime < 2010) %>%
      sample_n(125)
  ) %>%
  bind_rows(
    cleaned_data %>%
      filter(constructionTime >= 2010 & constructionTime <= 2020) %>%
      sample_n(125)
  )

# Order the sampled data by constructionTime from small to big
sampled_data <- sampled_data[order(sampled_data$constructionTime), ]

# Print the first few rows of the sampled data to check 
head(sampled_data)

## For the Model part, create 3 new variables to show the distances with the center of Beijing in coordinates
# Create dif_lng variable
sampled_data$dif_lng <- abs(sampled_data$Lng - 116.38833178)

# Create dif_lat variable
sampled_data$dif_lat <- abs(sampled_data$Lat - 39.901996392)

# Create new variable dif_cor
sampled_data$dif_cor <- sqrt(sampled_data$dif_lng^2 + sampled_data$dif_lat^2)

# Print the first few rows of the updated dataset to check
head(sampled_data)

# Define the indices of the rows to remove
rows_to_remove <- c(21, 7, 37, 409, 359)

# Remove the specified rows
cleaned_sampled_data <- sampled_data[-rows_to_remove, ]


# Save the dataset as a CSV file
write.csv(cleaned_sampled_data, file = "cleaned_sampled_data.csv", row.names = FALSE)

# Save the dataset as a CSV file
write.csv(sampled_data, file = "sampled_data.csv", row.names = FALSE)


