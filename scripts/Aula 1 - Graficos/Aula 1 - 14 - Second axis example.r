
# Setup -------------------------------------------------------------------

rm(list=ls())

library(ggplot2)
library(readxl)


# Loadatabse --------------------------------------------------------------

data(economics)

# Grafico dois eixos ------------------------------------------------------

ggplot(data = economics) +
  geom_line(aes(x=date, y=pce, colour= "PIB")) +
  geom_line(aes(x=date, y=uempmed, colour="Desemprego")) +
  labs(title = "Pib e desemprego")  

ggplot(economics) +
  geom_line(aes(x=date, y=pce, colour= "PIB")) +
  geom_line(aes(x=date, y=uempmed*1000, colour="Desemprego")) +
  labs(title = "Pib e desemprego")

ggplot(economics) +
  geom_line(aes(x=date, y=pce, colour= "PIB")) +
  geom_line(aes(x=date, y=uempmed*1000, colour="Desemprego")) +
  scale_y_continuous(sec.axis = sec_axis(~ . / 1000, name = "Desemprego") ) +
  labs(title = "Pib e desemprego") + theme(legend.position="bottom")


ggsave(filename = "./Graficos/Aula 1/14_doisEixos.png",units = "in",
       width = 8, height = 6,dpi = 100)
