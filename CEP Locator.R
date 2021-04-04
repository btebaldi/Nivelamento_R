
# setup -------------------------------------------------------------------

rm(list = ls())
library(dplyr)
library(readxl)
# Data Load ---------------------------------------------------------------

bc.db <- readxl::read_excel(path = "../../../Downloads/teste_BC.xlsx")
cep.db <- readxl::read_excel(path = "../../../Downloads/teste_CEP.xlsx")



# Data preparation --------------------------------------------------------

# padroniza nome de colunas
colnames(cep.db) <- c("Estado", "Localidade", "CEP_Inicial", "CEP_Final")

# Cria colunas de CEP como numero
bc.db$CEP_num <- as.numeric(bc.db$CEP)
bc.db$CEP_NND <- trunc(bc.db$CEP_num/1000)


cep.db$CEP_Inicial_num <- as.numeric(cep.db$CEP_Inicial)
cep.db$CEP_Final_num <- as.numeric(cep.db$CEP_Final)



# Database inspection -----------------------------------------------------

head(cep.db)
head(bc.db)

# junta as bases ----------------------------------------------------------


for(i in 1:nrow(cep.db)){
  cep_inf <- cep.db$CEP_Inicial_num[i]
  cep_sup <- cep.db$CEP_Final_num[i]
  loc <- cep.db$Localidade[i]
  est <- cep.db$Estado[i]

  selVector <- (bc.db$CEP_NND <= cep_sup) & (bc.db$CEP_NND >= cep_inf)
  
  bc.db$Municipio[selVector] <- sprintf("%2s - %s", est, loc)
}

bc.db
