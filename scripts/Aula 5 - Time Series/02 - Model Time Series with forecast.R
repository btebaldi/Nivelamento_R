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

# Data Load ---------------------------------------------------------------
AirPassengers <- read_excel("scripts/Aula 5 - Time Series/database/AirPassengers.xlsx")

# create a time series object
AirPassengers_ts <- ts(data = AirPassengers$x, start = c(1949, 1), frequency = 12)


# ARIMA model estimation -------------------------------------------------


# Using forecast::auto.arima to automatically select the best ARIMA model based on AICc
auto_arima_fit <- forecast::auto.arima(AirPassengers_ts, trace = TRUE)
summary(auto_arima_fit)


# Using native arima method. The Seasonal part is informed in a list. 
native_arima_fit <- arima(AirPassengers_ts,
                          order = c(2, 1, 1),
                          seasonal = list(order = c(0, 1, 0), period = 12))
summary(native_arima_fit)


# Using forecast package's Arima function (with capital A). This function has
# some additional features (to be explained on time series course). The seasonal
# part is extracted from the ts series.
forecast_arima_fit <- forecast::Arima(AirPassengers_ts,
                                      order = c(2, 1, 1),
                                      seasonal = c(0,1,0))
summary(forecast_arima_fit)
