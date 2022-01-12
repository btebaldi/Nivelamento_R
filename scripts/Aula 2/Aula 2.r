
# Setup -------------------------------------------------------------------
rm(list=ls())


# Example -----------------------------------------------------------------
x <- "dataset"
typeof(x)
# [1] "character"

y = 1:10
y
# [1] 1 2 3 4 5 6 7 8 9 10

typeof(y)
# [1] "integer"

length(y)
# [1] 10

z <- as.numeric(y)
z
# [1] 1 2 3 4 5 6 7 8 9 10

typeof(z)
# [1] "double"


# Vetores -----------------------------------------------------------------
x <- c(1, 2, 3)

x
# [1] 1 2 3
y <- c(x, 10, 11, 12)
y
# [1] 1 2 3 10 11 12

class(x)
# [1] "numeric"

class(y)
# [1] "numeric"

length(y)
# [1] 6


# Dados Especiais ---------------------------------------------------------
x <- c(1, 2 , NA, 4, 5, Inf, -Inf)

x
# [1] 1 2 NA 4 5 Inf

class(x)
# [1] "numeric"

length(x)
# [1] 6



# Matrizes ----------------------------------------------------------------
# matriz devem ser do mesmo tipo de dados.
m <- matrix(nrow = 2, ncol = 2)

m
# [,1] [,2]
# [1,] NA NA
# [2,] NA NA

class(m)
# [1] "matrix" "array"

m <- matrix(c(1:6), ncol = 4, nrow = 3, byrow = TRUE)
m
# [,1]
# [1,] 1
# [2,] 2
# [3,] 3

class(m)
# [1] "matrix" "array"

typeof(m)

m2=matrix(c(x, y))
class(m2)
typeof(m2)

# Lista -------------------------------------------------------------------
x <- list("Entrada1"=c(1:4), "a", TRUE,"Entrada4"= 1+4i)

x
# [[1]]
# [1] 1
# [[2]]
# [1] "a"
# [[3]]
# [1] TRUE
# [[4]]
# [1] 1+4i
class(x)

x$Entrada1


# Data frame --------------------------------------------------------------
dat <- data.frame(id = letters[1:10], x = 1:10, y = 11:20)

colnames(dat) = c("Coluna 1", "Coluna 2", "Coluna 3")

dat
# id x y
# 1 a 1 11
# 2 b 2 12
# 3 c 3 13
# 4 d 4 14
# 5 e 5 15
# 6 f 6 16
# 7 g 7 17
# 8 h 8 18
# 9 i 9 19
# 10 j 10 20

dat[1, 3] # linha 1; coluna 3 do data frame
# [1] 11


dat[3,]

dat[,3]

xx = dat[  ,  "Coluna 2"]
yy = dat["Coluna 2"  ]

class(xx)
class(yy)

yy$`Coluna 2`

dat[4, "Coluna 1"] # linha 1; coluna "id" do data frame
# [1] "d"

sample(c("a", "b", "c"), size = 4, replace = TRUE)

dim(dat)
dim(m)

# Tibble ------------------------------------------------------------------
library(tibble)

dat <- tibble(id = letters[1:25], x = 1:25, y = 1:25)

dat
# # A tibble: 10 x 3
# id x y
# <chr> <int> <int>
#   1 a 1 11
# 2 b 2 12
# 3 c 3 13
# 4 d 4 14
# 5 e 5 15

class(dat)
# [1] "tbl_df"     "tbl"        "data.frame"

# Operadores aritmeticos em R ---------------------------------------------
x <- 5
y <- 16

x+y
# [1] 21
x-y
# [1] -11

x*y
# [1] 80

y/x
# [1] 3.2

y%/%x
# [1] 1

y%%x
# [1] 1

y^x
# [1] 1048576


# Operadores relacionais --------------------------------------------------
x <- 5
y = 16

y == 17
y == 16

x>y
# [1] FALSE

x<=y
# [1] TRUE

x == y
# [1] FALSE

y>y
# [1] FALSE

y>=y
# [1] TRUE

x!=y
# [1] TRUE





# Operadores logicos ------------------------------------------------------
x <- c(TRUE,FALSE,0,6)
y <- c(FALSE,TRUE,FALSE,TRUE)

!!x
# [1] FALSE TRUE TRUE FALSE

x&y
# [1] FALSE FALSE FALSE TRUE

x&&y
# [1] FALSE

x|y
# [1] TRUE TRUE FALSE TRUE

x||y
# [1] TRUE



# Operacao em Vetores -----------------------------------------------------
x <- c (2,8,3)
y <- c (6,4,1)

x + y
# [1] 8 12 4

x > y
# [1] FALSE TRUE TRUE


x <- c(2,1,8,3)
y <- c(9,4)

x+y # Element of y is recycled to 9,4,9,4
# [1] 11 5 17 7

x-1 # Scalar 1 is recycled to 1,1,1,1
# [1] 1 0 7 2

x+c(1,2,3)
# [1] 3 3 11 4
# Warning message:
#   In x + c(1, 2, 3) :
#   longer object length is not a multiple of shorter object length



# Operadores de atribuicao ------------------------------------------------
x=5
y=6

x<-y


x <- 5
x
# [1] 5

x = 9
x
# [1] 9

10 -> x
x
# [1] 10


# Exercicio ---------------------------------------------------------------

