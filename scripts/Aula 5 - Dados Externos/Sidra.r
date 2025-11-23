#' ---
#' title: "R Download de Séries Temporais do IPEADATA via API"
#' author: "Bruno Tebaldi de Queiroz Barbosa"
#' date: "2025-11-23"
#' output: html_document
#' ---

# Install dependencies ----------------------------------------------------
# Install sidrar package if not already installed
if (!require("sidrar")) {
    install.packages("sidrar")
    library(sidrar)
}

# Setup -------------------------------------------------------------------
rm(list = ls())

library(sidrar)
library(ggplot2)

# Dataload ----------------------------------------------------------------

# Download population data for Brazil
tbl <- get_sidra(api = "/t/6691/n1/all/v/2266/p/all")

# View the first few rows
head(tbl)

# Plot the data
tbl %>% 
mutate(Data = lubridate::ymd(`Mês (Código)`, truncated = 1)) %>% 
  ggplot(aes(x = Data, y = Valor)) +
  geom_line() +
  geom_point() +
  labs(title = "População Total do Brasil",
       x = "Ano",
       y = "População") +
  theme_minimal()
