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
library(arrow)

#### Read data ####
analysis_data <- read_parquet("/Users/chiyuezhuang/Desktop/final paper/data/02-analysis_data/analysis_data.parquet")

# Ensure month is treated as a factor
analysis_data <- analysis_data %>%
                 mutate(month = factor(month, levels = 1:12, labels = month.abb[1:12]))

# Boxplot - Distribution of current_price by vendor with overlayed data points
ggplot(analysis_data, aes(x = vendor, y = current_price, fill = vendor)) +
  geom_boxplot(outlier.color = "red", outlier.shape = 16, outlier.size = 2, alpha = 0.7) +
  geom_jitter(aes(color = vendor), width = 0.2, alpha = 0.6, size = 2) +
  scale_fill_manual(values = c("#FF9999", "#66B2FF")) +
  scale_color_manual(values = c("#FF6666", "#3399FF")) +
  labs(
    title = "Distribution of Current Price of Vanilla Ice Cream 
    by Vendor with Overlayed Data Points",
    x = "Vendor",
    y = "Current Price (CAD)"
  ) +
  theme_minimal(base_size = 14) +
  theme(
    plot.title = element_text(face = "bold", hjust = 0.5),
    axis.text.x = element_text(face = "bold"),
    legend.position = "none"
  )

#| label: histogram-vendor
#| fig-cap: "Distribution of Current Price and Quantity Sold of Vanilla Ice Cream by Vendor under Histogram, Showing that Metro has consistent Higher Current Price and Vanilla Ice Cream is Sold the Best at Price of 5 in Both Grocery Stores."
#| echo: false
#| warning: false
#| message: false

analysis_data <- read_parquet("/Users/chiyuezhuang/Desktop/final paper/data/02-analysis_data/analysis_data.parquet")

# Ensure month is treated as a factor
analysis_data <- analysis_data %>%
  mutate(month = factor(month, levels = 1:12, labels = month.abb[1:12]))

# Histogram - Distribution of current_price and quantity_sold by vendor
ggplot(analysis_data %>% filter(vendor %in% c("Loblaws", "Metro")), 
       aes(x = current_price, fill = vendor)) +
  geom_histogram(bins = 30, alpha = 0.7, color = "black") +
  scale_fill_manual(values = c("#FF9999", "#66B2FF")) +
  labs(
    title = "Distribution of Current Price
    of Vanilla Ice Cream by Vendor",
    x = "Current Price (CAD)",
    y = "Quantity Sold"
  ) +
  facet_wrap(~ vendor, ncol = 1) +  
  theme_minimal(base_size = 14) +
  theme(
    plot.title = element_text(face = "bold", hjust = 0.5),
    axis.text.x = element_text(face = "bold"),
    legend.position = "none"  
  )

#| label: histogram-price
#| fig-cap: "Distribution of Quantity Sold of Vanilla Ice Cream under Different Price by Vendor in Histogram, Showing that Metro always Sell More Vanilla Ice Cream than Loblaws, and At Price of 5, the Product is Sold the Best. "
#| echo: false
#| warning: false
#| message: false

analysis_data <- read_parquet("/Users/chiyuezhuang/Desktop/final paper/data/02-analysis_data/analysis_data.parquet")

# Ensure month is treated as a factor
analysis_data <- analysis_data %>%
  mutate(month = factor(month, levels = 1:12, labels = month.abb[1:12]))

# Histogram - Distribution of quantity_sold under different current_price by vendor
ggplot(analysis_data, 
       aes(x = current_price, fill = vendor)) +
  geom_histogram( bins = 30, alpha = 0.7, color = "black") +
  scale_fill_manual(values = c("#FF9999", "#66B2FF")) +
  labs(
    title = "Distribution of Quantity Sold of Vanilla Ice Cream 
    under Different Price by Vendor",
    x = "Current Price (CAD)",
    y = "Quantity Sold"
  ) +
  theme_minimal(base_size = 14) +
  theme(
    plot.title = element_text(face = "bold", hjust = 0.5),
    axis.text.x = element_text(face = "bold"),
    legend.title = element_blank(),
    legend.position = "top"
  )

