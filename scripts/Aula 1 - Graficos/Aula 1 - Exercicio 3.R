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


# Exercicio 3 -------------------------------------------------------------

# utilizando o banco de dados diamonds, faca um histograma carat, separado em
# facetas da variavel color.
ggplot(data = diamonds) +
  geom_histogram(aes(x=carat)) +
  facet_wrap(~color)


# utilizando o banco de dados diamonds, faca um grafico de barras da variavel
# color, e complemente a estetica indicando que o preenchimento das barras deve
# ser feito de acordom com a variavel color ("aes(x = color, fill=color)").
ggplot(data = diamonds) +
  geom_bar(aes(x = color, fill=color))


# utilizando o banco de dados diamonds, faca um grafico de dispersao, de carat"
# por price", e colorido pela variaavel color".
ggplot(data = diamonds) +
  geom_point(aes(x=carat, y=price, colour=color))


