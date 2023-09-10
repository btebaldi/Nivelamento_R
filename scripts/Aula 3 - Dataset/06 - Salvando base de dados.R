#' ---
#' title: "Exercicio 2"
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

# Data Logic --------------------------------------------------------------

tbl_Notas <- dplyr::select(tbl_Notas, id, P1, P2)

# Gravando arquivo --------------------------------------------------------

library(readr)

myfilename <- "TESTE DE ARQUIVO CSV.csv"
my_file_path <- file.path(".", "scripts", "Aula 3 - Dataset", myfilename)
my_file_path

write_csv(x = tbl_Notas, file = my_file_path)



library(writexl)

myfilename <- "TESTE DE ARQUIVO EXCEL.xlsx"
my_file_path <- file.path(".", "scripts", "Aula 3 - Dataset", myfilename)
writexl::write_xlsx(tbl_Notas, path = my_file_path)










