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


# utilizando o banco de dados mpg, faca um grafico de barras da variavel fl.
g1 <- ggplot(data = mpg) +
  geom_bar(mapping = aes(x = fl, fill = class)) +
  labs(title="Fuel type",
       subtitle = "Fuel Economy Data From 1999 To 2008 For 38 Popular Models Of Cars",
       x = NULL,
       y = NULL,
       caption = "e = ethanol, d = diesel, r = regular, p = premium, c = natural gas")

# Salva o ultimo grafico criado
ggsave(filename = "./graficos/Aula 1 - Gafico1.png",
       plot = g1,
       units = "in",
       width = 8, height = 6,
       dpi = 100)

# utilizando o banco de dados mpg, faca um boxplot da variavel displ segregada
# por fl.
ggplot(data = mpg) +
  geom_boxplot(mapping = aes(x = fl, y=displ)) +
  geom_jitter(mapping = aes(x = fl, y=displ, colour = fl), alpha = 0.7) +
  labs(title="Engine displacement, in litres",
       subtitle = "Fuel Economy Data From 1999 To 2008 For 38 Popular Models Of Cars",
       x = NULL,
       y = NULL,
       caption = "e = ethanol, d = diesel, r = regular, p = premium, c = natural gas")

ggsave(filename = "./graficos/Aula 1 - Gafico2.png",
       plot = last_plot(),
       units = "in",
       width = 8, height = 6,
       dpi = 100)
