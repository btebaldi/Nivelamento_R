

library(dplyr)


AmandaMeDeveUmCafe <- function(dados){

  retorno = dados %>%
    dplyr::group_by(CODMUN_IBGE, UF, DATA_BASE) %>%
    dplyr::summarize(
      QUANT_AG   = mean(QUANT_AG),
      BANCOA     = mean(BANCOA))
  
  return(retorno)
}

LeituraDeBancoDaAmanada <- function(){
  dados8 <- data.frame(CODMUN_IBGE=as.integer(NA), UF=as.character(NA), DATA_BASE=as.integer(NA), QUANT_AG=1:1000, BANCOA=as.integer(NA)) 
  
  dados8$CODMUN_IBGE = sample(1:25, size=1000, replace = T)
  dados8$UF = sample(c("SP", "RJ", "MG", "DF", "MT", "SC"), size=1000, replace = T)
  dados8$DATA_BASE = sample(1:5, size=1000, replace = T)
  dados8$QUANT_AG = runif(1000)
  dados8$BANCOA = runif(1000)
  
  return(dados8)
  
}


# SCRIPT ------------------------------------------------------------------

datas <- c(202001, 202002, 202003)

for(i in datas) {

    banco <- LeituraDeBancoDaAmanada()
  
    nomeDaVariavelDaAmanda <- sprintf("Estaban_%s", i)
    
    assign(nomeDaVariavelDaAmanda, AmandaMeDeveUmCafe(banco))  
}


Estaban_202001


Estaban_202002

Estaban_202003

