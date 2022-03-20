
variavel1 <- 30
variavel2 <- 50

variavel1 + variavel2

source(file = "./scripts/Aula 4 - Projeto/Aula 4 - OiMundo.R",
       encoding = "UTF-8")

print(variavel1 * variavel2)


# Repeticao ---------------------------------------------------------------



print("* * * * * * * * * * * * * * * * * * * * *")

frase <- rep("*", 8)
paste(frase, collapse = " ")



# Sequencia ---------------------------------------------------------------

1:10

seq(from = 2, to = 10, by = 0.5)

minhasDatas <- seq(from = as.Date("2020-01-01"), 
    to = as.Date("2020-05-01"),
    by = "month")

rev(minhasDatas)



# Funcoes -----------------------------------------------------------------

source("./CobbDouglasFunction.R")

CobbDouglas(5, 10)
CobbDouglasAdvanced(5, 10)
CobbDouglasAdvanced(5, 10, alpha = 0.3)




