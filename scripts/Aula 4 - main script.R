
# Como declarar uma funcao ------------------------------------------------
rm(list=ls())

# Definindo uma funcao
f <- function(x){
  ret = x^2 + 1
  return(ret)
}
# chamando uma funcao
f(x=2)

# Funcoes Nativas ---------------------------------------------------------
rm(list = ls())

# Funcao rep
x = "oi mundo"
y = rep(x, 4)

# Funcao seq
seq(from = 10, to = 100, by = 3) 
seq(from = as.Date('2010-01-05'),to=as.Date('2010-08-05'), by= "2 month")

# Funcao rev
x = 21:33
x
y = rev(x)
y


# Chamando funcoes escridas previamente -----------------------------------
rm(list = ls())

print("Executando arquivo externo")

source(file = "./scripts/Aula 4 - source exemplo 1.R")

print("Arquivo externo executado com sucesso")

source(file = "./scripts/Aula 4 - OiMundo.R")


# Funcao Calcular Raiz quadrada -------------------------------------------
rm(list = ls())

source("./scripts/Aula 4 - Funcao RaizesQuadratica.R")

# RaizesQuadratica(1,  1,  1)
# RaizesQuadratica(1,  5,  6)
# RaizesQuadratica(1, -5,  6)
# RaizesQuadratica(1,  0,  0)
# RaizesQuadratica(1, -2,  1)

a = c(1, 1, 1, 1, 1)
b = c(1, 5, -5, 0, 2)
c = c(1, 6, 6, 0, 1)

tbl = data.frame(a, b, c)
tbl

RaizesQuadratica(tbl$a,tbl$b, tbl$c)

# Quando utilizar uma funcao ----------------------------------------------
rm(list = ls())

df <- tibble:: tibble(a = rnorm(10), b = rnorm(10), c = rnorm(10), d = rnorm(10))

normaliza <- function(vetor){

  ret = (vetor - min(vetor, na.rm = TRUE))/(max(vetor, na.rm = TRUE) - min(vetor, na.rm = TRUE))
  
  return(ret)
}

# df$a <- (df$a - min(df$a, na.rm = TRUE))/(max(df$a, na.rm = TRUE) - min(df$a, na.rm = TRUE))
# df$b <- (df$b - min(df$b, na.rm = TRUE))/(max(df$b, na.rm = TRUE) - min(df$a, na.rm = TRUE))
# df$c <- (df$c - min(df$c, na.rm = TRUE))/(max(df$c, na.rm = TRUE) - min(df$c, na.rm = TRUE))
# df$d <- (df$d - min(df$d, na.rm = TRUE))/(max(df$d, na.rm = TRUE) - min(df$d, na.rm = TRUE))

df$a <- normaliza(df$a)
df$b <- normaliza(df$b)
df$c <- normaliza(df$c)
df$d <- normaliza(df$d)


# Carregando e descarregando pacotes --------------------------------------
rm(list = ls())

library(ggplot2)
diamonds


detach("package:ggplot2", unload = TRUE)


# Projeto -----------------------------------------------------------------
rm(list = ls())

library(readr)
library(readxl)
library(dplyr)
library(tidyr)


AlunosNotas <- read_csv("./databases/Modulo4_AlunosNotas.csv", col_names = TRUE)
excel_sheets("./databases/Modulo4_AlunosInfo.xlsx")
AlunosInfo <- read_excel("./databases/Modulo4_AlunosInfo.xlsx",  sheet = "AlunosNotas")

head(AlunosInfo)
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



pivot_wider(AlunosNotas.wider,
            id_cols = c("X1", "id"),
            names_from = "Avalicao",
            values_from="Nota")







