

# Setup -------------------------------------------------------------------

# Limpeza do ambiente
rm(list = ls())

library(readxl)
library(ggplot2)
library(dplyr)
library(lubridate)

# Carregar banco de dados ----------------------------------------------

IBOV <- read_excel("databases/Aula 5/IBOV.xlsx", 
                   col_types = c("date", "numeric", "numeric"), 
                   na = "#N/A N/A", skip = 1)


colnames(IBOV) = c("Date", "IBOV", "Vol_IBOV")

# head(IBOV)
# 
# 
# IBOV %>% 
# ggplot() + geom_line(aes(x=Date, y=LastPrice))
# 
# IBOV %>% filter(is.na(LastPrice))
# 
# summary(IBOV)



SPX <- read_excel("databases/Aula 5/SPX.xlsx", 
                  col_types = c("date", "numeric", "numeric"), 
                  na = "#N/A N/A",
                  skip = 1)


colnames(SPX) = c("Date", "SPX", "Vol_SPX")



# Iportacao de dados do WTI -----------------------------------------------


for (ano in 2015:2021) {
  
  file_name <- paste("databases/Aula 5/WTI_", ano, ".xlsx",sep = "")
  
  WTI_aux <- read_excel(file_name, 
                        col_types = c("date", "numeric", "numeric"), 
                        na = "#N/A N/A",
                        skip = 1)
  
  # incrementando - opcao 1
  if(ano == 2015){
    WTI_FULL = WTI_aux
  } else{
    WTI_FULL <- WTI_FULL %>% bind_rows(WTI_aux)
  }
  
  # assign(x=paste("WTI_", ano, sep = ""), value = WTI_aux)
  
}


# WTI_FULL %>% count(Date) %>% summary()


rm(list = c("ano", "file_name", "WTI_aux"))


colnames(WTI_FULL) = c("Date", "WTI", "Vol_WTI")

# Ajuste de Data e hora ---------------------------------------------------


SPX$Date <- as.Date(SPX$Date)
IBOV$Date <- as.Date(IBOV$Date)
WTI_FULL$Date <- as.Date(WTI_FULL$Date)

head(SPX)
head(IBOV)


# Selecao de colunas ------------------------------------------------------

IBOV <- IBOV %>% select(-starts_with("Vol"))
SPX <- SPX %>% select(-starts_with("Vol"))
WTI_FULL <- WTI_FULL %>% select(-starts_with("Vol"))


summary(IBOV)
summary(SPX)
summary(WTI_FULL)



tabela <- tibble(Datas = seq(from = as.Date("2015-01-02"),
                   to = as.Date("2021-12-31"),
                   by = "day"))
       
       
tabela <- tabela %>% mutate(Wday = wday(Datas)) 

tabela 
     
       

# Juncao do banco de dados ------------------------------------------------


tabela <- tabela %>%
  left_join(IBOV, by = c("Datas"="Date")) %>% 
  left_join(SPX, by = c("Datas"="Date")) %>% 
  left_join(WTI_FULL, by = c("Datas"="Date"))



# Retirando Sabado (7) e Domingo (1)
tabela <- tabela %>% filter(Wday %in% c(2,3,4,5,6))

summary(tabela)
# OPC 1 - Trabalhar apenas com dados completos
tabela2 <- na.omit(tabela)
summary(tabela2)

# OPC 2 - repetir ultima observacao

# na.locf - Last Observation Caried Forward
# library(zoo)
# tabela$IBOV <- zoo::na.locf(tabela$IBOV)
# tabela$SPX <- zoo::na.locf(tabela$SPX)
# tabela$WTI <- zoo::na.locf(tabela$WTI)
# summary(tabela)

# OPC 3 - Intepolacao 
# linear
# Nivel estocastico - Filtro de kalman
# replicar a taxa de variacao


# OPC4 - Colocar a Media dos dados
# ou media movel

# tabela$SPX[is.na(tabela$SPX)] <- mean(tabela$SPX)

# OPC5 - retirar os incompletos (100%) e depois usar o zoo

# tabela3 <- tabela %>% filter( !(is.na(IBOV) & is.na(SPX) & is.na(WTI)) )
# 
# tabela3$IBOV <- zoo::na.locf(tabela3$IBOV)
# tabela3$SPX <- zoo::na.locf(tabela3$SPX)
# tabela3$WTI <- zoo::na.locf(tabela3$WTI)


# VAMOS UTILIZAR A OPC3
library(zoo)
tabela$IBOV <- zoo::na.locf(tabela$IBOV)
tabela$SPX <- zoo::na.locf(tabela$SPX)
tabela$WTI <- zoo::na.locf(tabela$WTI)
summary(tabela)


tabela %>% count(WTI < 0)

# Tratando o preco negativo
# previsao utilizando o Brent
# previsao utilizando outras variaveis (linear, pca, etc)

tabela %>% filter(WTI < 0)

tabela %>% filter(Datas >= "2020-04-17")

novo_valor <- (tabela$WTI[ tabela$Datas == "2020-04-17" ] + tabela$WTI[ tabela$Datas == "2020-04-21" ])/2


tabela$WTI[ tabela$Datas == "2020-04-20" ] <- novo_valor

summary(tabela)




# Passando o log ----------------------------------------------------------

tabela <- tabela %>% select(-Wday) %>%
  mutate_if(.predicate = is.numeric, .funs = log)

TiraDiff <- function(x){
  
  ret <- x - lag(x)
  
  return(ret)
}


tabela <- tabela %>%
  mutate_if(.predicate = is.numeric, .funs = TiraDiff) %>%
  na.omit()




mdl = arima(tabela$IBOV, order = c(1, 0, 0), include.mean = TRUE,
            xreg = tabela[, c("SPX", "WTI")])


mdl



       