
#' ---
#' title: "R Data Types"
#' author: "Bruno Tebaldi de Queiroz Barbosa"
#' date: "2023-02-04"
#' output: html_document
#' ---

# Setup -------------------------------------------------------------------
rm(list=ls())


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
