rm(list = ls())

load("testeAlunosmodulo3.Rdata")


class(AlunosNotas)

summary(AlunosNotas)

Peso = c(TR=10, 15, 25, 50)

if(!(sum(Peso) ==1))
{
  print("PESOS NAO SOMAM 1")
  print("NORMALIZANDO PESOS")
  
  Peso = Peso/sum(Peso)
  print("NOVOS PESOS")
  print(Peso)
}

# Inicializacao
AlunosNotas$MF = as.numeric(NA)

for (i in 1:nrow(AlunosNotas)) {
  
  #  calculando media
  MF = Peso[1] * AlunosNotas$TR[i] + 
    Peso[2] * AlunosNotas$LT[i] +
    Peso[3] * AlunosNotas$P1[i] +
    Peso[4] * AlunosNotas$P2[i]
  
  AlunosNotas$MF[i] = MF
  
  print(sprintf(AlunosNotas$id[i]))
  print(MF)
}

qtd_aprovados = sum(AlunosNotas$MF >= 6)
