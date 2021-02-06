rm(list = ls())

library(readr)
library(readxl)

library(dplyr)
library(tidyr)


AlunosNotas <- read_csv("Database/Modulo4_AlunosNotas.csv", col_names = TRUE)

excel_sheets("Database/Modulo4_AlunosInfo.xlsx")
AlunosInfo <- read_excel("Database/Modulo4_AlunosInfo.xlsx",  sheet = "AlunosNotas")
head(Modulo4_AlunosInfo)

head(AlunosNotas)

arrange(AlunosNotas, P2, desc(P1))


mutate(AlunosNotas, meia_nota = P2/2)

select(AlunosNotas, P1, P2)


filter(AlunosNotas, P2 >= 6)

# adiciono uma coluna que informa se a P2 fpi acima de seis
AlunosNotas2 <- mutate(AlunosNotas, AcimaDeSeis = P2 > 6)
# Agrupo pela coluna "AcimaDeSeis"
AlunosNotas.Grouped <- group_by(AlunosNotas2, AcimaDeSeis) 
# Resume os dados
summarize(AlunosNotas.Grouped,
          MediaP1 = mean(P1, na.rm = TRUE),
          MediaP2 = mean(P2, na.rm = TRUE),
          TotalAlunos = n(),
          )


inner_join(AlunosNotas, AlunosInfo, by=c("id"="Codigo"))



AlunosNotas.wider <- pivot_longer(AlunosNotas, cols = c("TR", "LT", "P1", "P2"), 
                                  names_to = "Avalicao", values_to = "Nota")
AlunosNotas.wider



pivot_wider(AlunosNotas.wider, id_cols = c("X1", "id"), names_from = "Avalicao", values_from="Nota")
