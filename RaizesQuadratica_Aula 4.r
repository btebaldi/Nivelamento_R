# x2 -5x + 6

RaizesQuadratica <- function(vec_a, vec_b, vec_c){

# vec_a <- c( 1, 2,  3, 1, 1)
# vec_b <- c(-5, 1, -1, 4, 8)
# vec_c <- c( 6, 1,  1, 0, 9)

n <- length(vec_a)

ret <- matrix(data=NA, nrow = n, ncol = 2)
colnames(ret) <- c("X1", "X2")




for(i in 1:n) {
  a <- vec_a[i]
  b <- vec_b[i]
  c <- vec_c[i]
  
  print("Variaveis A, B C")
  print(i)
  print(a)
  print(b)
  print(c)
  
  # cat(sprintf("%d X^2 + %d X + %d", a,b,c),  "\n")
  
  delta <- b^2 -4*a*c
  
  if(delta < 0){
    # print("Nao tem raiz real")
    
    x1 <- NA
    x2 <- NA
    
  } else if(delta == 0) {
    # print("tem uma unica raiz real")
    
    x1 <- (-b )/(2*a)
    x2 <- NA
    
  } else if(delta > 0) {
    # print("existem duas raizes reais")
    
    x1 <- (-b - sqrt(delta))/(2*a)
    x2 <- (-b + sqrt(delta))/(2*a)
  }
  
  
  ret[i, 1] <- x1
  ret[i, 2] <- x2
}

return(ret)
}









