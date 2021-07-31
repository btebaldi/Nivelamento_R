<<<<<<< HEAD:dev/second axis example.r

# Setup -------------------------------------------------------------------

rm(list=ls())

library(ggplot2)
library(readxl)


# Loadatabse --------------------------------------------------------------

cambio_PIB <- read_excel("databases/cambio_PIB.xlsx")

cambio_PIB$Data <- as.Date(cambio_PIB$Data)

# Grafico dois eixos ------------------------------------------------------

ggplot(data = cambio_PIB) +
  geom_line(aes(x=Data, y=PIB, colour= "PIB")) +
  geom_line(aes(x=Data, y=Cambio, colour="Cambio")) +
  labs(title = "Pib e Cambio")  

ggplot(cambio_PIB) +
  geom_line(aes(x=Data, y=PIB, colour= "PIB")) +
  geom_line(aes(x=Data, y=Cambio*100000, colour="Cambio")) +
  labs(title = "Pib e Cambio")

ggplot(cambio_PIB) +
  geom_line(aes(x=Data, y=PIB, colour= "PIB")) +
  geom_line(aes(x=Data, y=Cambio*100000, colour="Cambio")) +
  scale_y_continuous(sec.axis = sec_axis(~ . / 100000, name = "Cambio") ) +
  labs(title = "Pib e Cambio")

=======

# Setup -------------------------------------------------------------------

rm(list=ls())

library(ggplot2)
library(readxl)


# Loadatabse --------------------------------------------------------------

cambio_PIB <- read_excel("databases/cambio_PIB.xlsx")

cambio_PIB$Data <- as.Date(cambio_PIB$Data)

# Grafico dois eixos ------------------------------------------------------

ggplot(cambio_PIB) +
  geom_line(aes(x=Data, y=PIB, colour= "PIB")) +
  geom_line(aes(x=Data, y=Cambio, colour="Cambio")) +
  labs(title = "Pib e Cambio")  

ggplot(cambio_PIB) +
  geom_line(aes(x=Data, y=PIB, colour= "PIB")) +
  geom_line(aes(x=Data, y=Cambio*100000, colour="Cambio")) +
  labs(title = "Pib e Cambio")

ggplot(cambio_PIB) +
  geom_line(aes(x=Data, y=PIB, colour= "PIB")) +
  geom_line(aes(x=Data, y=Cambio*100000, colour="Cambio")) +
  scale_y_continuous(sec.axis = sec_axis(~ . / 100000, name = "Cambio") ) +
  labs(title = "Pib e Cambio")

>>>>>>> fc7889d21d9e600b1d6dc93a4f54f2a9e51c7490:scripts/Aula 1 - Second axis example.r
