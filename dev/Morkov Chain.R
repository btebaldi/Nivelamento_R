rm(list = ls())
library(ggplot2)
library(dplyr)

# define a matriz de transicao entre estados
M = matrix(c(0.90, 0.10, 0.05, 0.95), nrow = 2, byrow = T)
colnames(M) = c("Rico", "Pobre")
rownames(M) = c("Rico", "Pobre")

# define o total de pessoas na economia e total de simulacoes a serem feitas
Total_simul = 100
Total_pessoas = 1000

# Controi uma tabela com o total de pessoas e total de simulacoes
tbl = tibble(sim=sort(rep(1:Total_simul, Total_pessoas)),
             Individuo=rep(1:Total_pessoas, Total_simul),
             Status = as.integer(NA))
# levels(tbl$Status) = c("Pobre", "Rico")

# distribuição inicial
# lemmbrando que estado atual rico é a linha 1 na matriz M
# lemmbrando que estado atual pobre é a linha 2 na matriz M
tbl$Status[tbl$sim == 1] = c(rep(2, 1.00*Total_pessoas), rep(1, 0.00*Total_pessoas))

for(row in 1:nrow(tbl)) {
  # Cadeia de Markov depende apenas do seu estado atual entao nao precisa olhar
  # nada alem do estado atual. As pessoas são independentes, logo nao tem
  # interacao entre elas, e assim a analise é feita para cara linha da tabela
  
  Individuo <-  tbl$Individuo[row]
  Estado_atual <- tbl$Status[row]
  simulacao <- tbl$sim[row]
  
  
  # faz o sorteio da probabilidade de mudanca
  prob <- runif(1)
  
  # ve na matriz qual o novo estado
  if(prob < M[Estado_atual,1]) { Estado_novo = 1} 
  else {Estado_novo = 2}
  
  # atualiza o novo estado
  if(simulacao < Total_simul){
    tbl[(tbl$sim == simulacao +1) & (tbl$Individuo == Individuo), "Status"] = Estado_novo
  }

}



tbl %>% group_by(sim, Status) %>% summarise(qtd=n()) %>%
  mutate(Status = factor(Status, levels = c(1,2), labels = c("Rico", "Pobre"))) %>% 
  ggplot() + 
  geom_line(aes(x=sim, y=qtd/Total_pessoas, colour=Status)) + 
  geom_hline(yintercept = 1/3) +
  geom_hline(yintercept = 2/3) +
  labs(title = "Markov Chain", 
       y="% de pessoas",
       x = "Periodo") + ylim(0,1)


# tbl %>% filter(Individuo == 4) %>% 
#   ggplot() +
#   geom_line(aes(x=sim, y=Status))

