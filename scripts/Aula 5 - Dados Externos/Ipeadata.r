
#' ---
#' title: "R Download de Séries Temporais do IPEADATA via API"
#' author: "Bruno Tebaldi de Queiroz Barbosa"
#' date: "2025-11-23"
#' output: html_document
#' ---

# Setup -------------------------------------------------------------------
rm(list = ls())

library(jsonlite)
library(dplyr)
library(ggplot2)

# User defined function ---------------------------------------------------

# Function to get time series data from IPEADATA API
Get_IpeaData <- function(Serie.code){
  url.mask <- "http://www.ipeadata.gov.br/api/odata4/Metadados('%s')/Valores"
  
  url <- sprintf(url.mask, Serie.code)
  tbl <- jsonlite::fromJSON(url)
  
  tbl <- tbl$value %>%
    as_tibble() %>%
    transmute(Data=as.Date(VALDATA), Valor = VALVALOR)
  
  return(tbl)
}

# Function to get metadata from IPEADATA API
Get_IpeaData_Metadados <- function(){
  url <- "http://www.ipeadata.gov.br/api/odata4/Metadados"
  
  Metadados <- jsonlite::fromJSON(url)
  Metadados <- Metadados$value %>% as_tibble()
  
}

# Dataload ----------------------------------------------------------------

tbl.metadados <- Get_IpeaData_Metadados()

head(tbl.metadados)

tbl.metadados %>% 
  filter(grepl("PIB", SERCODIGO, ignore.case = TRUE))

tbl <- Get_IpeaData("BM12_PIB12")

head(tbl)

tbl %>% 
  ggplot(aes(x = Data, y = Valor)) +
  geom_line() +
  geom_point() +
  labs(title = "Produção de Soja - Brasil",
       x = "Data",
       y = "Valor") +
  theme_minimal()
