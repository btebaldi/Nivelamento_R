#'
#' Pipe example
#' 
#' Author: Brubo Tebaldi de Queiroz Barbosa
#' 
#' Date: 2022-02-14
#' 
#' Description: Exercicio para motivar a utilizacao do operador Pipe



# Setup -------------------------------------------------------------------

rm(list = ls())

library(readxl)
library(dplyr)
library(lubridate)
library(ggplot2)




# Dataload ----------------------------------------------------------------

ITUB <- read_excel("P:/Teo/ITUB BBDC.xlsx", 
                   sheet = "Worksheet",
                   col_names = TRUE, 
                   col_types = c("date", "numeric", "numeric"), 
                   range = cell_limits(ul = c(7, 1), lr = c(NA, 3)),
                   na = "na")


BBDC <- read_excel("P:/Teo/ITUB BBDC.xlsx", 
                   sheet = "Worksheet",
                   col_names = TRUE, 
                   col_types = c("date", "numeric", "numeric"), 
                   range = cell_limits(ul = c(7, 5), lr = c(NA, 7)),
                   na = "na")



# Data regularization & Data preparation ----------------------------------

# Normaliza colunas de datas
ITUB$Date <- as.Date(ITUB$Date)
BBDC$Date <- as.Date(BBDC$Date)

# calcula ao range de datas a ser trabalhado
mRangex <- range(c(ITUB$Date, BBDC$Date), na.rm = TRUE)

# Cria uma tabela com todos os dados
tbl <- tibble(Date = seq(from = mRangex[1], to = mRangex[2], by = 1))
tbl <- tbl |> mutate(WeekDay = wday(Date))
tbl <- tbl |>
  left_join(ITUB, by=c("Date")) |> 
  select(Date, WeekDay, ITUB = PX_LAST, ITUB_VOL = PX_VOLUME) |> 
  left_join(BBDC, by=c("Date")) |> 
  select(Date, WeekDay, ITUB, ITUB_VOL, 
         BBDC = PX_LAST, BBDC_VOL = PX_VOLUME)

# limpeza de variaveis nao mais utilizadas
rm(list = c("BBDC", "ITUB", "mRangex"))


# User defined function ---------------------------------------------------

CalculaRetorno = function(x){
  ret <- x/lag(x)
  return(ret)
}

# opcao de implementacao 1 ------------------------------------------------

tbl_1 <- filter(tbl, !is.na(BBDC) &  !is.na(ITUB))
tbl_2 <- arrange(tbl_1, Date)
tbl_3 <- select(tbl_2, ITUB, BBDC)
tbl_4 <- mutate(tbl_3, r_ITUB = CalculaRetorno(ITUB), r_BBDC = CalculaRetorno(BBDC))
tbl_5 <- select(tbl_4, r_ITUB, r_BBDC)
tbl_6 <- na.omit(tbl_5)
cov(tbl_6)


# opcao de implementacao 2 ------------------------------------------------

cov(na.omit(select(mutate(select(arrange(filter(tbl, !is.na(BBDC) &  !is.na(ITUB)), Date), ITUB, BBDC), r_ITUB = CalculaRetorno(ITUB), r_BBDC = CalculaRetorno(BBDC)), r_ITUB, r_BBDC)))

# opcao de implementacao 2 ------------------------------------------------


tbl |> 
  filter(!is.na(BBDC) &  !is.na(ITUB)) |> 
  arrange(Date) |> 
  select(ITUB, BBDC) |> 
  mutate(r_ITUB = CalculaRetorno(ITUB), r_BBDC = CalculaRetorno(BBDC)) |> 
  select(r_ITUB, r_BBDC) |> 
  na.omit() |> 
  cov()

