rm(list = ls())
library(ggplot2)
library(dplyr)

# define a matriz de transicao entre estados
M = tibble(Status = 1:2, Rico = c(0.90, 0.05), Pobre = c(0.10, 0.95))


# define o total de pessoas na economia e total de simulacoes a serem feitas
Total_simul = 100
Total_pessoas = 10000

# Controi uma tabela com o total de pessoas e total de simulacoes
tbl = tibble(sim=sort(rep(1:Total_simul, Total_pessoas)),
             Individuo=rep(1:Total_pessoas, Total_simul),
             Status = as.integer(NA))
# levels(tbl$Status) = c("Pobre", "Rico")

# distribuição inicial
# lemmbrando que estado atual rico é a linha 1 na matriz M
# lemmbrando que estado atual pobre é a linha 2 na matriz M
tbl$Status[tbl$sim == 1] = c(rep(2, 0.0*Total_pessoas), rep(1, 1.0*Total_pessoas))

for(i in 1:(100-1)) {
  # Cadeia de Markov depende apenas do seu estado atual entao nao precisa olhar
  # nada alem do estado atual. As pessoas são independentes, logo nao tem
  # interacao entre elas, e assim a analise é feita para cara linha da tabela
  
  tbl_aux <- tbl[tbl$sim == i, ] %>% 
    inner_join(M, by = c("Status" = "Status")) %>%
    mutate(p=runif(n = Total_pessoas), troca_p_rico=p<Rico, newState=2)
  
  tbl_aux$newState[tbl_aux$troca_p_rico] = 1
  
  # atualiza o novo estado
  tbl$Status[tbl$sim == (i+1)] = tbl_aux$newState

}


tbl %>% group_by(sim, Status) %>% summarise(qtd=n()) %>%
  mutate(Status = factor(Status, levels = c(1,2), labels = c("Rico", "Pobre"))) %>% 
  ggplot() + 
  geom_line(aes(x=sim, y=qtd/Total_pessoas, colour=Status)) + 
  geom_hline(yintercept = 1/3, linetype="dashed", colour="blue", alpha=0.5) +
  geom_hline(yintercept = 2/3, linetype="dashed", colour="blue", alpha=0.5) +
  labs(title = "Markov Chain", 
       y="% de pessoas",
       x = "Periodo") + ylim(0,1)


