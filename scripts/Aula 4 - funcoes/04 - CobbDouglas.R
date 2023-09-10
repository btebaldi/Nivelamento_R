#' ---
#' title: "Funcao Cobb-Douglas"
#' author: "Bruno Tebaldi de Queiroz Barbosa"
#' date: "2023-02-04"
#' output: html_document
#' ---

CobbDouglas <- function(x, y){
  ret <- (x^0.5)*y^(0.5)
  
  return(ret)
}


CobbDouglasAdvanced <- function(x, y, alpha = 0.5){
  ret <- (x^alpha)*y^(1-alpha)
  
  return(ret)
}