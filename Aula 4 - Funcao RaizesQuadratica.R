rm(list = ls())


RaizesQuadratica = function(a_v, b_v, c_v) {
  # Validacao
  n = length(a_v)
  
  if(length(b_v) != n) { stop("tamanho de vetores diff.") }
  if(length(c_v) != n) { stop("tamanho de vetores diff.") }
  
  resposta = matrix(data = NA, nrow = n, ncol=2)
  colnames(resposta) = c("X1", "X2")

  for(idx in 1:n){
    # print(sprintf("Exec.: %d", idx))
    # print(b[idx])
    
    # busco no vetor de entrada dos dados o elemento no indice idx.
    a = a_v[idx]
    b = b_v[idx]
    c = c_v[idx]
    
    # declaracao das respostas
    x1 = as.numeric(NA)
    x2 = as.numeric(NA)
    
    # Logica
    Delta = b^2 - 4*a*c
    
    if(Delta < 0){
      # Nao tem raiz real
      x1 = NA
      x2 = NA
      
    } else if (Delta == 0) {
      # Tem uma unica raiz real
      x1 = -b/(2*a)
      x2 = NA
      
    } else {
      # Tem duas raizes reais
      x1 = min( (-b + Delta^0.5)/(2*a), (-b - Delta^0.5)/(2*a) )
      x2 = max( (-b + Delta^0.5)/(2*a), (-b - Delta^0.5)/(2*a) )
      
    }
    
    resposta[idx, "X1"] = x1
    resposta[idx, "X2"] = x2

    # resposta[idx, 1] = x1
    # resposta[idx, 2] = x2

  } # Final do FOR
  
  return(resposta)
}


RaizesQuadratica(1,  1,  1)
RaizesQuadratica(1,  5,  6)
RaizesQuadratica(1, -5,  6)
RaizesQuadratica(1,  0,  0)
RaizesQuadratica(1, -2,  1)

a = c(1, 1, 1, 1, 1)
b = c(1, 5, -5, 0, 2)
c = c(1, 6, 6, 0, 1)

tbl = data.frame(a, b, c)
tbl

RaizesQuadratica(tbl$a,tbl$b, tbl$c)


