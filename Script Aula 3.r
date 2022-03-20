

# Setup -------------------------------------------------------------------

rm(list=ls())
# cat("\014") # lipeza do console


library(readr)
library(readxl)
library(dplyr)



# Data Load ---------------------------------------------------------------

tbl_Notas <- read_csv("databases/Modulo4_AlunosNotas.csv")

tbl_Info <- read_excel("databases/Modulo4_AlunosInfo.xlsx", 
                       sheet = "AlunosNotas")


# head(tabela)
# head(Modulo4_AlunosInfo)


summary(tbl_Notas)
summary(tbl_Info)




# arrange -----------------------------------------------------------------

tbl_Notas = arrange(tbl_Notas, P1, desc(P2))



# Mutate ------------------------------------------------------------------

tbl_Notas = mutate(tbl_Notas,
                   MediaProva = (P1+P2)/2,
                   MediaLista = (TR + LT)/2,
                   MediaTotal = MediaLista*0.4+MediaProva*0.6 )


tbl_Notas$PontExtra <- 0.5

tbl_Notas$PontExtra <- NULL 


# Select ------------------------------------------------------------------

tbl_Notas_2 <- select(tbl_Notas, P1, P2, MediaProva)


# Filter ------------------------------------------------------------------

tbl_Notas_2


filter(tbl_Notas_2, P2 >= 6, P1 >= 6)


filter(tbl_Notas_2, (P2 >= 6) | (P1 >= 6))


ImputUsuario <- as.numeric(readline("DIGITAR NOTA DE CORTE: "))

ImputUsuario <- 6

tbl_Notas_2 <- filter(tbl_Notas_2, P2 >= ImputUsuario)


rm(list = c("tbl_Notas_2"))

# A soma total de todas as provas para cada aluno.
tbl_Notas <- mutate(tbl_Notas, SomaProva = P1 + P2)

# Calcule a media de cada aluno, sabendo que os pesos s~ao: TR = 0:1,
# LT = 0:2, P1 = 0:3 e P2 = 0:4
tbl_Notas <- mutate(tbl_Notas, Media = TR*0.1 + LT*0.2 + P1*0.3 + P2*0.4)

# Selecione apenas as colunas Id e as Media.
tbl_selecao <- select(tbl_Notas, id, Media)

# A partir do resultado anterior, ordene os dados do melhor aluno para o
# pior aluno.
arrange(tbl_selecao, desc(Media))



# Summarise / Group by ----------------------------------------------------


tbl_Notas <- mutate(tbl_Notas, AcimaDeSeis = (Media >= 6))

tbl_Notas_agrupada <- group_by(tbl_Notas, AcimaDeSeis)

summarise(tbl_Notas_agrupada,
          MediaDasMedias = mean(Media, na.rm = TRUE),
          desvio = sd(Media, na.rm = TRUE),
          soma = sum(Media, na.rm = TRUE),
          qtd = n())



mean(unlist(tbl_Notas[ tbl_Notas$AcimaDeSeis, "Media"]), na.rm = TRUE)
mean(unlist(tbl_Notas[ !tbl_Notas$AcimaDeSeis, "Media"]), na.rm = TRUE)





# Joins -------------------------------------------------------------------


tbl_full_inner <- inner_join(x = tbl_Notas, y = tbl_Info, by = c("id" = "Codigo"))

tbl_full_right <- right_join(x = tbl_Notas, y = tbl_Info, by = c("id" = "Codigo"))

tbl_full_left <- left_join(x = tbl_Notas, y = tbl_Info, by = c("id" = "Codigo"))





tbl_full_right <- right_join(x = tbl_Info, y = tbl_Notas, by = c("Codigo"="id"))

tbl_teste <- left_join(x = tbl_Info, y = tbl_Notas, by = c("Codigo"="id"))



# pivot -------------------------------------------------------------------


library(tidyr)


tbl_selecionada <- select( tbl_Notas, id, TR, LT, P1, P2)

tbl_longer = pivot_longer(tbl_selecionada,
                          cols = c("TR", "LT", "P1", "P2"),
                          names_to = "Avaliacao",
                          values_to = "Nota")



pivot_wider(tbl_longer,
            id_cols = id,
            names_from = Avaliacao,
            values_from = Nota)





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










