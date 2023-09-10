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

# Ruído Branco (WN) -------------------------------------------------------

WN <- runif(n = 100, min = -1, max = 1)

WN_ts <- ts(data = WN, start = 1, frequency = 1)

ts.plot(WN_ts)

# Passeio Aleatório (RW) --------------------------------------------------

RW <- cumsum(WN)
RW_ts <- ts(data = RW, start = 1, frequency = 1)

ts.plot(RW_ts)


Autoregressivo (AR)

# Autoregressivo (AR) -----------------------------------------------------

# Simular um modelo AR(2) com coeficientes 0.5 e -0.2
ar <- arima.sim(n = 100, model = list(ar = c(0.5, -0.2)))

is.ts(ar)

ts.plot(ar)

# Média Móvel Simples (MA) ------------------------------------------------

# Simular um modelo MA(2) com coeficientes 0.1 e 0.2
ma <- arima.sim(n = 100, model = list(ma = c(0.1, 0.2)))

is.ts(ma)

ts.plot(ma)

# Integrado (I) -----------------------------------------------------------

# Simular um modelo I(1)
I <- arima.sim(n = 1000, model = list(order = c(0,1,0)))
is.ts(I)
ts.plot(I)
ts.plot(diff(I))

# ARIMA -------------------------------------------------------------------

# Simular um modelo ARIMA(1,0,1)
ARIMA <- arima.sim(n = 1000, model = list(order = c(1,0,1), ar = c(0.8), ma = c(0.1)))
is.ts(ARIMA)
ts.plot(ARIMA)
ts.plot(ARIMA)

forecast::auto.arima(ARIMA, stepwise = FALSE, trace = TRUE)


