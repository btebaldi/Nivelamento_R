#' 
#' Author: Bruno Tebaldi de Queiroz Barbosa
#' 
#' Data: 2022-01-12
#' 


# Setup -------------------------------------------------------------------

rm(list = ls())


# Bibliotecas -------------------------------------------------------------
library(tidyverse)


# Banco de dados ----------------------------------------------------------
AirPassengers
tbl <- data.frame(Date=as.numeric(time(AirPassengers)), Valor=as.numeric(AirPassengers))


# Grafico -----------------------------------------------------------------
ggplot(data = tbl) +
  geom_line(mapping = aes(x = Date, y = Valor))

