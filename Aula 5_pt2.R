library(readxl)
library(tidyverse)


Industria <- read_excel("databases/Industria.xlsx")


head(Industria)


Industria %>% 
  ggplot() + 
  geom_line(aes(x=Data, y=Industria))


acf(Industria$Industria)

tbl <- Industria %>% mutate(D_Ind = Industria - lag(Industria))

tbl %>% ggplot() + 
  geom_line(aes(x=Data, y=D_Ind))




arima(tbl$Industria, order = c(1, 1, 0))


# AR - Autoregressiva
# I - Integrado (nao estacionario)
# MA - Media Movel
mdl = arima(tbl$D_Ind, order = c(1, 0, 0), include.mean = FALSE)


previsao = predict(mdl, n.ahead = 12)


tbl.com.previsao <- tbl %>%
  add_row(D_Ind = previsao$pred) %>% 
  mutate(periodo = row_number())


tbl.com.previsao$IsPrevisao = 0

tbl.com.previsao$IsPrevisao[175:186] = 1



tbl.com.previsao %>% ggplot() + 
  geom_line(aes(x=periodo, y=D_Ind, colour = factor(IsPrevisao))) +
  labs(x="Data", y="Industria", colour="Legenda")

