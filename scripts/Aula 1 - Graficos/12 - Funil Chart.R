#' Author: Bruno Tebaldi de Queiroz Barbosa
#'
#' Data: 2023-02-04
#'
#' Cria um grafico do tipo funil


# Setup -------------------------------------------------------------------

rm(list = ls())


# Bibliotecas -------------------------------------------------------------
library(tidyverse)


# Banco de dados ----------------------------------------------------------

# Read data
tbl <- readRDS("./databases/Aula 1/email_campaign_funnel.rds")

# troca o valor dos Males para negativo
tbl$Users[tbl$Gender == "Male"] = -tbl$Users[tbl$Gender == "Male"]



# Grafico -----------------------------------------------------------------


ggplot(data = tbl) + 
  geom_col(mapping = aes(y = Stage, x = Users, fill = Gender), width = .6) + 
  labs(title = "Email Campain Funnel") + 
  scale_x_continuous(breaks = c(-15000000, -10000000, -5000000,
                                0,
                                15000000, 10000000, 5000000),
                     labels = c("15m", "10m", "5m", "0", "15m", "10m", "5m"))


ggsave(filename = "./Graficos/Aula 1/13_Funil.png",units = "in",
       width = 8, height = 6,dpi = 100)

