#' ---
#' title: "R Data Types"
#' author: "Bruno Tebaldi de Queiroz Barbosa"
#' date: "2023-02-04"
#' output: html_document
#' ---

# Setup -------------------------------------------------------------------
rm(list=ls())

# Operadores aritmeticos em R ---------------------------------------------

x <- 5
y <- 16

x+y
# [1] 21
x-y
# [1] -11

x*y
# [1] 80

y/x
# [1] 3.2

y%/%x
# [1] 1

y%%x
# [1] 1

y^x
# [1] 1048576


# Operadores relacionais --------------------------------------------------
x <- 5
y = 16

y == 17
y == 16

x>y
# [1] FALSE

x<=y
# [1] TRUE

x == y
# [1] FALSE

y>y
# [1] FALSE

y>=y
# [1] TRUE

x!=y
# [1] TRUE





# Operadores logicos ------------------------------------------------------
x <- c(TRUE,FALSE,0,6)
y <- c(FALSE,TRUE,FALSE,TRUE)

!!x
# [1] FALSE TRUE TRUE FALSE

x&y
# [1] FALSE FALSE FALSE TRUE

x&&y
# [1] FALSE

x|y
# [1] TRUE TRUE FALSE TRUE

x||y
# [1] TRUE



# Operacao em Vetores -----------------------------------------------------
x <- c (2,8,3)
y <- c (6,4,1)

x + y
# [1] 8 12 4

x > y
# [1] FALSE TRUE TRUE


x <- c(2,1,8,3)
y <- c(9,4)

x+y # Element of y is recycled to 9,4,9,4
# [1] 11 5 17 7

x-1 # Scalar 1 is recycled to 1,1,1,1
# [1] 1 0 7 2

x+c(1,2,3)
# [1] 3 3 11 4
# Warning message:
#   In x + c(1, 2, 3) :
#   longer object length is not a multiple of shorter object length



# Operadores de atribuicao ------------------------------------------------
x=5
y=6

x<-y


x <- 5
x
# [1] 5

x = 9
x
# [1] 9

10 -> x
x
# [1] 10



