# Script para a execucao da lista 4
# Ultima atualizacao dia 2021-03-06
# 
# Autor: Bruno Tebaldi
# FGV-EESP
# Nivelamento de R


# Setup -------------------------------------------------------------------
# Clear all
rm(list = ls())

# library
library(dplyr)
library(ggplot2)


# Download do arquivo da Internet -----------------------------------------
source("./scripts/Lista 4/Download_file.r")

# Funcoes -----------------------------------------------------------------
source("./scripts/Lista 4/SemanaCount.R")

# Data Loader -------------------------------------------------------------
source("./scripts/Lista 4/DataLoader.r")


# Main  -------------------------------------------------------------
tbl.semanas <- SemanaCount(covid_data.filter$date)

# Faca um inner join com a dates_table e determine a semana
covid_data <- dplyr::left_join(covid_data.filter, tbl.semanas, by=c("date"="date"))

# Agrupe os dados por location e semana
covid_data.grouped <- dplyr::group_by(covid_data, location, week)

# faca um resumo do total de casos, e novos casos (utilize a soma)
covid_data.grouped <- dplyr::summarise(covid_data.grouped,
                                       total = sum(total_cases, na.rm = TRUE),
                                       new = sum(new_cases, na.rm = TRUE))

# exclua a ultima semana
covid_data.grouped <- filter(covid_data.grouped, week != max(week))


# Camada do Usuario -------------------------------------------------------

g1 <- ggplot(covid_data.grouped) +
  geom_line(mapping = aes(x=week, y=total, colour=location))

g2 <- ggplot(covid_data.grouped) +
  geom_line(mapping = aes(x = week, y = new, colour=location)) +
  geom_point(mapping = aes(x = week, y = new, colour=location))

ggsave(filename = "grafico 1 - covid19.png",
       path = "Graficos",
       plot = g1,
       scale=1, units = "in", dpi = 300, width = 10.4, height = 5.85)

ggsave(filename = "grafico 2 - covid19.png",
       path = "Graficos",
       plot = g2,
       scale=1, units = "in", dpi = 300, width = 10.4, height = 5.85)