# Suponha que voce esta matriculado na disciplina de estatistica. E voce quer
# calcular a sua media de aprovacao. O criterio de aprovacao e
# Media = 0.10 LT + 0.15 TR + 0.25 P1 + 0.5 P2
# Onde LT, TR, P1 e P2 significam Lista, Trabalho, Prova 1 e Prova 2
# respectivamente. Sabendo que suas notas sao LT = 5.0, TR = 8.0, P1 = 6.0,
# P2 = 5.0

# item 1)
nomes = c("LT", "TR", "P1", "P2")

# item 2)
notas <- c(5, 8, 6, 5)

# item 3)
pesos = c(0.1, 0.15, 0.25, 0.5)

# item 4)
result = pesos * notas

# item 5)
tabela = data.frame(Avaliacao = nomes,
                    Peso = pesos,
                    Nota = notas,
                    SubTotal = result)


# item 6)
MediaFinal = tabela$SubTotal[1] + tabela$SubTotal[2] +
  tabela$SubTotal[3] +tabela$SubTotal[4]

MediaFinal

# outro metodo
sum(tabela$SubTotal)

# item 7)
tabela$Nota[4] = 6
tabela$SubTotal = tabela$Peso * tabela$Nota
MediaFinal = sum(tabela$SubTotal)
MediaFinal

# Funcoes matriciais basicas ----------------------------------------------
mat <- matrix(1:6, ncol = 2)

mat
# [,1] [,2]
# [1,] 1 4
# [2,] 2 5
# [3,] 3 6

nrow(mat)
# [1] 3

dim(mat)
# [1] 3 2

t(mat)
# [,1] [,2] [,3]
# [1,] 1 2 3
# [2,] 4 5 6

mat %*% t(mat)


# Funcoes de data.frame basicas -------------------------------------------
dat = data.frame(id = 1:4, nome=c("paulo", "maria", "joao", "bruno"), aprovado = c(T,F, F, T))

dat
# id nome aprovado
# 1 1 paulo TRUE
# 2 2 maria FALSE
# 3 3 joao FALSE
# 4 4 bruno TRUE

dat[2, 2]
# [1] "maria"

dat[4, c(2, 3)]
# nome aprovado
# 4 bruno TRUE

dat[-3, c(2, 3)]

dat[c(1,3), -c(1, 3)]


cbind(dat,dat)
rbind(dat,dat)


# if/else -----------------------------------------------------------------

ano = 2019
if (ano == 2020) {
  print("2020 e o 1o ano da pandemia")
} else if (ano > 2020) {
  print("Ainda nao sabemos se havera pandemia do COVID-19")
} else {
  print("Ano sem COVID-19")
}



# looping -----------------------------------------------------------------

# Syntax of for loop
for (val in 1:10) {
  print(val)
}
# [1] 1
# [1] 2
# [1] 3
# [1] 4
# [1] 5
# [1] 6
# [1] 7
# [1] 8
# [1] 9
# [1] 10

nomes = c("bruno", "pedro", "joao")

for(i in nomes){
  
  print(i)
  # print(runif(1))
  
  # cat(sprintf("Nome da pessoa: %s\t%f\n", aluno, runif(1)))
}



# Example -----------------------------------------------------------------

# 1) Crie um for loop que faz a soma dos numeros de 1 a 42.

for(numero in 1:42){
  if(numero == 1){
    soma = numero 
  } else {
    soma = soma + numero
  }
}
print(soma)

# 2) Crie um vetor com 5 nomes. Faca um for loop que imprima
nomes = c("a", "b", "c", "d ", "e")

for(j in nomes){
  print(j)
}

# 3) Crie um vetor com os numeros de 1 a 10. Faca um for loop que imprima todos
# o exponencial de cada numero.
vetor <- 1:10
for(numero in vetor){
  print(exp(numero))
}


# While -------------------------------------------------------------------

number = 0
while (number < 30)
{
  print(number)
  number = number +1
}
# [1] 0
# [1] 1
# [1] 2


# Example -----------------------------------------------------------------

# 1) Crie um while looping que faz a soma dos numeros de 1 a 42.
number = 1
soma=0
while (number <= 42)
{
  print(number)
  soma = soma + number
  number = number + 1
}
soma
number

# 2) crie um while looping que dado um numero (escolhido previamente),
# inteiro, ele faz a adicao ou subtracao de uma unidade (+/- 1) a cada
# interacao, ate atingir o numero 42.

# Escolha do usuario
number = 15000

while (number != 42)
{
  print(number)
  if(number > 42){
    number = number - 1
  } else if (number < 42) {
    number = number + 1
  } else {print("????")}
}
number






# next/Break --------------------------------------------------------------

for (number in 1:100)
{
  if(number ==2) {
    print("pulando o 2")
    next
  }
  if(number == 10)
  {
    print("Parando no 10")
    break
  }
  print(number)
}
# [1] 1
# [1] "pulando o 2"
# [1] 3
# [1] "Parando no 4"

for (number in 1:100)
{
  resto = number %% 3
  
  # toda vez que o resto é zero o numero é par
  if(resto == 0)
  {
    print(sprintf("O numero %d é divisivel por 3", number))
  } else {
    print(sprintf("O numero %d NAO é divisivel por 3",number))
    next
  }
  cat(sprintf(" Numero escolhido\n"))
}








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
