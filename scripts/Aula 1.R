
# Setup -------------------------------------------------------------------

rm(list = ls())


# Bibliotecas -------------------------------------------------------------

library(tidyverse)


# Banco de dados ----------------------------------------------------------

mpg


# Exercicios --------------------------------------------------------------

# Execute o comando abaixo, O que voce ve?
ggplot(data = mpg)


# Quantas linhas existem em mtcars? Quantas colunas?
mpg

# Faca um grafico de dispersao de hwy versus cyl.
ggplot(data = mpg) +
  geom_point(mapping = aes(x=hwy, y=cyl))

# O que acontece se voce fizer um grafico de dispersao de classe versus drv? Por
# que esse grafico nao e util?
ggplot(data = mpg) +
  geom_point(mapping = aes(x=class, y=drv))




# Grafico dos slides ------------------------------------------------------

ggplot(data = mpg) + geom_point( mapping = aes( x = displ, y = hwy, color = class))


ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_wrap( ~ class, nrow = 2)


ggplot(data = mpg) + geom_line(mapping = aes(x = displ, y = hwy))

ggplot(data = diamonds) + geom_bar(mapping = aes(x = cut))

ggplot(data = diamonds) + geom_histogram(mapping = aes(x = carat))

ggplot(data = mpg) + geom_boxplot(mapping = aes(x = class, y = hwy))

ggplot(data = mpg) +
  geom_line(mapping = aes(x = displ, y = hwy)) +
  geom_point(mapping = aes(x = displ, y = hwy))

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
  geom_histogram(aes(x=carat)) +
  facet_wrap(~color)


# utilizando o banco de dados diamonds, faca um grafico de dispersao, de carat"
# por price", e colorido pela variaavel color".
ggplot(data = diamonds) +
  geom_point(aes(x=carat, y=price, colour=color))


