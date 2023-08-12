
#' ---
#' title: "R Data Types"
#' author: "Bruno Tebaldi de Queiroz Barbosa"
#' date: "2023-02-04"
#' output: html_document
#' ---

# Exercicio ---------------------------------------------------------------

# Voce esta ajudando o professor de uma materia a calcular a nota dos alunos.
# Para isso voce ira utilizar o software R e automatizar boa parte do processo.
# 1) Inicie um novo script e salve o mesmo como "ExercicioModulo3.R"
rm(list=ls())
# 2) Carregue no baco de dados os dados das notas. Para isso utilize o
# comando \Load(AlunosModulo3.Rdata)"
load("./databases/Modulo3_AlunosNotas.Rdata")
# 3) Verifique que a variavel AlunosNotas esta carregada.
head(AlunosNotas)

# 4) Verifique que a variavel AlunosNotas e um data.frame.
class(AlunosNotas)

# 5) imprima um \summary" dos dados no data.frame AlunosNotas.
summary(AlunosNotas)

# 6) Declare um vetor que ira conter os pesos das avaliacoes. Ao todo serao 4
# avaliacoes \TR = 10", \LT=15", \P1=25", \P2=50".
pesos <- c(TR =10,LT=15,P1=25,P2=50)

# 7) Faca uma verificacao de que a soma total dos pessos seja igual a 1. Se a
# soma n~ao for igual a 1, faca a Normalizacao" dividindo todos os pesos pela
# soma total.
pesos <- pesos/sum(pesos)


# 8) Adicione uma coluna ao data.frame chamada MF, a qual ira conter a
# informacao da media final do aluno. Para isso utilize o comando
# AlunosNotas$MF = as.numeric(NA)
AlunosNotas$MF = as.numeric(NA)

# 9) que o comando anterior fez? Como est~ao as medias finais dos alunos? Qual o
# tipo de variavel (inteiro, logica, numero real)? (dica de funcoes para
# auxiliar a investigacao head(AlunosNotas)"
head(AlunosNotas)
summary(AlunosNotas)


# 10) Construa um looping que percorre todas as linhas do data.frame
# AlunosNotas, e calcula a nota para cada aluno. Guarde a media calculada na
# coluna MF.
for(row in 1: nrow(AlunosNotas)){
  AlunosNotas$MF[row] <- AlunosNotas$TR[row]*pesos["TR"] + 
    AlunosNotas$LT[row]*pesos["LT"] + 
    AlunosNotas$P1[row]*pesos["P1"] + 
    AlunosNotas$P2[row]*pesos["P2"]
}

# 11) Determine qual a quantidade de alunos que foram aprovados.
sum(AlunosNotas$MF >= 6)


# 12) Suponha que agora o professor altere os pesos para \TR = 10",
# \LT=15", \P1=50", \P2=50". Qual a quantidade de alunos aprovados
# com esses pesos?

pesos <- c(TR =10,LT=15,P1=50,P2=50)
pesos <- pesos/sum(pesos)

AlunosNotas$MF <- AlunosNotas$TR*pesos["TR"] + 
  AlunosNotas$LT*pesos["LT"] + 
  AlunosNotas$P1*pesos["P1"] + 
  AlunosNotas$P2*pesos["P2"]

sum(AlunosNotas$MF >= 6)



ggplot(AlunosNotas) +
  geom_histogram(mapping = aes(x=MF), bins = 10,
                 fill="blue", alpha=0.4) +
  labs(title = "Distribuicao da media final",
       x = "Nota",
       y = NULL)
