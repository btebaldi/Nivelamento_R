#' ---
#' title: "Operacoes com Dplyr"
#' author: "Bruno Tebaldi de Queiroz Barbosa"
#' date: "2023-02-04"
#' output: html_document
#' ---
#' 

# Setup -------------------------------------------------------------------
rm(list=ls())

library(readr)
library(readxl)
library(dplyr)



# Data Load ---------------------------------------------------------------

tbl_Notas <- read_csv("./scripts/Aula 3 - Dataset/database/AlunosNotas.csv")
tbl_Info <- read_excel("./scripts/Aula 3 - Dataset/database/AlunosInfo.xlsx", 
                       sheet = "AlunosNotas")


# arrange -----------------------------------------------------------------

tbl_Notas = arrange(tbl_Notas, P1, desc(P2))



# Mutate ------------------------------------------------------------------

tbl_Notas = mutate(tbl_Notas,
                   MediaProva = (P1+P2)/2,
                   MediaLista = (TR + LT)/2,
                   MediaTotal = MediaLista*0.4+MediaProva*0.6 )

# Criando coluna (outro metodo)
tbl_Notas$PontExtra <- 0.5
head(tbl_Notas)

# Apagando coluna
tbl_Notas$PontExtra <- NULL 
tbl_Notas

# Select ------------------------------------------------------------------

tbl_Notas$PontExtra <- 0.5
head(tbl_Notas)

tbl_Notas <- select(tbl_Notas, id, P1, P2, MediaProva, TR, LT)
head(tbl_Notas)

# Filter ------------------------------------------------------------------

filter(tbl_Notas, P2 >= 6, P1 >= 6)
filter(tbl_Notas, (P2 >= 6) | (P1 >= 6))

# Pegunta ao usuario uma nota de corte
ImputUsuario <- as.numeric(readline("DIGITAR NOTA DE CORTE: "))
filter(tbl_Notas, P2 >= ImputUsuario)








