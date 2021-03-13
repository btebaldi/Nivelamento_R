rm(list = ls())

library(ggplot2)
library(dplyr)
library(tibble)
library(tidyr)

Utility <- function (c, a){
  
  # define function return
  ret = as.numeric(NA)
  if(a == 1){
    if(any(c <= 0)) {
      errorMsg <- sprintf("\nc must be bigger than zero (c>0). Current value %f\n", c[c<=0])
      stop(errorMsg)
    }
    ret <- log(c)
  } else {
    ret <- ((c)^(1-a) - 1)/(1-a)
  }
  
  return(ret)
}

Data <- tibble(c=seq(from = 1, to = 5, by = 0.05))

Data %>% mutate(A_1 = Utility(c, 1),
  A_2 = Utility(c, 2),
  A_3 = Utility(c, 3),
  A_5 = Utility(c, 5),
  A_8 = Utility(c, 8),
  A_13 = Utility(c, 13)) %>%
  pivot_longer(cols = starts_with("A_"),
               names_to = "Risk",
               names_prefix = "A_",
               # names_transform = list(Risk = as.integer),
               values_to = "valor"
  )  %>% 
  ggplot() + 
  geom_line(aes(x=c, y=valor, colour=Risk)) + 
  labs(title = " Curvas de utilidade",
       y = "Utilidade",
       x = "bem consumido",
       colour = "Risk factor")


