
# Setup -------------------------------------------------------------------
rm(list = ls())

library(readxl)
library(ggplot2)
library(mFilter)


# Carrega banco de dados --------------------------------------------------

db <- read_excel("C:/Users/Teo/Downloads/Unemployment.xlsx")
head(db)



# Graficos ----------------------------------------------------------------

# grafico com um unico eixo
ggplot(data = db) +
  geom_line(mapping = aes(x=Data, y=Unemploy)) +
  geom_line(mapping = aes(x=Data, y=`Ibc-Br`)) +
  labs()



# grafico com dois eixos
ggplot(data = db) + 
  geom_line(mapping = aes(x=Data, y=Unemploy), colour="Red") +
  geom_line(mapping = aes(x=Data, y=`Ibc-Br`/10), colour="Blue") +
  scale_y_continuous(name = "Unemployment (red)", 
                     sec.axis = sec_axis(~.*10,
                                         name = "Ibc-Br (Blue)", 
                                         # labels = function(b) { paste0(round(b * 100, 0), "%")}
                     )) + 
  labs(title = "Ibc-Br vs Desemprego",
       x=NULL)

