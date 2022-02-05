library(ggplot2)
library(ggcorrplot)

# Correlation matrix
data(mtcars)
corr <- round(cor(mtcars), 1)

# Plot
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
