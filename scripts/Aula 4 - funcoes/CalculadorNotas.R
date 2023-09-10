
# Setup -------------------------------------------------------------------

rm(list = ls())



library(ggplot2)

# DataLoad ----------------------------------------------------------------

source("./scripts/Aula 4 - Projeto/DataLoader.R")

source("./scripts/Aula 4 - Projeto/functionMedia.R")


DadosAlunos$MF = 0
# Logic -------------------------------------------------------------------

for(lin in 1:nrow(DadosAlunos) ){
  
  P1 = DadosAlunos$P1[lin]
  P2 = DadosAlunos$P2[lin]
  TR = DadosAlunos$TR[lin]
  LT = DadosAlunos$LT[lin]

  MF  = CalculaMedia(P1, P2, TR, LT)
  
  DadosAlunos$MF[lin] = MF

}

# O data frame deve conter uma coluna que indica se o aluno foiaprovado ou nao.
# (media≥6)

DadosAlunos$Aprovado = DadosAlunos$MF >=6


# Um processo que gera os gr ́aficos solicitadosUm conjunto de instru ̧c ̃oes
# que salva a planilha DadosAlunos e mum arquivo csv os gr ́aficos solicitados.

ggplot(data=DadosAlunos) + 
  geom_histogram(mapping = aes(x=MF),
                 bins = 10,
                 fill="blue",
                 alpha=0.3) + 
  geom_vline(xintercept = 6)
  
  
  
  
