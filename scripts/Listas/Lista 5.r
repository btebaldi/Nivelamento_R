
# Lista 5 de Nivelamento de R


# Questao 1 ---------------------------------------------------------------
rm(list=ls())

# Carregue o banco de dados ``Boston_Housing_Prices.csv''
library(readr)
Lista_5 <- read_csv("databases/Boston_Housing_Prices.csv", 
                    col_types = cols(
                      X1 = col_double(),
                      crim = col_double(),
                      zn = col_double(),
                      indus = col_double(),
                      chas = col_double(),
                      nox = col_double(),
                      rm = col_double(),
                      age = col_double(),
                      dis = col_double(),
                      rad = col_double(),
                      tax = col_double(),
                      ptratio = col_double(),
                      black = col_double(),
                      lstat = col_double(),
                      medv = col_double()
                    ))
head(Lista_5)

# Determine as estatísticas descritivas do banco.
summary(Lista_5)

plot(Lista_5)

# Faça uma modelo linear dos dados.
mdl <- lm(medv ~ rm, data = Lista_5)

# Mostre um resumo do modelo contendo coeficientes e estatísticas.
summary(mdl)

# Faça um gráfico de dispersão com uma linha representando a reta estimada.

library(ggplot2)
ggplot(data=Lista_5) + 
  geom_point(mapping = aes(x=rm, y=medv)) +
  geom_abline(intercept = mdl$coefficients[1],
              slope = mdl$coefficients[2],
              colour="red")



# Questao 2 ---------------------------------------------------------------
rm(list=ls())

# Carregue o banco de dados;

library(readr)
Painel <- read_csv("databases/Lista5_Painel.csv",
                   col_types = cols(
                     Id = col_double(),
                     country = col_character(),
                     year = col_double(),
                     y = col_double(),
                     y_bin = col_double(),
                     x1 = col_double(),
                     x2 = col_double(),
                     x3 = col_double(),
                     opinion = col_character(),
                     op = col_double()
                   ))


# Determine as estatísticas descritivas do banco.
head(Painel)
summary(Painel)

# Faça uma modelo em painel com efeitos fixos.
library(plm)
fixed <-plm(y ~ x1, data=Painel, index=c("country", "year"), model="within")

# Mostre um resumo do modelo contendo coeficientes e estatísticas.
summary(fixed)

# Questao 3 ---------------------------------------------------------------
rm(list = ls())

# Carregue o banco de dados;
library(readr)
tbl <- read_csv("databases/Lista5_DonnerParty.csv",
                col_types = cols(
                  Age = col_double(),
                  Sex_Male = col_double(),
                  Survived = col_double()
                ))


# Determine as estatísticas descritivas do banco.
head(tbl)
summary(tbl)

# Faça uma modelo logit.
mdl <- glm(Survived ~ Age, family = binomial(link = "logit"), data = tbl)

# Mostre um resumo do modelo contendo coeficientes e estatísticas.
summary(mdl)


# Questao 4 ---------------------------------------------------------------
rm(list = ls())

# Carregue os dados pelo comando
tbl <- read_csv("databases/Lista5_timeSeries.csv",
                col_types = cols(
                  Time = col_double(),
                  Passengers = col_double()
                ))


# Faça um grafico de linhas
library(ggplot2)
ggplot(data = tbl) +
  geom_line(mapping = aes(x=Time, y=Passengers))

# Faça os diagrama de de autocorrelação (ACF) e autocorrelação parcial (PACF)
acf(tbl$Passengers, main="Autocorrelacoes")
pacf(tbl$Passengers, main="Autocorrelacoes Parcial")


# Faca um modelo ARIMA(0,1,1) dos dados
mdl = arima(x = tbl$Passengers, order = c(0,1,1))

# Mostre um resumo dos modelo estimado
mdl

# Questao 5 ---------------------------------------------------------------
rm(list = ls())

# Carregue o banco de dados
library(readxl)
tbl <- read_excel("databases/Lista5_Otimiza.xlsx")

#  Escreva uma funcao que calcula o erro quadrado
erro_sq <- function(beta, y, x){
  ret <- (log(x^beta + 20) - y)^2
  return(ret)
}

#  Escreva uma funcao que calcula a soma dos erros quadrados
SomaErro_sq <- function(beta, y, x){
  ret <- sum(erro_sq(beta, y, x))
  return(ret)
}

# Utilizando a funcao optim com o metodo "BFGS" minimize a funcao de soma dos
# erros quadrados. Como chute inicial coloque beta = 0

beta <- 0

optim(beta, SomaErro_sq,
      method = "BFGS",
      y=tbl$y, x=tbl$x)




