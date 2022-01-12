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
  geom_point(mapping = aes(x = displ, y = hwy)) +
  labs(title="Titulo", subtitle = "segundo titulo",
       x= "eixo x", y="eixo y",caption = "caption")

# utilizando o banco de dados mpg, faca um grafico de barras da variavel fl.
ggplot(data = mpg) +
  geom_bar(mapping = aes(x = fl)) +
  labs(title="Fuel type",
       subtitle = "Fuel Economy Data From 1999 To 2008 For 38 Popular Models Of Cars",
       x = NULL,
       y = NULL,
       caption = "e = ethanol, d = diesel, r = regular, p = premium, c = natural gas")

# utilizando o banco de dados mpg, faca um histograma da variavel displ.
ggplot(data = mpg) +
  geom_histogram(mapping = aes(x = displ), bins = 20) +
  labs(title="Engine displacement, in litres",
       subtitle = "Fuel Economy Data From 1999 To 2008 For 38 Popular Models Of Cars",
       x = NULL,
       y = NULL,
       caption = NULL)

# utilizando o banco de dados mpg, faca um boxplot da variavel displ segregada
# por fl.
ggplot(data = mpg) +
  geom_boxplot(mapping = aes(x = fl, y=displ)) +
  labs(title="Engine displacement, in litres",
       subtitle = "Fuel Economy Data From 1999 To 2008 For 38 Popular Models Of Cars",
       x = NULL,
       y = NULL,
       caption = "e = ethanol, d = diesel, r = regular, p = premium, c = natural gas")


