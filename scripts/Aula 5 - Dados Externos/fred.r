#' ---
#' title: "R Download de Séries Temporais do FRED via API"
#' author: "Bruno Tebaldi de Queiroz Barbosa"
#' date: "2025-11-23"
#' output: html_document
#' ---

# Setup -------------------------------------------------------------------
rm(list = ls())

library(fredr)
library(ggplot2)


# Busca de dados ----------------------------------------------------------

# FRED API Key
Fred_Key <- "60b57cb1c055b9b6bde8f220161655c2"

# Set the FRED API key
fredr::fredr_set_key(Fred_Key)

# Get GDP Data
tbl <- fredr::fredr(series_id = "GDP",
                    observation_start = as.Date("1949-01-01"),
                    observation_end = as.Date("2024-01-01") )

# Generate a simple line plot
ggplot(tbl) + 
  geom_line(aes(x = date, y = value))
