#' ### Exercicio Pratico
#'
#' Autor: Bruno Tebaldi
#'
#' 2021-09-17
#'
#' Utilizando o banco de dados Iris, Crie um gráfico de dispersão das variáveis
#' "Sepal.Length", e "Sepal.Width". De acordo com as seguintes propriedades:


# Setup -------------------------------------------------------------------
rm(list=ls())

# Bibliotecas utilizadas
library(readr)
library(rvest)
library(ggplot2)

# Url para fazer webscrapping
url <- "https://www.worldometers.info/co2-emissions/co2-emissions-by-country/"

# leitura da Pagina
HtmlPage <- read_html(x = url)

# Interpretação da tabela
tbl <- HtmlPage %>%
  html_nodes(xpath='//table[@id="example2"]') %>%
  rvest::html_table()

# Investigação do retorno
class(tbl)
length(tbl)

# Selecao final da tabela
tbl <- tbl[[1]]

# Padronizacao do nome das colunas
colnames(tbl) <- c("Id", "Country",  "CO2", "Year_Change", "Population", "Per_capita", "Share_of_world" )

# Investigando uma funcao para interpretar numeros
??"parse number"

# interpretação dos numeros
for (col in c("CO2", "Year_Change", "Population", "Share_of_world")) {
  tbl[[col]] <- readr::parse_number	(x = tbl[[col]],
                                     na = c("", "NA"),
                                     locale = locale(decimal_mark = ".",  grouping_mark = ","),
                                     trim_ws = TRUE)  
}

# investigando correlacoes
plot(tbl[, c(-1,-2)])
boxplot(tbl[, c(-1,-2)])

boxplot(tbl$CO2)
boxplot(tbl$Year_Change)
boxplot(tbl$Population)

# CO2 e Populacoes estao esprimidos... Variacao muito alta.
tbl$lnCo2 <- log(tbl$CO2)
tbl$lnPop <- log(tbl$Population)

# Boxplot das variaveis transformadas
boxplot(tbl$lnCo2)
boxplot(tbl$lnPop)

# Modelo linear de CO2 contra populacao.
mdl <- lm(lnCo2 ~ lnPop, data=tbl)
summary(mdl)

# Grafico dos dados
ggplot(tbl) + 
  geom_point(aes(y = CO2, x = Population), alpha=0.3, size = 2 , colour="red") + 
  geom_abline(slope = mdl$coefficients[2], intercept = mdl$coefficients[1], colour = "blue", size = 1) +
  labs(title ="CO2 Emissions",
       x="population [log]",
       y='CO2 Emission [log]')

ggplot(tbl) + 
  geom_point(aes(y = lnCo2, x = lnPop), alpha=0.3, size = 2 , colour="red") + 
  geom_abline(slope = mdl$coefficients[2], intercept = mdl$coefficients[1], colour = "blue", size = 1) +
  labs(title ="CO2 Emissions",
       x="population [log]",
       y='CO2 Emission [log]')

