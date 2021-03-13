### Commodities e Industria Brasileira ----------------------------------------------------------
### Guilherme Micota Stipp
### 26/02/2021

# Pacotes ---------------------------------------------------------------------------------------
library(magrittr)
library(tidyverse)
library(tidyr)
library(sidrar)

# Dados -----------------------------------------------------------------------------------------
LinkSidra <- ('/t/1848/n1/all/v/631,811/p/last%201/c12762/116882,116885,116888,116890,116898,116900,116906,116908,116912,116916,116918,116922,116926,116930,116938,116941,116944,116953,116957,116961,116963,116966,116971,116975,116977,116979,116986,116991,116995,116997,117000,117005,117008,117010,117016,117018,117021,117025,117030,117034,117037,117040,117042,117045,117049,117055,117059,117063,117065,117068,117072,117076,117083,117085,117090,117094,117100,117104,117106,117108,117112,117117,117120,117125,117128,117133,117137,117141,117144,117148,117152,117154,117160,117162,117165,117168,117170,117173,117175,117177,117180,117182,117185,117189,117191,117194,117197,117203,117210,117214,117216,117221,117230,117232,117234,117236,117243,117246,117249,117252,117255,117257,117262,117268,117271,117273,117275,117277,117279,117284,117293,117897')

Industria <- get_sidra(api = LinkSidra)

Industria <- Industria %>% rename(Atividades = `Classificação Nacional de Atividades Econômicas (CNAE 2.0)`) %>%
  select(Atividades, Variável, Valor) %>%
  pivot_wider(names_from = Variável, values_from = Valor) %>%
  rename(`Empregos (Milhares)` = `Pessoal ocupado em 31/12`, `VTI (Milhares)` = `Valor da transformação industrial`) %>%
  mutate(`Empregos (Milhares)` = `Empregos (Milhares)`/1000) %>%
  mutate(`VTI per capita` = `VTI (Milhares)`/`Empregos (Milhares)`)

str_extract(Industria$`Classificação Nacional de Atividades Econômicas (CNAE 2.0)`, regex("(?<=\\d.\\d ).*"))

mutate(Industria, Ativ = str_extract(Atividades, regex("((?<=\\d\\d.\\d ).*)|(Total)")))