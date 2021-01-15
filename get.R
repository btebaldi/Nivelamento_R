a=1L
b=3.5
c="Amanda!!!!"


lista <- c("a", "b", "c")

for(item in lista){
  
  x <- get(item)
  
  cat(sprintf("Nome da variavel:   %s \n", item))
  cat(sprintf("Classe da variavel: %s \n", class(x)))
  cat(sprintf("Valor:              %s \n\n", x))
}
