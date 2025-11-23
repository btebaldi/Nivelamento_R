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

plot(WN_ts)

# Passeio Aleatório (RW) --------------------------------------------------

RW <- cumsum(WN)
RW_ts <- ts(data = RW, start = 1, frequency = 1)

plot(RW_ts)


# Autoregressivo (AR) -----------------------------------------------------

# Simular um modelo AR(2) com coeficientes 0.5 e -0.2
ar <- arima.sim(n = 100, model = list(ar = c(0.5, -0.2)))

is.ts(ar)

forecast::autoplot(ar)

# Média Móvel Simples (MA) ------------------------------------------------

# Simular um modelo MA(2) com coeficientes 0.1 e 0.2
ma <- arima.sim(n = 100, model = list(ma = c(0.1, 0.2)))

is.ts(ma)

forecast::autoplot(ma)

# Integrado (I) -----------------------------------------------------------

# Simular um modelo I(1)
I <- arima.sim(n = 1000, model = list(order = c(0,1,0)))

is.ts(I)

forecast::autoplot(I)

forecast::autoplot(diff(I))

# ARIMA -------------------------------------------------------------------

# Simular um modelo ARIMA(1,0,1)
ARIMA <- arima.sim(n = 300, model = list(order = c(2,0,0),
                                          ar = c(0.4, 0.2)))
is.ts(ARIMA)
forecast::autoplot(ARIMA)

arima.mdl <- forecast::auto.arima(ARIMA,
                                  stepwise = FALSE,
                                  trace = TRUE,
                                  approximation = FALSE,
                                  ic = "bic")
summary(arima.mdl)


