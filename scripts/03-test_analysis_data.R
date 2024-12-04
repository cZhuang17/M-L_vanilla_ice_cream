#### Preamble ####
# Purpose: Tests
# Author: Chiyue Zhuang
# Date: 3 December 2024
# Contact: chiyue.zhuang@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? No


#### Workspace setup ####
library(tidyverse)
library(testthat)
library(arrow)

analysis_data <- read_parquet("data/02-analysis_data/analysis_data.parquet")

# Test that the dataset has 980 rows
test_that("dataset has 980 rows", {
  expect_equal(nrow(analysis_data), 980)
})

# Test that the 'vendor' column contains values only from the predefined list
test_that("'vendor' column contains only predefined values", {
  predefined_vendors <- c("Metro", "Loblaws")
  expect_true(all(analysis_data$vendor %in% predefined_vendors))
})

# Test that the 'current_price' and 'old_price' columns are numeric types
test_that("'current_price' and 'old_price' are numeric", {
  expect_type(analysis_data$current_price, "double")
  expect_type(analysis_data$old_price, "double")
})

# Test that the 'month' column contains values from 1 to 12
test_that("Variable 'month' has unique values 1 to 12", {
  expect_true(all(analysis_data$month %in% 1:12))
})


