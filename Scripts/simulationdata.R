#### Preamble ####
# Purpose: Ensure that a given model produces expected results through simulations on data sets, linear models and sketching graphs
# Author: Xincheng Zhang
# Date: March 29 2024
# Contact: xinchenggg.zhang@mail.utoronto.ca


#### Workspace setup ####

# 1.Simulate the Dataset
# For reproducibility
set.seed(123)
# Number of observations
n <- 500

# 2. Simulate data by simulate 14 columns, which are all variables that need to be used
simulation_data <- data.frame(
  id = 1:n,
  # Simulating Longitude coordinates
  Lng = runif(n, min = 116, max = 117),
  # Simulating Latitude coordinates
  Lat = runif(n, min = 39, max = 41),
  # Simulating total price
  totalPrice = rnorm(n, mean = 500, sd = 100),
  # Simulating square of house
  square = rnorm(n, mean = 100, sd = 20),
  # Simulating living room count
  livingRoom = sample(1:5, n, replace = TRUE),
  # Simulating drawing room count
  drawingRoom = sample(1:3, n, replace = TRUE),
  # Simulating kitchen count
  kitchen = sample(1:2, n, replace = TRUE),
  # Simulating bathroom count
  bathroom = sample(1:3, n, replace = TRUE),
  # Simulating floor height
  floor = sample(1:10, n, replace = TRUE),
  # Simulating building type
  buildingType = sample(1:4, n, replace = TRUE),
  # Simulating construction time
  constructionTime = sample(1970:2022, n, replace = TRUE),
  # Simulating renovation condition
  renovationCondition = sample(1:4, n, replace = TRUE),
  # Simulating building structure
  buildingStructure = sample(1:6, n, replace = TRUE)
)

# Create a dataframe to explain each variable
variable_explanations <- data.frame(
  Variable = c(
    "id", "Lng", "Lat", "totalPrice", "square",
    "livingRoom", "drawingRoom", "kitchen", "bathroom",
    "floor", "buildingType", "constructionTime",
    "renovationCondition", "buildingStructure"
  ),
  Explanation = c(
    "ID of each building",
    "Longitude coordinates using the BD09 protocol",
    "Latitude coordinates using the BD09 protocol",
    "Total price of the property",
    "Square footage of the house",
    "Number of living rooms",
    "Number of drawing rooms",
    "Number of kitchens",
    "Number of bathrooms",
    "Height of the floor",
    "Type of building (e.g., tower, bungalow)",
    "Construction year of the property",
    "Condition of renovation (e.g., rough, hardcover)",
    "Building structure (e.g., brick and concrete, steel)"
  )
)

# Print the variable explanations table for different data features
print(variable_explanations)


# 3. Create Linear Models----Model section
# Create linear model and print summary
create_linear_model <- function(data, formula) {
  lm_model <- lm(formula, data = data)
  summary(lm_model)
}

# Create linear models with different combinations of predictors, , which are all variables that need to be used
# To simulate the influences of different columns of properties to the total prices
lm_lng_lat <- create_linear_model(simulation_data, totalPrice ~ Lng + Lat)
lm_rooms <- create_linear_model(simulation_data, totalPrice ~ livingRoom + drawingRoom + kitchen + bathroom)
lm_floor_type <- create_linear_model(simulation_data, totalPrice ~ floor + buildingType)
lm_construction <- create_linear_model(simulation_data, totalPrice ~ constructionTime)
lm_renovation <- create_linear_model(simulation_data, totalPrice ~ renovationCondition)
lm_structure <- create_linear_model(simulation_data, totalPrice ~ buildingStructure)

# 4. Visualize the Relationships----Result section
# Create scatter plot with linear model
plot_lm <- function(data, x, y) {
  plot(data[[x]], data[[y]], main = paste("Scatter plot of", x, "vs", y))
  abline(lm(data[[y]] ~ data[[x]]), col = "red")
}

# Create scatter plots with linear models for all variables that need to be used
par(mfrow = c(2, 3))
plot_lm(simulation_data, "Lng", "totalPrice")
plot_lm(simulation_data, "Lat", "totalPrice")
plot_lm(simulation_data, "livingRoom", "totalPrice")
plot_lm(simulation_data, "drawingRoom", "totalPrice")
plot_lm(simulation_data, "kitchen", "totalPrice")
plot_lm(simulation_data, "bathroom", "totalPrice")
plot_lm(simulation_data, "floor", "totalPrice")
plot_lm(simulation_data, "buildingType", "totalPrice")
plot_lm(simulation_data, "constructionTime", "totalPrice")
plot_lm(simulation_data, "renovationCondition", "totalPrice")
plot_lm(simulation_data, "buildingStructure", "totalPrice")

# Displaying the simulated dataset
head(simulation_data)
