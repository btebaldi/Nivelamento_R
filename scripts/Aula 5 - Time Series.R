
# Setup -------------------------------------------------------------------
rm(list = ls())

library(readxl)
library(ggplot2)
library(dplyr)

# Load Databse ------------------------------------------------------------

dados <- readxl::read_excel(path = here::here("./databases/Industria.xlsx"))
head(dados)


# Data normalization ------------------------------------------------------

dados$Data = as.Date(dados$Data)
dados = dados %>% arrange(Data)


# Grafico -----------------------------------------------------------------

ggplot(dados) + 
  geom_line(mapping = aes(x=Data, y=Industria))



# Times Series Object -----------------------------------------------------

dados$TimeSeries = ts(dados$Industria, start=c(2003,1),end=c(2017,6),frequency=12)
dados$TimeSeries



# ACF e PACF --------------------------------------------------------------
acf(dados$Industria,
    lag.max = NULL,
    main="Autocorrelacoes")

pacf(dados$Industria,
     lag.max = NULL,
     main="Autocorrelacoes Parcial")


# Estabiliza --------------------------------------------------------------

# Tira a primeira diferenca da serie e elimina a primeira entrada
dados2 = mutate(dados, ln_Ind = log(Industria),
                Diferenca = Industria - lag(Industria),
                Dln_Ind = ln_Ind - lag(ln_Ind)) %>%
  filter(row_number() > 1) %>% 
  mutate(periodo = row_number())


# Grafico dos dados em primeira diferenca ---------------------------------

ggplot(dados2) + 
  geom_line(mapping = aes(x=Data, y=Diferenca))


# ACF e PACF dos dados em primeira diferenca ------------------------------

acf(dados2$Dln_Ind,
    lag.max = NULL,
    main="Autocorrelacoes")

pacf(dados2$Dln_Ind,
     lag.max = NULL,
     main="Autocorrelacoes Parcial")


# Modelo Arima ------------------------------------------------------------

# Como truncou na FACP 2 foi na defasagem 1, sugere um AR(1)
mdl.arima_1 = arima(x = dados2$Dln_Ind,
                    order = c(1,0,0),
                    include.mean = TRUE)
mdl.arima_1


# coeficiente da constante nao eh significativo. Estimar AR(1) sem constante
mdl.arima_2 = arima(x = dados2$Dln_Ind,
                    order = c(1,0,0),
                    include.mean = TRUE,
                    fixed=c(NA,0))
mdl.arima_2

# OUTRO METODO
mdl.arima_2.1 = arima(x = dados2$Dln_Ind,
                      order = c(1,0,0),
                      include.mean = FALSE)
mdl.arima_2.1

# OUTRO METODO: FIXA A CONSTANTE EM ZERO
mdl.arima_2.2 = arima(x = dados2$ln_Ind,
                      order = c(1,1,0),
                      include.mean = FALSE)
mdl.arima_2.2


# ACF e FACP dos residuos -------------------------------------------------

# Gerar os graficos da FAC e da FACP 
acf(mdl.arima_2$residuals,
    lag.max = NULL,
    main="Autocorrelacoes")

pacf(mdl.arima_2$residuals,
     lag.max = NULL,
     main="Autocorrelacoes Parcial")

dados2$Residuals = mdl.arima_2$residuals
dados2 = dados2 %>% mutate(pred = Dln_Ind - Residuals)

ggplot(dados2) +
  geom_line(aes(x = Data, y = Residuals))

# Teste Ljung-Box ---------------------------------------------------------

# Teste Ljung-Box para autocorrelacao dos residuos
box <- Box.test(dados2$Residuals,
                lag=24,
                type='Ljung')

print(box)



# Previsao ----------------------------------------------------------------
require(lubridate)

mdl.arima_2.previsao = predict(mdl.arima_2, n.ahead=12, se.fit = TRUE)

dados3 <- dados2 %>% mutate(se = NA) %>% add_row(
  pred = mdl.arima_2.previsao$pred,
  se = mdl.arima_2.previsao$pred,
  .before = NULL, .after = NULL)


dados3$ln_Pred.Nivel = as.numeric(NA)
dados3$Pred.Nivel = as.numeric(NA)
dados3$ln_Pred.Nivel_sup = as.numeric(NA)
dados3$ln_Pred.Nivel_inf = as.numeric(NA)
dados3$Pred.Nivel_sup = as.numeric(NA)
dados3$Pred.Nivel_inf = as.numeric(NA)
for (i in 173:nrow(dados3)) {
  if(i == 173){
    dados3$ln_Pred.Nivel[i] = dados3$ln_Ind[i]
    dados3$ln_Pred.Nivel_sup[i] = dados3$ln_Pred.Nivel[i]
    dados3$ln_Pred.Nivel_inf[i] = dados3$ln_Pred.Nivel[i]
  } else {
    dados3$ln_Pred.Nivel[i] = dados3$ln_Pred.Nivel[i-1] + dados3$pred[i]
    
    dados3$ln_Pred.Nivel_sup[i] = dados3$ln_Pred.Nivel_sup[i-1] + dados3$pred[i] + 1.95*dados3$se[i]
    dados3$ln_Pred.Nivel_inf[i] = dados3$ln_Pred.Nivel_inf[i-1] + dados3$pred[i] - 1.95*dados3$se[i]
  }
  dados3$Pred.Nivel[i] = exp(dados3$ln_Pred.Nivel[i])
  
  dados3$Pred.Nivel_sup[i] = exp(dados3$ln_Pred.Nivel_sup[i])
  dados3$Pred.Nivel_inf[i] = exp(dados3$ln_Pred.Nivel_inf[i])
}

dados3 <- mutate(dados3, periodo=row_number())

ggplot(dados3) +
  geom_line(mapping = aes(x=periodo, y=Industria)) +
  geom_line(mapping = aes(x=periodo, y=Pred.Nivel), color="red") +
  geom_ribbon(mapping = aes(ymin = Pred.Nivel_inf,
                            ymax = Pred.Nivel_sup, x = periodo),
              fill = "blue", alpha=0.2) 






