rm(list = ls())
source("./scripts/Aula 4 - funcoes/06 - RaizesQuadratica.r")


vec_a <- c( 1, 2,  3, 1, 1)
vec_b <- c(-5, 1, -1, 4, 8)
vec_c <- c( 6, 1,  1, 0, 9)


Mat <- RaizesQuadratica(vec_a, vec_b, vec_c)

Mat

print("Fim de Script!")





















