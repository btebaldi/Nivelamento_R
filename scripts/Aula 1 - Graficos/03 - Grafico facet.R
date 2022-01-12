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
mpg


# Grafico -----------------------------------------------------------------

ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_wrap( ~ class, nrow = 2)


