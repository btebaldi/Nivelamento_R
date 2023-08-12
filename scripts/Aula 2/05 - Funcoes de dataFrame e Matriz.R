
#' ---
#' title: "R Data Types"
#' author: "Bruno Tebaldi de Queiroz Barbosa"
#' date: "2023-02-04"
#' output: html_document
#' ---

# Setup -------------------------------------------------------------------
rm(list=ls())

# Funcoes matriciais basicas ----------------------------------------------
mat <- matrix(1:6, ncol = 2)

mat
# [,1] [,2]
# [1,] 1 4
# [2,] 2 5
# [3,] 3 6

nrow(mat)
# [1] 3

dim(mat)
# [1] 3 2

t(mat)
# [,1] [,2] [,3]
# [1,] 1 2 3
# [2,] 4 5 6

mat %*% t(mat)


# Funcoes de data.frame basicas -------------------------------------------
dat = data.frame(id = 1:4, nome=c("paulo", "maria", "joao", "bruno"), aprovado = c(T,F, F, T))

dat
# id nome aprovado
# 1 1 paulo TRUE
# 2 2 maria FALSE
# 3 3 joao FALSE
# 4 4 bruno TRUE

dat[2, 2]
# [1] "maria"

dat[4, c(2, 3)]
# nome aprovado
# 4 bruno TRUE

dat[-3, c(2, 3)]

dat[c(1,3), -c(1, 3)]


cbind(dat,dat)
rbind(dat,dat)

