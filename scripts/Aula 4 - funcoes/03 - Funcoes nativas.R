#' ---
#' title: "Funcoes nativas"
#' author: "Bruno Tebaldi de Queiroz Barbosa"
#' date: "2023-02-04"
#' output: html_document
#' ---
#' 


# Repeticao ---------------------------------------------------------------


print("* * * * * * * * * * * * * * * * * * * * *")

frase <- rep("*", 8)
frase
paste(frase, collapse = " ")


# Sequencia ---------------------------------------------------------------

1:10

seq(from = 2, to = 10, by = 0.5)

minhasDatas <- seq(from = as.Date("2020-01-01"), 
    to = as.Date("2020-05-01"),
    by = "month")


# Reversao ----------------------------------------------------------------

rev(minhasDatas)





