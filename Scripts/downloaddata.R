#### Preamble ####
# Purpose: Download the original data for simulation, cleaning and using.
# Author: Xincheng Zhang
# Date: March 29 2024
# Contact: xinchenggg.zhang@mail.utoronto.ca


#### Workspace setup ####

## Load the installed packages into the R
library(tidyverse)
library(httr)
library(jsonlite)
library(devtools)

## Install and load the kaggler package from GitHub
devtools::install_github("ldurazo/kaggler")
library(kaggler)

## Download datasets from Kaggle
Beijing_housing <- kgl_datasets_download_all(owner_dataset = "ruiqurm/lianjia")
download.file(Beijing_housing[["url"]], "Input/beijing.csv", mode = "wb")
