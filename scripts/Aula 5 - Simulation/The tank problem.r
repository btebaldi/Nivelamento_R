#' ---
#' title: "R Simulation of tank problem"
#' author: "Bruno Tebaldi de Queiroz Barbosa"
#' date: "2025-11-23"
#' output: html_document
#' ---

# Setup -------------------------------------------------------------------

# Clear all objects from the current R workspace for a clean run.
rm(list = ls())          

# Load tidyverse (dplyr, ggplot2, tibble, etc.) for data handling and plotting.
library(tidyverse) 

# User defined Variables --------------------------------------------------

M <- 500 # True (unknown in practice) total number of items (e.g. tanks). Here set to 500.
k <- 5   # Sample size: number of observed serial numbers drawn without replacement.

# Preallocate a tibble to store simulation results.
# id: simulation index
# E1: estimator based on 2 * sample mean (a naive estimator)
# E2: German tank estimator: (k+1)/k * max(sample) - 1 (minimum variance unbiased for M)
tbl <- tibble(
  id = 1:10000,
  E1 = as.numeric(NA),
  E2 = as.numeric(NA)
)


# Monte carlo simulation --------------------------------------------------

# Monte Carlo loop: repeat sampling and compute both estimators
for(i in 1:nrow(tbl)){
  my_sample <- sample(1:M, size = k, replace = FALSE)  # Draw k distinct serial numbers uniformly from 1..M
  tbl$E1[i] <- mean(my_sample) * 2                     # Naive estimator: 2 * mean (biased for M)
  tbl$E2[i] <- max(my_sample) * (1 + 1/k) - 1          # German tank estimator: ((k+1)/k)*max - 1 (unbiased for M)
}


# Plot data ---------------------------------------------------------------

# Compare sampling distributions of the two estimators against the true M
tbl %>%
  ggplot() +
  geom_histogram(aes(x = E1), fill = "blue", alpha = 0.2, bins = 60) +  # Histogram of E1
  geom_histogram(aes(x = E2), fill = "green", alpha = 0.2, bins = 60) + # Histogram of E2
  geom_vline(xintercept = M, colour = "red", linewidth = 1) +            # True M as vertical reference line
  labs(title = "Estimators for the Tank Problem",
       x = "Estimated M",
       y = "Frequency",
       subtitle = "Blue: mean estimator; Green: German tank estimator; Red line: true M")

# Summary statistics (mean, quartiles, etc.) for both estimators across simulations
summary(tbl)


# # Example ---------------------------------------------------------------

# Example: observed serial numbers in a single real sample
z <- c(194, 93, 109, 55, 226)

mean(z) * 2                      # Apply naive mean-based estimator to example sample
max(z) * (1 + 1/length(z)) - 1   # Apply German tank estimator to example sample
