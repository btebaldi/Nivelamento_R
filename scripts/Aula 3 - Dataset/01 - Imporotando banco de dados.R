#' ---
#' title: "Importacao de banco de dados"
#' author: "Bruno Tebaldi de Queiroz Barbosa"
#' date: "2023-02-04"
#' output: html_document
#' ---
#' 

# Setup -------------------------------------------------------------------

rm(list=ls())
# cat("\014") # lipeza do console

library(readr)
library(readxl)


# Data Load ---------------------------------------------------------------

tbl_Notas <- read_csv("./scripts/Aula 3 - Dataset/database/AlunosNotas.csv")
tbl_Info <- read_excel("./scripts/Aula 3 - Dataset/database/AlunosInfo.xlsx", 
                       sheet = "AlunosNotas")


head(tbl_Notas)
head(tbl_Info)


summary(tbl_Notas)
summary(tbl_Info)

