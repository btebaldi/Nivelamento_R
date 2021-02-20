# Carrega as bibliotecas
library(tidyverse)

# Mostra a base de dados 
View(mpg)

# Faz um grafico de pontos com as seguintes caracteristicas:
# 1) variavel displ no eixo x
# 2) variavel hwy no eixo y
# 3) utiliza o banco mpg
ggplot(data = mpg) +
  geom_point(mapping = aes(x=displ, y=hwy))

# Faz um grafico de pontos com as seguintes caracteristicas:
# 1) variavel "hwy" no eixo x
# 2) variavel "cyl" no eixo y
# 3) utiliza o banco mpg
ggplot(data=mpg) +
  geom_point(mapping = aes(x=hwy, y = cyl))

# Faz um grafico de pontos com as seguintes caracteristicas:
# 1) variavel "class" no eixo x
# 2) variavel "drv" no eixo y
# 3) utiliza o banco mpg
ggplot(data=mpg) +
  geom_point(mapping = aes(x=class, y = drv))

# Faz um grafico de pontos com as seguintes caracteristicas:
# 1) variavel "displ" no eixo x
# 2) variavel "hwy" no eixo y
# 3) utiliza o banco mpg
# 4) Colorindo pela variavel "class" 
ggplot(data=mpg) +
  geom_point(mapping = aes(x=displ, y=hwy, colour=class))

# Faz um grafico de pontos com as seguintes caracteristicas:
# 1) variavel "displ" no eixo x
# 2) variavel "hwy" no eixo y
# 3) utiliza o banco mpg
# 4) Colorindo de azul com transparencia de 30%
ggplot(data=mpg) +
  geom_point(mapping = aes(x=displ, y=hwy),
             colour="blue",
             alpha = 0.3)


# Faz um grafico de pontos com as seguintes caracteristicas:
# 1) variavel "displ" no eixo x
# 2) variavel "hwy" no eixo y
# 3) utiliza o banco mpg
# 4) Dividindo por facetas de acordo com a variavel "class" 
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_wrap( ~ class, nrow = 3)

# Faz um grafico de linha com as seguintes caracteristicas:
# 1) variavel "displ" no eixo x
# 2) variavel "hwy" no eixo y
# 3) utiliza o banco mpg
ggplot(data = mpg) +
  geom_line(mapping = aes(x = displ, y = hwy)) 

# Faz um grafico de barras com as seguintes caracteristicas:
# 1) variavel "class" no eixo x
# 2) no eixo y sera a frequencia absoluta da variavel
# 3) utiliza o banco mpg
ggplot(data=mpg) +
  geom_bar(mapping = aes(x=class))


# Faz um grafico de Histograma com as seguintes caracteristicas:
# 1) variavel "hwy" no eixo x
# 2) No eixo y sera mostrado a densidade
# 3) utiliza o banco mpg
ggplot(data=mpg) +
  geom_histogram(mapping = aes(x=hwy, y = ..density..))

# Faz um grafico de caixa (boxplot) com as seguintes caracteristicas:
# 1) variavel "class" no eixo x
# 2) variavel "hwy" no eixo x
# 3) utiliza o banco mpg
ggplot(data=mpg) +
  geom_boxplot(mapping = aes(x=class, y=hwy))




# Faz um grafico com duas camadas:
#     Ambas as camadas utilizam o banco mpg
# CAMADA 1 (Grafico de linha)
#     1) variavel "displ" no eixo x
#     2) variavel "hwy" no eixo x
# CAMADA 2 (Grafico de pontos)
#     1) variavel "displ" no eixo x
#     2) variavel "hwy" no eixo x
#     2) Colorido por "class"
# 
# O comando labs() informa os titulos, subtitulos e nome dos eixos, etc
ggplot(data=mpg) +
  geom_line(mapping = aes(x=displ, y=hwy)) +
  geom_point(mapping = aes(x=displ, y=hwy, colour=class)) +
  labs(title = "Titulo do meu grafico",
       subtitle = "Subtitulo do Grafico",
       caption = "Fonte: banco de dados mpg",
       x="NOME DO EIXO X",
       y=NULL)

# Salva o ultimo grafico criado
ggsave(filename = "./graficos/Aula 1.png",
       units = "in",
       width = 8, height = 6,
       dpi = 100)






