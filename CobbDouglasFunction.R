CobbDouglas <- function(x, y){
  ret <- (x^0.3)*(y^(1-0.3))
  
  return(ret)
}


CobbDouglasAdvanced <- function(x, y, alpha=0.5){
  ret <- (x^alpha)*(y^(1-alpha))
  
  return(ret)
}