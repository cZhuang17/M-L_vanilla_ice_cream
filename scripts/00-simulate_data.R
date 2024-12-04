#### Preamble ####
# Purpose: Simulates a dataset of Australian electoral divisions, including the 
  #state and party that won each division.
# Author: Chiyue Zhuang
# Date: 3 December 2024
# Contact: chiyue.zhuang@mail.utoronto.ca
# License: MIT
# Pre-requisites: The `tidyverse` package must be installed
# Any other information needed? Make sure you are in the `vanilla_ice_cream` rproj


#### Workspace setup ####
library(tidyverse)
set.seed(200)

#### Simulate data ####
# Vendor names
vendors <- c("Metro","Loblaws")

# Generate simulated data
simulated_data <- tibble(
  vendor = sample(vendors, size = 1000, replace = TRUE),  
  current_price = round(runif(1000, 0.9, 100), 3),  
  old_price = round(runif(1000, 0.9, 100), 3),
  month = sample(1:12, size = 1000, replace = TRUE)
)

write_csv(simulated_data, "data/00-simulated_data/simulated_data.csv")
