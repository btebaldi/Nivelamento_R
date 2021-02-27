# Setup -------------------------------------------------------------------
rm(list = ls())

library(readr)
library(readxl)

# Importacao arquivo texto
tabela.alunos = read_csv("databases/Modulo4_AlunosNotas.csv", 
                                col_types = cols(X1 = col_integer()))
head(tabela.alunos)

# Importacao arquivo xls
tabela.alunos.Info = read_excel("databases/Modulo4_AlunosInfo.xlsx")
head(tabela.alunos.Info)

# informa qual as abas da planilha
readxl::excel_sheets("databases/Modulo4_AlunosInfo.xlsx")


# Summary do banco de dados
summary(tabela.alunos)
summary(tabela.alunos.Info)

library(ggplot2)

ggplot(tabela.alunos) + 
  geom_boxplot(mapping = aes(x=P2))


# arrange -----------------------------------------------------------------
library(dplyr)
head(tabela.alunos)

tabela.alunos.ordenado = arrange(tabela.alunos, desc(P1), P2)



# Mutate ------------------------------------------------------------------

tabela.alunos.comMF = mutate(tabela.alunos, MF = 0.1*TR + 0.2*LT + 0.3*P1 + 0.4*P2)

tabela.alunos %>% 
  mutate(MF = 0.1*TR + 0.2*LT + 0.3*P1 + 0.4*P2) %>% 
  arrange(MF) %>% 
  mutate(DELTA = MF - lag(MF))



# SELECT ------------------------------------------------------------------

select(tabela.alunos.comMF, id, MF)



# Filter ------------------------------------------------------------------

tbl.aprovados <- filter(tabela.alunos.comMF, MF >= 6)
tbl.reprovados <- filter(tabela.alunos.comMF, MF < 6)

tbl.aprovados <- filter(tabela.alunos.comMF, MF >= 6)
tbl.aprovados2 <- select(tbl.aprovados, id, MF)

tabela.alunos.comMF %>% filter(MF >=6) %>% select(id, MF)

filter(tabela.alunos.comMF, MF >= 6 | MF <7)

# exercicio --------------------------------------------------------------- A
# soma total de todas as provas para cada aluno.
# 2 Calcule a media de cada
# aluno, sabendo que os pesos s~ao: TR = 0:1, LT = 0:2, P1 = 0:3 e P2 = 0:4 3
# Selecione apenas as colunas Id e as Media. 4 A partir do resultado anterior,
# ordene os dados do melhor aluno para o pior aluno.


mutate(tabela.alunos, soma=TR+LT+P1+P2)

tbl <- mutate(tabela.alunos, MF=0.1*TR+0.2*LT+0.3*P1+0.4*P2)
tbl <- select(tbl, id, MF)
tbl <- arrange(tbl, desc(MF))


# summarize() -------------------------------------------------------------

AlunosNotas = mutate(tabela.alunos.comMF, AcimaDeSeis = MF > 6)


AlunosNotas.grouped = group_by(AlunosNotas, AcimaDeSeis)

AlunosNotas.summarise = summarise(AlunosNotas.grouped,
                                  P1_avg = mean(P1),
                                  P2_avg = mean(P2),
                                  TotalAlunos = n())
AlunosNotas.summarise



# inner join --------------------------------------------------------------


tabela.alunos.comMF

tabela.alunos.Info


tabela.Completa = inner_join(tabela.alunos.comMF, tabela.alunos.Info, by=c("id"="Codigo"))




# Pivot -------------------------------------------------------------------
library(tidyr)

tbl.longer = pivot_longer(tabela.alunos, cols = c("TR", "LT", "P1", "P2"),
             names_to = "Avaliacao",
             values_to = "Nota")



# exercicio ---------------------------------------------------------------

# Utilizando os dados presente em \Modulo4 AlunosNotas.csv" e em \Modulo4
# AlunosInfo.xlsx" determine: 1 Construa um banco de dados com as informacoes
# dos dois arquivos. 2 Para o banco de dados completo, calcule a media de cada
# aluno, sabendo que os pesos s~ao: TR = 0:1, LT = 0:2, P1 = 0:3 e P2 = 0:4 3
# determine quem s~ao os alunos com media final calculada mas que nao tem
# telefone de contato.


tbl.final = inner_join(tabela.alunos.comMF, tabela.alunos.Info,
           by=c("id" = "Codigo"))

filter(tbl.final, is.na(Telefone))

filter(tbl.final, !is.na(Telefone))


# Wider -------------------------------------------------------------------

tbl.longer

pivot_wider(tbl.longer, id_cols = c("X1", "id"),
            names_from = "Avaliacao",
            values_from = "Nota"
            )

# Gravando arquivo --------------------------------------------------------
library(readr)

write_csv(x = tabela.Completa,
          file = "./dev/ArquivoTesteAlunosNota.csv")

write_excel_csv(x = tabela.Completa,
                file = "./dev/ArquivoTesteAlunosNotaForExcel.csv",
                delim = ";", dec = ",")



