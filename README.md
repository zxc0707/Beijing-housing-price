# Analyzing and Predicting Beijing Housing Price

## Overview
This report uses linear regression equations and statistical charts to analyze the factors that led to the increase in housing prices in Beijing for the 21st century compared to the 20th century. The results show that the number of living rooms, the location of the listings, and the structure of the building are the prime drivers of price surges. This result can play a key role in the economic management and decision-making of potential buyers in Beijing.

The dataset could be found at https://www.kaggle.com/datasets/ruiqurm/lianjia. This raw dataset is uploaded to `Input`.

## File Structure
The repo is structured as:
-  `Input` contains two folders, which include the original dataset and the cleaned dataset used in this report respectively. The parquet form of cleaned datasets is also contained in it. 
-  `Model` contains three models used in this report, including the interaction for location, building type, and building structure with price. 
-  `Output` contains the qmd file and references, as well as the PDF of the paper.
-  `Scripts` contains the R scripts used to download the raw datasets from Kaggle, simulation, clean and test of the data, as well as the codes that create the models. Using styler to style the codes in `Scripts` is also contained in it. 
-  `Other` contains `literature` for the pdf file of all references, `sketching` for sketches for datasets and graphs, `llms` for recording LLM using, `replicated_plots` for recording all graphs in the report, and `map` for the map in the report.

## Packages Installization
The codes used to install packages are in `Scripts/downloadpackages.R`.

## LLM Usage
Aspects of codes, the abstract were written with the help of ChatGPT3.5 and the entire chat history is available in Other/llms/llms_usage.txt.
