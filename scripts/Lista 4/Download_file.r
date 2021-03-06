# Script para download do arquivo da covid-19
# Ultima atualizacao dia 2021-03-06
# 
# Autor: Bruno Tebaldi
# FGV-EESP
# Nivelamento de R

# link de download
down_link = "https://covid.ourworldindata.org/data/owid-covid-data.xlsx"

# Nome do arquivo local na maquina
local_file = "./databases/owid-covid-data.xlsx"

# processo de download
# wb: arquivo binario.
download.file(url = down_link,
              destfile = local_file,
              mode="wb")

# limpeza de variaveis nao utilizadas
rm(list = c("down_link", "local_file"))
