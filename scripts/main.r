# Script logic


# Setup -------------------------------------------------------------------

# Clear all
rm(list = ls())

library(dplyr)
library(ggplot2)


# Funcoes -----------------------------------------------------------------

source("./lib/get_weekNumber.R")

# Data Loader -------------------------------------------------------------

source("./lib/Dataloader.r")

dates_table <- get_weekNumber(covid_data$date)

# Faça um inner join com a dates_table e determine a semana
covid_data <- dplyr::left_join(covid_data, dates_table, by=c("date"="date"))


# Agrupe os dados por location e semana
covid_data.grouped <- dplyr::group_by(covid_data, location, week)

# faça um resumo do total de casos, e novos casos (utilize a soma)
covid_data.grouped <- dplyr::summarise(covid_data.grouped, total = sum(total_cases, na.rm = TRUE), new = sum(new_cases, na.rm = TRUE))


# exclua a ultima semana
covid_data.grouped <- filter(covid_data.grouped, week != max(week))



# Camada do usuário -------------------------------------------------------

g1 <- ggplot(covid_data.grouped) + 
  geom_line(aes(x=week,
                y=total,
                colour=location))

g2 <- ggplot(covid_data.grouped) + 
  geom_line(aes(x = week,
                y = new, colour=location)) +
  geom_point(aes(x = week,
                 y = new, colour=location))


ggsave(filename = "grafico 1.png",
       path = "Graficos",
       plot = g1,
       scale=1, units = "in", dpi = 300,
       width = 10.4, height = 5.85)

ggsave(filename = "grafico 2.png",
       path = "Graficos",
       plot = g2,
       scale=1, units = "in", dpi = 300,
       width = 10.4, height = 5.85)
