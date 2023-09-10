#'
#' Pipe example
#' 
#' Author: Brubo Tebaldi de Queiroz Barbosa
#' 
#' Date: 2022-02-14
#' 
#' Description: Exercicio para motivar a utilizacao do operador Pipe



# Setup -------------------------------------------------------------------

rm(list = ls())
library(dplyr)
library(ggplot2)


# Dataload ----------------------------------------------------------------

data("ChickWeight")


# Sem a utilizacao de Pipe ------------------------------------------------

# Crio uma nova coluna
tbl_1 <- mutate(ChickWeight, ln_weight = log(weight))

# Informa a maneira de se agrupar os dados
tbl_2 <- group_by(tbl_1, Diet)

# Faco um agrupamento
tbl_3 <- summarise(tbl_2, mu.wight = mean(ln_weight),
                   sd.wight = mean(ln_weight),
                   qtd = n())

# A partir dos dados agurpados fa ̧co um grafico
ggplot(tbl_3) + geom_col(aes(x=Diet, y=mu.wight))


# Utilizando o Pipe do tidyverse ------------------------------------------

rm(list = ls())
library(dplyr)
library(ggplot2)


ChickWeight %>%
  mutate(weight = log(weight)) %>%
  group_by(Diet) %>%
  summarise(mu.wight = mean(weight),
            sd.wight = mean(weight),
            qtd = n()) %>%
  ggplot() +
  geom_col(aes(x=Diet, y=mu.wight))

# Utilizando o Pipe do nativo (4.1+) --------------------------------------

rm(list = ls())
library(dplyr)
library(ggplot2)

ChickWeight |>
  mutate(weight = log(weight)) |>
  group_by(Diet) |>
  summarise(mu.wight = mean(weight),
            sd.wight = mean(weight),
            qtd = n()) |>
  ggplot() +
  geom_col(aes(x=Diet, y=mu.wight))
