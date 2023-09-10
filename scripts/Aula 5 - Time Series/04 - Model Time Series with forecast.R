#' ---
#' title: "Time Series - objeto ts()"
#' author: "Bruno Tebaldi de Queiroz Barbosa"
#' date: "2023-02-04"
#' output: html_document
#' ---


# Setup -------------------------------------------------------------------
library(tidyverse)
library(readxl)

rm(list = ls())

# ARIMA -------------------------------------------------------------------

ARIMA <- arima.sim(n = 100, model = list(order = c(2,0,0), ar = c(0.1, 0.5)))
is.ts(ARIMA)
ts.plot(ARIMA)
ts.plot(ARIMA)

forecast::auto.arima(ARIMA, stepwise = FALSE, trace = TRUE)

forecast::Arima(ARIMA, order = c(2,0,0))
# Series: ARIMA 
# ARIMA(2,0,0) with non-zero mean 
# 
# Coefficients:
#   ar1     ar2    mean
# -0.1842  0.3214  0.1226
# s.e.   0.0968  0.0968  0.1046
# 
# sigma^2 = 0.8463:  log likelihood = -132.17
# AIC=272.34   AICc=272.77   BIC=282.76


