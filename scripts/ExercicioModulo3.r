rm(list = ls())

# load(file = "C:/Users/Teo/Documents/Git/Nivelamento_R/databases/Modulo3_AlunosNotas.Rdata")

load(file = "./databases/Modulo3_AlunosNotas.Rdata")

AlunosNotas

class(AlunosNotas)

summary(AlunosNotas)

pesos = c("TR"=10, "LT"=15, "P1"=50, "P2"=50)
pesos

if(sum(pesos) != 1){
  pesos = pesos/sum(pesos)
}
pesos

AlunosNotas$MF = as.numeric(NA)

for(linha in 1:nrow(AlunosNotas))
{
  # linha = 5
  
  NotaTrabalho = AlunosNotas$TR[linha]
  NotaLista = AlunosNotas$LT[linha]
  NotaP1 = AlunosNotas$P1[linha]
  NotaP2 = AlunosNotas$P2[linha]

  MediaDoAluno =  NotaTrabalho * pesos["TR"] + 
                  NotaLista * pesos["LT"] +
                  NotaP1 * pesos["P1"] +
                  NotaP2 * pesos["P2"]
  
  AlunosNotas$MF[linha] = MediaDoAluno
  } 

AlunosNotas

sum(AlunosNotas$MF >= 6)


AlunosNotas$Status = "Aprovado"
PesoasReprovadas = AlunosNotas$MF < 6
AlunosNotas[PesoasReprovadas, "Status"] = "Reprovado"
AlunosNotas

library(ggplot2)

ggplot(AlunosNotas) +
  geom_histogram(mapping = aes(x=MF), bins = 10,
                 fill="blue", alpha=0.4) +
  labs(title = "Distribuicao da media final",
       x = "Nota",
       y = NULL)


