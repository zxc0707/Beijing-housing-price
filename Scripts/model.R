#### Preamble ####
# Purpose: Make a copy of the model's code for the variables price and dif_cor/buildingType/buildingStructure
# Author: Xincheng Zhang
# Date: March 30 2024
# Contact: xinchenggg.zhang@mail.utoronto.ca


#### Workspace setup ####


# Load required library
library(stats)
library(car)
# Fit linear regression model
lm_model <- lm(price ~ dif_cor, data = cleaned_sampled_data)

# Summary of the model
summary(lm_model)


# Create scatter plot with regression line
ggplot(data = cleaned_sampled_data, aes(x = dif_cor, y = price)) +
  geom_point(color = "blue", alpha = 0.5) + # Adjust point color and transparency
  geom_smooth(method = "lm", formula = y ~ x, color = "red", se = FALSE) + # Add regression line
  labs(x = "dif_cor", y = "Price") +
  ggtitle("Scatter Plot of Total Price vs dif_cor") +
  theme_minimal() # Apply a minimal theme for better appearance

# create an influence plot for diagnosing influential cases in linear regression models
influencePlot(lm_model)

# calculates the residuals of the linear regression model
residuals <- residuals(lm_model)

# Create a plot of residuals vs fitted values
plot(cleaned_sampled_data$dif_cor, residuals,
  xlab = "dif_cor", ylab = "Residuals",
  main = "Residuals vs dif_cor",
  col = "blue"
)

# Add a horizontal line at y = 0
abline(h = 0, col = "red")

# Plot the distribution of residuals
hist(residuals,
  main = "Distribution of Residuals",
  xlab = "Residuals", ylab = "Frequency",
  col = "lightblue", border = "black"
)





# Load the required library
library(ggplot2)

# Fit linear regression models for each type of building
lm_models1 <- lapply(levels(cleaned_sampled_data$buildingType), function(building_type) {
  lm(price ~ dif_cor + livingRoom + drawingRoom, data = subset(cleaned_sampled_data, buildingType == building_type))
})

# Create a scatter plot with regression lines for each type of building
ggplot(cleaned_sampled_data, aes(x = dif_cor, y = price, color = factor(buildingType))) +
  geom_point(alpha = 0.7) +
  geom_smooth(method = "lm", formula = y ~ x, se = FALSE, aes(group = buildingType), linetype = "solid") +
  labs(x = "Straight-line distance from the center of Beijing", y = "Price", title = "Price vs Dif Cor by Building Type") +
  scale_color_manual(values = c("#1f77b4", "#FFD700", "#FF1493", "#d62728")) + # Change colors here
  theme_minimal() +
  theme(
    plot.title = element_text(face = "bold", size = 16, color = "#333333"),
    axis.title = element_text(face = "bold", size = 14, color = "#333333"),
    axis.text = element_text(size = 12, color = "#333333"),
    legend.title = element_blank(),
    legend.text = element_text(size = 12, color = "#333333"),
    panel.background = element_rect(fill = "#f0f0f0"),
    panel.grid.major = element_line(color = "#CCCCCC", linetype = "dotted"),
    panel.grid.minor = element_blank(),
    legend.key = element_rect(fill = "#f0f0f0"),
    panel.border = element_rect(color = "black", fill = NA)
  )




# Load the required library
library(ggplot2)

# Fit linear regression models for each type of building structure
lm_models <- lapply(levels(cleaned_sampled_data$buildingStructure), function(building_structure) {
  lm(price ~ dif_cor + livingRoom + drawingRoom, data = subset(cleaned_sampled_data, buildingStructure == building_structure))
})

# Create a scatter plot with regression lines for each type of building structure
ggplot(cleaned_sampled_data, aes(x = dif_cor, y = price, color = factor(buildingStructure))) +
  geom_point(alpha = 0.7) +
  geom_smooth(method = "lm", formula = y ~ x, se = FALSE, aes(group = buildingStructure), linetype = "solid") +
  labs(x = "Straight-line distance from the center of Beijing", y = "Price", title = "Price vs Dif Cor by Building Structure") +
  scale_color_manual(values = c("#1E90FF", "#BF3EFF", "#7FFF00", "#d62728", "#9467bd", "#8c564b")) + # Adjust colors for six building structures
  theme_minimal() +
  theme(
    plot.title = element_text(face = "bold", size = 16),
    axis.title = element_text(face = "bold", size = 14),
    axis.text = element_text(size = 12),
    legend.title = element_blank(),
    legend.text = element_text(size = 12),
    panel.background = element_rect(fill = "#f0f0f0"),
    panel.grid.major = element_line(color = "#CCCCCC", linetype = "dotted"),
    panel.grid.minor = element_blank(),
    legend.key = element_rect(fill = "#f0f0f0"),
    panel.border = element_rect(color = "black", fill = NA)
  )


# Define the file path where you want to save the model
file_path <- "/cloud/project/Model/Location_vs_price.rds"

# Save the first model as an RDS file
saveRDS(lm_model, file = file_path)


# Define the file path where you want to save the model
file_path <- "/cloud/project/Model/Location_buildingtype_vs_price.rds"

# Save the second model as an RDS file
saveRDS(lm_models1, file = file_path)

# Define the file path where you want to save the model
file_path <- "/cloud/project/Model/Location_buildingstructure_vs_price.rds"

# Save the third model as an RDS file
saveRDS(lm_models, file = file_path)