#| label: boxplot-month_overlay
#| fig-cap: "Distribution of Current Price of Vanilla Ice Cream by Month with Overlayed Data Points under Boxplot."
#| echo: false
#| warning: false
#| message: false

analysis_data <- read_parquet("/Users/chiyuezhuang/Desktop/final paper/data/02-analysis_data/analysis_data.parquet")

# Ensure month is treated as a factor
analysis_data <- analysis_data %>%
  mutate(month = factor(month, levels = 1:12, labels = month.abb[1:12]))

# Boxplot - Distribution of current_price by month with overlayed data points
ggplot(analysis_data, aes(x = month, y = current_price, fill = month)) +
  geom_boxplot(outlier.color = "red", outlier.shape = 16, outlier.size = 2, alpha = 0.7) +
  geom_jitter(aes(color = month), width = 0.2, alpha = 0.6, size = 2) +
  scale_fill_brewer(palette = "Spectral") +
  scale_color_brewer(palette = "Spectral") +
  labs(
    title = "Distribution of Current Price of Vanilla Ice Cream 
    by Month with Overlayed Data Points",
    x = "Month",
    y = "Current Price (CAD)"
  ) +
  theme_minimal(base_size = 14) +
  theme(
    plot.title = element_text(face = "bold", hjust = 0.5),
    axis.text.x = element_text(angle = 45, hjust = 1, face = "bold"),
    legend.position = "none"
  )

#| label: histogram-month
#| fig-cap: "Distribution of Current Price and Quantity Sold of Vanilla Ice Cream by Month under Histogram, Showing that Vanilla Ice Cream is Sold the Best During Summer."
#| echo: false
#| warning: false
#| message: false

analysis_data <- read_parquet("/Users/chiyuezhuang/Desktop/final paper/data/02-analysis_data/analysis_data.parquet")

# Ensure month is treated as a factor
analysis_data <- analysis_data %>%
  mutate(month = factor(month, levels = 1:12, labels = month.abb[1:12]))

# Histogram - Distribution of current_price and quantity_sold by month
ggplot(analysis_data, aes(x = current_price, fill = month)) +
  geom_histogram(bins = 30, alpha = 0.7, color = "black", position = "identity") +
  scale_fill_brewer(palette = "Spectral") +
  labs(
    title = "Distribution of Current Price and Quantity Sold of 
    Vanilla Ice Cream by Month",
    x = "Current Price (CAD)",
    y = "Quantity Sold"
  ) +
  facet_wrap(~ month, ncol = 3) +  
  theme_minimal(base_size = 14) +
  theme(
    plot.title = element_text(face = "bold", hjust = 0.5),
    axis.text.x = element_text(angle = 45, hjust = 1, face = "bold"),
    legend.position = "none"  
  )

#| label: scatterplot-current_old
#| fig-cap: "Relationship Between Current and Old Prices of Vanilla Ice Cream, Showing that It Follows an Upwarding Direction Distribution."
#| echo: false
#| warning: false
#| message: false

analysis_data <- read_parquet("/Users/chiyuezhuang/Desktop/final paper/data/02-analysis_data/analysis_data.parquet")

# Scatterplot - Ditribution of current_price by old_price
ggplot(analysis_data, aes(x = old_price, y = current_price)) +
  geom_point(aes(color = old_price), alpha = 0.7, size = 3) +
  geom_smooth(method = "lm", color = "blue", linetype = "dashed", size = 1, se = TRUE) +
  scale_color_gradient(low = "#66B2FF", high = "#FF6666") +
  labs(
    title = "Relationship Between Current and Old Prices of 
    Vanilla Ice Cream",
    x = "Old Price (CAD)",
    y = "Current Price (CAD)",
    color = "Old Price"
  ) +
  theme_minimal(base_size = 14) +
  theme(
    plot.title = element_text(face = "bold", hjust = 0.5),
    axis.text = element_text(face = "bold"),
    axis.title = element_text(face = "bold"),
    legend.position = "right"
  )
