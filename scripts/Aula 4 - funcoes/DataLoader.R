

# Setup -------------------------------------------------------------------
library(readr)
library(readxl)
library(dplyr)


# Carrega base de dados ---------------------------------------------------

Info_Alunos <- read_delim("databases/Projeto Aula 4/Info_Alunos.csv", 
                          ";", escape_double = FALSE, trim_ws = TRUE)

Notas_P1 <- read_delim("databases/Projeto Aula 4/Notas_P1.csv", 
                       ";", escape_double = FALSE, trim_ws = TRUE)

Notas_P2 <- read_delim("databases/Projeto Aula 4/Notas_P2.csv", 
                       ";", escape_double = FALSE, trim_ws = TRUE)

Notas_TrabalhoEListas <- read_excel("databases/Projeto Aula 4/Notas_TrabalhoEListas.xlsx")


# Junta Base de dados -----------------------------------------------------

DadosAlunos <- inner_join(x = Info_Alunos,
                          y = Notas_P1, 
                          by = c("Codigo"="id"))

DadosAlunos <- inner_join(x = DadosAlunos,
                          y = Notas_P2, 
                          by = c("Codigo"="id"))


DadosAlunos <- inner_join(x = DadosAlunos,
                          y = Notas_TrabalhoEListas, 
                          by = c("Codigo"="Codigo"))



# Arruma a base ---------------------------------------------------------------


DadosAlunos <- select(DadosAlunos, -X1)

colnames(DadosAlunos) <-c("Codigo",
                          "Nome", 
                          "Email", 
                          "Telefone", 
                          "P1",
                          "P2", 
                          "TR",
                          "LT")

rm(list = c("Info_Alunos", "Notas_P1", "Notas_P2", "Notas_TrabalhoEListas"))
