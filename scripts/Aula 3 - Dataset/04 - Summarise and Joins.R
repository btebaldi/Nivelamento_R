#' ---
#' title: "Summarise e Join"
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

# Pivot -------------------------------------------------------------------

library(tidyr)

tbl_selecionada <- select( tbl_Notas, id, TR, LT, P1, P2)

tbl_longer = pivot_longer(tbl_selecionada,
                          cols = c("TR", "LT", "P1", "P2"),
                          names_to = "Avaliacao",
                          values_to = "Nota")

tbl_longer


pivot_wider(tbl_longer,
            id_cols = id,
            names_from = Avaliacao,
            values_from = Nota)




