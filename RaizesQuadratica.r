
RaizesQuadratica <- function(A, B, C){
  
  # Total de linhas nos vetores
  N = length(A)
  
  # ToDo: FAZER VALIDACAO DO TAMANHO A=B=C
  if(N != length(B)){
    stop("Erro: Vetores de tamanhos diferentes")
  }
  
  if(N != length(C)){
    stop("Erro: Vetores de tamanhos diferentes")
  }
  
  # print("Tamanho do vetor")
  # print(N)
  
  # Veriavel de retorno da funcao
  ret <- matrix(NA, ncol = 2, nrow = N)
  
  for (linha in 1:N) {
    a <- A[linha]
    b <- B[linha]
    c <- C[linha]
   
    if(a == 0){
      print("Warning: 'a' tem que ser diferente de zero")
      next()
    }
     
    # print("Linha")
    # print(linha)
    # 
    # print("Coeficientes a b c")
    # print(a)
    # print(b)
    # print(c)
    # 
    # print("VARIAVEL DE RETORNO")
    # print(ret)
    
    # Calcula o delta
    Delta = b^2 -4*a*c
    
    # print("DELTA")
    # print(Delta)
    
    # Avalia o delta e calcula as respectivas raizes
    if(Delta > 0){
      # Se Delta maior do que zero
      
      x1 = (-b + sqrt(Delta))/(2*a)
      x2 = (-b - sqrt(Delta))/(2*a)
      
      raiz_1 = min(x1, x2)
      raiz_2 = max(x1, x2)
      
    } else if (Delta == 0) {
      # Se Delta for igual zero
      
      raiz_1 = -b/(2*a)
      raiz_2 = NA
      
    } else if (Delta < 0) {
      # Se Delta for menor do que zero
      # NESTE CASO NAO TEMOS RAIZ REAL
      raiz_1 = NA
      raiz_2 = NA
    }
    
    # Coloco o resultado das contas na matriz de retorno
    ret[linha, 1] <- raiz_1
    ret[linha, 2] <- raiz_2
    
    # print("VARIAVEL DE RETORNO COM AS NOVAS RAIZES")
    # print(ret)
    
  } # FIM DO FOR (INTERACAO POR LINHA)
  
  
  return(ret)
}
