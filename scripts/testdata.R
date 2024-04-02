#### Preamble ####
# Purpose: Test the codes, simulated data set and the cleaned original data set to be used to ensure the availability of the data set
# Author: Xincheng Zhang 
# Date: March 29 2024
# Contact: xinchenggg.zhang@mail.utoronto.ca


#### Workspace setup ####


## Test for simulation dataset
## Ensure availability of simulation data

# 1. Check if there are 500 observations
if (nrow(simulation_data) == 500) {
  print("There are 500 observations in the dataset.")
} else {
  print("There are not 500 observations in the dataset.")
}

# 2. Check for missing data in each entry
if (sum(is.na(simulation_data)) == 0) {
  print("There are no missing values in the dataset.")
} else {
  print("There are missing values in the dataset.")
}

# 3. Check if each column contains numeric data
if (all(sapply(simulation_data, is.numeric))) {
  print("All columns contain numeric data.")
} else {
  print("Not all columns contain numeric data.")
}


## Test for original cleaned dataset
## Ensure that the cleaned original data has enough observations to build a model, and check the data type and whether there is a missing value to facilitate subsequent data processing.

# 1. Check if the total number of observations is more than 300
total_observations <- nrow(sampled_data)
is_more_than_300 <- total_observations > 300
cat("Total observations:", total_observations, "\n")
cat("Is more than 300?:", is_more_than_300, "\n")

# 2. Check if each entry doesn't have missing data
has_missing_data <- anyNA(sampled_data)
cat("Does the dataset have missing data?:", !has_missing_data, "\n")

# 3. Check if specified columns are not in text form
numeric_columns <- c("totalPrice", "square", "livingRoom", "drawingRoom", 
                     "kitchen", "bathRoom", "buildingType", "constructionTime", 
                     "buildingStructure", "elevator")
are_not_text_data <- sapply(sampled_data[numeric_columns], function(x) !any(grepl("[[:alpha:]]", x, ignore.case = TRUE)))
cat("Are specified columns not in text form?:", all(are_not_text_data), "\n")

## Test for codes
## By the cleandata.R and simulationdata.R in the script folder, it can be clearly see that the above code for testing is matching the prperties of simulation_data and sampled_data. 
## The codes are correct and can be run successfully. 


