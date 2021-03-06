
# Setup -------------------------------------------------------------------

# Limpeza de variaveis antigas
rm(list = ls())


# Bibliotecas -------------------------------------------------------------
library(dplyr)
library(ggplot2)
library(here)


# Vamos escrever a função a ser integrada
# No caso a pdf da curva normal padrao
Normal.pdf <- function (x){
  f <- (1/(2*pi)^0.5)*exp(-(x^2)/2)
  return(f)
}

# Determinamos o espaço de integracao
a <- -1.95
b <- 1.95

if(a == b) { stop("ERRO: pontos 'a' e 'b' são iguais!")}

N=10

# Vamos dividir nosso intervalo
intervalo <- seq(from=min(a,b), to=max(a,b), length.out = N)

# Por questoes didaticas vamos organizar os dados em um data.frame
data <- data.frame(inf = intervalo[-length(intervalo)],
                   sup = intervalo[-1],
                   med = as.numeric(NA),
                   f = as.numeric(NA)
)

# Calculamos o ponto medio
data$med = (data$inf + data$sup)/2

# Calculamos o valor da funcao no ponto medio
data$f = Normal.pdf(data$med)

# Calculamos a soma de Reimann
Integral = sum(data$f * (data$sup - data$inf))

curvaNormal <- data.frame(x=seq(from=-4, to=4, by=0.001), y=dnorm(seq(from=-4, to=4, by=0.001)))


ggplot(data) +
  geom_rect(aes(xmin=inf, xmax=sup, ymin=0, ymax=f), fill="blue", alpha =0.3, data=data) + 
  geom_line(aes(x=x, y=y), data= curvaNormal)



cat(sprintf("Integral numerica calculada: %8.6f
Integral numerica do R:      %8.6f", Integral, pnorm(max(a,b)) - pnorm(min(a,b))))

