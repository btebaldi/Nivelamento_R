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



# -------------------------------------------------------------------------

AirPassengers_ts <- ts(data = AirPassengers$x, start = c(1949, 1), frequency = 12)

start(AirPassengers_ts)
end(AirPassengers_ts)
time(AirPassengers_ts)
cycle(AirPassengers_ts)
frequency(AirPassengers_ts)
deltat(AirPassengers_ts)
is.ts(AirPassengers_ts)

economics_ts <- ts(data = economics[ , c("pce", "pop", "psavert", "uempmed", "unemploy")],
                   start = c(1967, 7), frequency = 12)

start(economics_ts)
end(economics_ts)
time(economics_ts)
cycle(economics_ts)
frequency(economics_ts)
deltat(economics_ts)
is.ts(economics_ts)

Nile_ts <- ts(data = Nile$nile, start = c(1871, 1), frequency = 1)

start(Nile_ts)
end(Nile_ts)
time(Nile_ts)
cycle(Nile_ts)
frequency(Nile_ts)
deltat(Nile_ts)
is.ts(Nile_ts)


plot(AirPassengers_ts)
plot(economics_ts)
plot(Nile_ts)

ts.plot(AirPassengers_ts)
ts.plot(Nile_ts)
ts.plot(economics_ts)

ts.plot(economics_ts[, c(3,4)],  col = 1:2)
# Add a legend to your ts.plot
legend("topleft", colnames(economics_ts[, c(3,4)]), lty = 1, col = 1:2, bty = "n")



