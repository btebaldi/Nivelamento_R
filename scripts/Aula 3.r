# Setup -------------------------------------------------------------------
rm(list=ls())
library(readxl)
library(readr)
library(tidyr)
# Read database ------------------------------------------------------------

AlunosNotas.csv <- read_csv("./databases/Modulo4_AlunosNotas.csv",
                            col_names = TRUE)

head(AlunosNotas.csv)
summary(AlunosNotas.csv)


# Lista as planilhas
excel_sheets("./databases/Modulo4_AlunosInfo.xlsx")
# [1] "AlunosNotas"

Modulo4_AlunosInfo <- read_excel("./databases/Modulo4_AlunosInfo.xlsx",  sheet = "AlunosNotas")
head(Modulo4_AlunosInfo)

summary(Modulo4_AlunosInfo)
