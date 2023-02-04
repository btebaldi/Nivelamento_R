#' Author: Bruno Tebaldi de Queiroz Barbosa
#'
#' Data: 2023-02-04
#'
#' Cria um grafico de correlação


# Setup -------------------------------------------------------------------

rm(list=ls())

library(ggplot2)
library(ggcorrplot)


# Load database -----------------------------------------------------------

# Correlation matrix
data(mtcars)
corr <- round(cor(mtcars), 1)


# Grafico -----------------------------------------------------------------
ggcorrplot(corr,
           hc.order = TRUE, 
           type = "upper",
           lab = TRUE, 
           lab_size = 3, 
           show.diag = TRUE,
           method="circle",
           colors = c("tomato2", "white", "springgreen3"), 
           title="Correlogram of mtcars", 
           ggtheme=theme_bw)


ggsave(filename = "./Graficos/Aula 1/15_Correlograma.png",units = "in",
       width = 8, height = 6,dpi = 100)
