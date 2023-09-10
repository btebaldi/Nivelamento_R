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
tbl_Info <- read_excel("./scripts/Aula 3 - Dataset/database/AlunosInfo.xlsx", 
                       sheet = "AlunosNotas")

# exercicio ---------------------------------------------------------------

filter(tbl_full_left,
       !is.na(Media),
       is.na(Telefone) )





# Gravando arquivo --------------------------------------------------------

library(readr)

myfilename <- "nome do arquivo.xxx"
my_file_path <- file.path(".", "subdiretorio", "outro diretorio", myfilename)
my_file_path


write_csv(x = tbl_full_inner, file = "./TESTE DE ARQUIVO CSV.csv")



library(writexl)
write_xlsx(tbl_full_inner, path = "./TESTE DE ARQUIVO XLS.xlsx")










