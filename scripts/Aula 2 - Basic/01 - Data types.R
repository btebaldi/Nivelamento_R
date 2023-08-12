#' ---
#' title: "R Data Types"
#' author: "Bruno Tebaldi de Queiroz Barbosa"
#' date: "2023-02-04"
#' output: html_document
#' ---
#' 

# Setup -------------------------------------------------------------------
rm(list=ls())

# Logical Data Type -------------------------------------------------------

#' ### Logical Data Type
#'
#' O tipo de dado lógico em R também é conhecido como tipo de dado booleano. só
#' pode tem dois valores: TRUE e FALSE.

bool1 <- TRUE
print(bool1)
print(class(bool1))

bool2 <- FALSE
print(bool2)
print(class(bool2))




# Numeric Data Type -------------------------------------------------------

#' ### Numeric Data Type
#' 
#' Em R, o tipo de dado numérico representa todos os números reais com ou sem
#'valores decimais.

# floating point values
weight <- 63.5
print(weight)
print(class(weight))

# real numbers
height <- 182
print(height)
print(class(height))


# Integer Data Type -------------------------------------------------------

#' ### Integer Data Type
#'
#' O tipo de dados integer especifica valores reais sem pontos decimais. Nós
#' usamos o sufixo L para especificar dados inteiros.

integer_variable <- 186L
print(class(integer_variable))

#' 186L é um dado inteiro. Então, obtemos "inteiro" quando imprimimos a classe de
#'variável_inteira.

# Complex Data Type -------------------------------------------------------

#' ### Complex Data Type
#'
#' O tipo de dado complexo é usado para especificar valores puramente
#' imaginários em R. Usamos o sufixo i para especificar a parte imaginária.


# 2i represents imaginary part
complex_value <- 3 + 2i

# print class of complex_value
print(class(complex_value))


#' 3 + 2i é um tipo de dado complexo porque tem uma parte imaginária 2i.


# Character Data Type -----------------------------------------------------

#' ### Character Data Type
#'
#' O tipo de dados de caractere é usado para especificar valores de caractere ou
#' uma 'string' em um variável.
#'
#' Na programação, uma 'string' é um conjunto de caracteres. Por exemplo, 'A' é
#' um único caractere e "Apple" é uma string.
#'
#' Você pode usar aspas simples '' ou aspas duplas "" para representar strings.
#' Em geral, usamos: '' para caracteres "" para strings

# create a string variable
fruit <- "Apple"
print(class(fruit))

# create a character variable
my_char <- 'A'
print(class(my_char))

#' Aqui, ambas as variáveis - fruit e my_char - são do tipo de dados de
#' caractere.


# Raw Data Type -----------------------------------------------------------

#' ### Raw Data Type
#'
#' Um dado do tipo bruto (raw) especifica valores como bytes brutos. Você pode usar
#' o seguinte métodos para converter tipos de dados de caracteres em um tipo de
#' dados brutos e vice-versa:
#'
#' charToRaw() - converte dados de caracteres em dados brutos
#'
#' rawToChar() - converte dados brutos em dados de caracteres


# convert character to raw
raw_variable <- charToRaw("Nivelamento de R")
print(raw_variable)
print(class(raw_variable))
rawToBits(raw_variable)

# convert raw to character
char_variable <- rawToChar(raw_variable)

print(char_variable)
print(class(char_variable))

#' Neste programa, Primeiro usamos a função charToRaw() para converter a string
#' "Nivelamento de R" para bytes.
#'
#' É por isso que obtemos "raw" como saída quando imprimimos a classe de
#' raw_variable. Em seguida, usamos a função rawToChar() para converter os dados
#' em raw_variable de volta ao formato de caractere.
#'
#' É por isso que obtemos "caractere" como saída quando imprimimos a classe de
#' char_variable.


