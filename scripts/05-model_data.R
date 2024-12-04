#### Preamble ####
# Purpose: Models
# Author: Chiyue Zhuang
# Date: 3 December 2024 
# Contact: chiyue.zhuang@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? No


#### Workspace setup ####
library(tidyverse)
library(rstanarm)
install.packages("Rcpp")
library(Rcpp)
#### Read data ####
analysis_data <- read_parquet("data/02-analysis_data/analysis_data.parquet")

### Model data ####
first_model <-
  stan_glm(
    formula = current_price ~ month + old_price + vendor,
    data = analysis_data,
    family = gaussian(),
    prior = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_intercept = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_aux = exponential(rate = 1, autoscale = TRUE),
    seed = 200
  )

first_model
#### Save model ####
saveRDS(
  first_model,
  file = "models/first_model.rds"
)


