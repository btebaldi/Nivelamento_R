#' ---
#' title: "R  exemplo de regressão linear simples"
#' author: "Bruno Tebaldi de Queiroz Barbosa"
#' date: "2025-11-23"
#' output: html_document
#' ---

# Setup -------------------------------------------------------------------
rm(list = ls())

library(ggplot2)

# Dataload ----------------------------------------------------------------
tbl <- mtcars
head(tbl)

# Simple Linear Regression -----------------------------------------------

# Fit the linear model
lm_fit <- lm(mpg ~ wt, data = tbl)

# Summary of the model
summary(lm_fit)

# Plot the data and the regression line
ggplot(tbl, aes(x = wt, y = mpg)) + 
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "blue") +
  labs(title = "Simple Linear Regression: MPG vs Weight",
       x = "Weight (1000 lbs)",
       y = "Miles per Gallon (MPG)")
