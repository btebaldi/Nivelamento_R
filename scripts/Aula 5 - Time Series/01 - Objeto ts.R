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
economics <- read_excel("scripts/Aula 5 - Time Series/database/economics.xlsx")
Nile <- read_excel("scripts/Aula 5 - Time Series/database/Nile.xlsx")



# AirPassengers time series -----------------------------------------------

# create a time series object
AirPassengers_ts <- ts(data = AirPassengers$x, start = c(1949, 1), frequency = 12)

# The start() and end() functions return the time index of the first and last
# observations, respectively.
start(AirPassengers_ts)
end(AirPassengers_ts)

# The time() function calculates a vector of time
# indices, with one element for each time index on which the series was
# observed.
time(AirPassengers_ts)

# The deltat() function returns the fixed time interval between observations
deltat(AirPassengers_ts)

# The frequency() function returns the number of observations per unit time.
frequency(AirPassengers_ts)

# The cycle() function returns the position in the cycle of each observation.
cycle(AirPassengers_ts)

is.ts(AirPassengers_ts)


# Economics time series ---------------------------------------------------
economics_ts <- ts(data = economics[ , c("pce", "pop", "psavert", "uempmed", "unemploy")],
                   start = c(1967, 7), frequency = 12)

start(economics_ts)
end(economics_ts)
time(economics_ts)
cycle(economics_ts)
frequency(economics_ts)
deltat(economics_ts)
is.ts(economics_ts)

# Nile time series --------------------------------------------------------
Nile_ts <- ts(data = Nile$nile, start = c(1871, 1), frequency = 1)

start(Nile_ts)
end(Nile_ts)
time(Nile_ts)
cycle(Nile_ts)
frequency(Nile_ts)
deltat(Nile_ts)
is.ts(Nile_ts)


# Plot the Data -----------------------------------------------------------

print(AirPassengers_ts)
plot(AirPassengers_ts)

# forecast package has an autoplot for ts objects
forecast::autoplot(AirPassengers_ts)

plot(economics_ts)
plot(Nile_ts)