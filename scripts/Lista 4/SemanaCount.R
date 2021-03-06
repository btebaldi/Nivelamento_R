# Script da lista 4
# Ultima atualizacao dia 2021-03-06
# 
# Autor: Bruno Tebaldi
# FGV-EESP
# Nivelamento de R

library(dplyr)
library(lubridate)

SemanaCount <- function(vetor_datas){
  
  # inicializa uma tabela com a informacao das datas e duas colunas
  tbl <- data.frame(date=unique(vetor_datas),
                    weekday = as.integer(NA),
                    week = as.integer(NA))
  
  # Adiciona a informacao de dia da semana as datas
  tbl$weekday <- lubridate::wday(tbl$date)
  
  # Organiza os dados
  tbl <- tbl %>%  arrange(date)
  
  for(row in 1:nrow(tbl)){ 
    if(row == 1){
      # Se e a primeira linha da tabela inicializa o contador
      ncont = 1
    } else if (tbl$weekday[row] == 1){
      # Se nao for a primeira linha e for domingo, incrementa o contador.
      ncont = ncont+1
      
      # Verifica se a data de ontem  ́e sequencial com a data de hoje, 
      # basicamente verifica que nao tem datas ausentes.
      if(tbl$date[row] != tbl$date[row-1]+1){
        cat(sprintf("Data nao prevista: %s", tbl$date[row]))
        break
      }
    }
    
    # indica a qual semana a data pertence.
    tbl$week[row] <- ncont
  }
  
  # retorna um data.frame com as datas, o dia da semana e a contagem progressiva
  # das semanas
  return(tbl)
}

# teste = rev(seq(from = as.Date("2020-01-01"), to = as.Date("2020-01-12"), by = 1))
# vetor_datas = teste
# SemanaCount(c(teste, teste))

