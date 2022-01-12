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

ggplot(data = mpg) +
  geom_boxplot(mapping = aes(x = class, y = hwy))
