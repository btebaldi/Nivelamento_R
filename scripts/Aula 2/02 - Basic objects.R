#' ---
#' title: "R Data Types"
#' author: "Bruno Tebaldi de Queiroz Barbosa"
#' date: "2023-02-04"
#' output: html_document
#' ---

# Setup -------------------------------------------------------------------
rm(list=ls())

# Vetores -----------------------------------------------------------------
x <- c(1, 2, 3)

x
# [1] 1 2 3
y <- c(x, 10, 11, 12)
y
# [1] 1 2 3 10 11 12

class(x)
# [1] "numeric"

class(y)
# [1] "numeric"

length(y)
# [1] 6


# Dados Especiais ---------------------------------------------------------
x <- c(1, 2 , NA, 4, 5, Inf, -Inf)

x
# [1] 1 2 NA 4 5 Inf

class(x)
# [1] "numeric"

length(x)
# [1] 6



# Matrizes ----------------------------------------------------------------
# matriz devem ser do mesmo tipo de dados.
m <- matrix(nrow = 2, ncol = 2)

m
# [,1] [,2]
# [1,] NA NA
# [2,] NA NA

class(m)
# [1] "matrix" "array"

m <- matrix(c(1:6), ncol = 4, nrow = 3, byrow = TRUE)
m
# [,1]
# [1,] 1
# [2,] 2
# [3,] 3

class(m)
# [1] "matrix" "array"

typeof(m)

m2=matrix(c(x, y))
class(m2)
typeof(m2)

# Lista -------------------------------------------------------------------
x <- list("Entrada1"=c(1:4), "a", TRUE,"Entrada4"= 1+4i)

x
# [[1]]
# [1] 1
# [[2]]
# [1] "a"
# [[3]]
# [1] TRUE
# [[4]]
# [1] 1+4i
class(x)

x$Entrada1


# Data frame --------------------------------------------------------------
dat <- data.frame(id = letters[1:10], x = 1:10, y = 11:20)

colnames(dat) = c("Coluna 1", "Coluna 2", "Coluna 3")

dat
# id x y
# 1 a 1 11
# 2 b 2 12
# 3 c 3 13
# 4 d 4 14
# 5 e 5 15
# 6 f 6 16
# 7 g 7 17
# 8 h 8 18
# 9 i 9 19
# 10 j 10 20

dat[1, 3] # linha 1; coluna 3 do data frame
# [1] 11


dat[3,]

dat[,3]

xx = dat[  ,  "Coluna 2"]
yy = dat["Coluna 2"  ]

class(xx)
class(yy)

yy$`Coluna 2`

dat[4, "Coluna 1"] # linha 1; coluna "id" do data frame
# [1] "d"

sample(c("a", "b", "c"), size = 4, replace = TRUE)

dim(dat)
dim(m)

# Tibble ------------------------------------------------------------------
library(tibble)

dat <- tibble(id = letters[1:25], x = 1:25, y = 1:25)

dat
# # A tibble: 10 x 3
# id x y
# <chr> <int> <int>
#   1 a 1 11
# 2 b 2 12
# 3 c 3 13
# 4 d 4 14
# 5 e 5 15

class(dat)
# [1] "tbl_df"     "tbl"        "data.frame"

