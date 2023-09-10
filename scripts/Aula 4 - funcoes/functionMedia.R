CalculaMedia <- function(P1, P2, TR, LT){
  
  if(is.na(LT)){
    LT = 0
  }
    
  
  
  media=(0.3*P1) + (0.4*P2) + (0.2*TR) + (0.1*LT)
  
  return(media)
  
}
