
#' ---
#' title: "R Data Types"
#' author: "Bruno Tebaldi de Queiroz Barbosa"
#' date: "2023-02-04"
#' output: html_document
#' ---

# Setup -------------------------------------------------------------------
rm(list=ls())

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





