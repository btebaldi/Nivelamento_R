# Script para download do arquivo da covid-19
# Ultima atualizacao dia 2021-03-06
# 
# Autor: Bruno Tebaldi
# FGV-EESP
# Nivelamento de R

# link de download
down_link = "https://covid.ourworldindata.org/data/owid-covid-data.xlsx"

# Nome do arquivo local na maquina
local_file = sprintf("./databases/Lista 4/%s owid-covid-data.xlsx", Sys.Date())

# processo de download
# wb: arquivo binario.
download.file(url = down_link,
              destfile = local_file,
              mode="wb")
