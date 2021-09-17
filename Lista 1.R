
# Questao 1 ---------------------------------------------------------------
#' ### Questao 1

#' Utilizando o banco de dados Iris, Crie um gráfico de dispersão das variáveis
#' "Sepal.Length", e "Sepal.Width". De acordo com as seguintes propriedades:
#' 
#' - A variável "Sepal.Length" deve ser colocada no eixo x;
#' - A variável "Sepal.Width" deve ser colocada no eixo y; 
#' - Cada ponto deve ser colorido baseado na variável "Species"
#' - O titulo do gráfico deve ser "Sepal Length vs Sepal Width" 
#' - O subtitulo do 'Iris Database' 
#' - O caption do gráfico deve ser 'Fonte: Iris database (R-Studio)' 
#' - O nome do eixo x deve ser "Sepal Length" 
#' - O nome do eixo y deve ser "Sepal Width"


# Setup Questao 1 ---------------------------------------------------------
rm(list = ls())


library(ggplot2)
 
ggplot(iris)+
   geom_point(aes(x = Sepal.Length,
                 y = Sepal.Width,
                 colour = Species)) +
  labs(title = "Sepal Length vs Sepal Width",
       subtitle = "Iris Database",
       caption = "Fonte: Iris database (R-Studio)",
       y="Sepal Width",
       x="Sepal Length",
       color="legenda"
  )

# Questao 2 ---------------------------------------------------------------
#' ### Questao 2

#'  Utilizando o banco de dados airquality, Crie um gráfico de barras da
#'  variável "Temp". De acordo com as seguintes propriedades:
#'
#'  - A cor da borda das barras deve ser preta (colour="black")
#' - A cor da barras deve ser azul (fill="blue")
#' - A barra deve ter transparência de 50\% (alpha=0.5)
#' - O titulo do gráfico deve ser "New York Air Quality Measurements"
#' - O subtitulo deve ser nulo (subtitle = NULL)
#' - O caption do gráfico deve ser 'Fonte: airquality database (R-Studio)'
#' - O nome do eixo x deve ser "Temperatura [F]"
#' - O nome do eixo y deve ser "Qtd"

# Setup Questao 2 ---------------------------------------------------------
rm(list = ls())
library(ggplot2)

ggplot(airquality) +
  geom_bar(aes(x=Temp), colour="black", fill="blue", alpha=0.5) +
  labs(title = "New York Air Quality Measurements",
       subtitle = NULL,
       caption = "Fonte: airquality database (R-Studio)",
       y="Qtd",
       x="Temperatura [F]"
  )

# Questao 3 ---------------------------------------------------------------
#' ### Questao 3

#'Utilizando o banco de dados diamonds (para isso carregue a biblioteca
#'ggplot2), crie um histograma da variável "Carat". De acordo com as seguintes
#'propriedades:
#'
#' - A cor do histograma deve ser azul (fill="blue")
#' - O histograma deve ter transparência de 50% (alpha=0.5)
#' - A variável y deve mostrar a densidade (y=..density..)
#' - O histograma deve ter 50 *bins*
#' - O histograma deve ter facetas (*Facets*) por "cut"
#' - O titulo do gráfico deve ser "Carat of round cut diamonds"
#' - O subtitulo deve ser "Facet by cut"

# Setup Questao 3 ---------------------------------------------------------
rm(list = ls())
library(ggplot2)

ggplot(diamonds) +
  geom_histogram(aes(x=carat, y=..density..),
                 fill="blue", alpha= 0.5, bins = 50) +
  facet_wrap(~cut) +
  labs(title = "Carat of round cut diamonds",
       subtitle = "Facet by cut")

# Questao 4 ---------------------------------------------------------------
#' ### Questao 4

#' Primeiramente vamos converter o banco de dados "AirPassengers" para um
#' data.frame.
#' 
#' - O nome do banco convertido será "data"
#' - Vamos nomear a coluna do banco "data" de "Passengers"
#' - Vamos criar uma nova coluna chamado "date" com as datas associadas.
#' - Vamos converter os dados da coluna "Passengers" para o tipo "numeric"


# Setup Questao 4 ---------------------------------------------------------
rm(list = ls())

data <- as.data.frame(AirPassengers)
colnames(data) <- "Passengers"
data$date <- seq(from=as.Date("1949-01-01"), to=as.Date("1960-12-01"), by="month")
data$Passengers <-  as.numeric(data$Passengers)


#' Utilizando o banco de dados convertido, crie um gráfico de linha de acordo
#' com as seguintes propriedades:
#' 
#' - O eixo x deve conter a variável "date"
#' - O eixo y deve conter a variável "Passengers"
#' - Adicione uma linha, de cor vermelha, com intercept = 760, slope = 0.087
#' - Adicione os seguintes elementos gráficos:
#'   - title="title = "Monthly Airline Passenger Numbers 1949-1960";
#'   - eixo y ="Passengers";
#'   - eixo x="Data"

ggplot(data) +
  geom_line(aes(x=date, y=Passengers)) +
  geom_abline(intercept = 760, slope = 0.087, colour= "red") +
  labs(title = "Monthly Airline Passenger Numbers 1949-1960",
       y="Passengers",
       x="Data")


# Questao 5 ---------------------------------------------------------------
#' ### Questao 5


#' Utilizando o banco de dados mtcars, crie um gráfico de dispersão colocando a
#' variável "hp" no eixo x e a variável "mpg" no eixo y. De acordo com as
#' seguintes propriedades:
#' 
#' - O titulo do gráfico deve ser "Scatter plot"
#' - O nome do eixo x deve ser "Weight (1000 lbs)"
#' - O nome do eixo y deve ser "Miles/(US) gallon"
#' - Deve conter uma linha de regressão linear que aproxima os dados
#'  ("geom_smooth(method=lm)") tracejada (linetype="dashed") com
#'   preenchimento em azul (fill="blue")
#' - O tema aplicado deve retirar os *grids* ("theme(panel.background = element_blank())")

# Setup Questao 4 ---------------------------------------------------------
rm(list = ls())

library(ggplot2)
data("mtcars")
df <- mtcars

 
plot <- ggplot(mtcars, aes(x=hp, y=mpg)) +
  geom_point()+
  geom_smooth(method=lm, linetype="dashed"
              , fill="blue") +
  labs(title = "Scatter plot",
       y="Miles/(US) gallon",
       x="Weight (1000 lbs)")

plot + theme(panel.background = element_blank())
