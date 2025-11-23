#' ---
#' title: "R Download de Séries Temporais do Banco Central do Brasil (BCB) via API"
#' author: "Bruno Tebaldi de Queiroz Barbosa"
#' date: "2025-11-23"
#' output: html_document
#' ---

# Setup -------------------------------------------------------------------
rm(list = ls())

library(jsonlite)
library(dplyr)
library(ggplot2)

# User Defined Function ---------------------------------------------------
Get_SerieFromSGS <- function(Serie.Id, data.ini, data.fim){
  
  url.mask <- "https://api.bcb.gov.br/dados/serie/bcdata.sgs.%s/dados?formato=%s&dataInicial=%s&dataFinal=%s"
  url <- sprintf(url.mask, Serie.Id, "json",
                 format(x = as.Date(data.ini), "%d/%m/%Y"),
                 format(x = as.Date(data.fim), "%d/%m/%Y") )
  
  
  #  diretorio de download
  tbl.json <- jsonlite::fromJSON(url)
  
  tbl <- tbl.json |>
    as_tibble() |>
    transmute(Data = as.Date(data, format = "%d/%m/%Y"),
              Valor = as.numeric(valor))
  
  tail(tbl)
  tbl$Data <- as.Date(tbl$Data)
  
  return(tbl)
}

# Download dos dados ------------------------------------------------------

# 24363	Índice de Atividade Econômica do Banco Central (IBC-Br)
# 24364	Índice de Atividade Econômica do Banco Central (IBC-Br) - com ajuste sazonal
Serie.Id <- 24364

tbl <- Get_SerieFromSGS(Serie.Id, "2021-02-03", "2025-02-03")

head(tbl)

ggplot(tbl, aes(x = Data, y = Valor)) +
  geom_line() +
  geom_point() +
  labs(title = "Índice de Atividade Econômica do Banco Central (IBC-Br) - com ajuste sazonal",
       x = "Data",
       y = "Valor") +
  theme_minimal()

# 11 : Selic
Get_SerieFromSGS(11, "2016-02-03", "2025-02-03") %>% 
  ggplot(aes(x = Data, y = Valor)) +
  geom_line() +
  geom_point() +
  labs(title = "Taxa Selic",
       x = "Data",
       y = "Valor (%)") +
  theme_minimal()
