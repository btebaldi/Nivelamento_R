#' ---
#' title: "Time Series - objeto ts()"
#' author: "Bruno Tebaldi de Queiroz Barbosa"
#' date: "2023-02-04"
#' output: html_document
#' ---

# Setup -------------------------------------------------------------------
rm(list = ls())

library(readxl)
library(ggplot2)
library(dplyr)
library(forecast)

# Load Databse ------------------------------------------------------------

dados <- readxl::read_excel(path = "./scripts/Aula 5 - Time Series/database/Industria.xlsx")
head(dados)


# Data normalization ------------------------------------------------------

dados$Data = as.Date(dados$Data)
dados = dados %>% arrange(Data)


# Grafico -----------------------------------------------------------------

ggplot(dados) + 
  geom_line(mapping = aes(x=Data, y=Industria))



# Times Series Object -----------------------------------------------------

Industria_ts = ts(dados$Industria, start=c(2003,1),end=c(2017,6),frequency=12)
Industria_ts


# Modelo Arima ------------------------------------------------------------

mdl <- forecast::auto.arima(y = Industria_ts, stepwise = TRUE, trace = TRUE)

print(mdl)

mdl <- forecast::Arima(y = Industria_ts, order = c(12,1,0))

# Previsao ----------------------------------------------------------------

mdl.previsao = predict(mdl, n.ahead=12, se.fit = TRUE)

dados.new <- dados %>%
  mutate(se = NA) %>%
  add_row(Industria = mdl.previsao$pred,
          Data = lubridate::date_decimal(as.numeric(time(mdl.previsao$pred))),
          se = mdl.previsao$se,
          .before = NULL, .after = NULL)


ggplot(dados.new) +
  geom_line(mapping = aes(x=Data, y=Industria, colour = is.na(se))) +
  geom_ribbon(mapping = aes(ymin = Industria - se,
                            ymax = Industria + se, x = Data),
              fill = "blue", alpha=0.2) 






