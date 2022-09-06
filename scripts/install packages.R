rm(list = ls())

pck_list <- c(
  # Must have
  "dplyr",        # Analise de banco de dados
  "ggplot2",      # Pacote para graficos
  "readr",        # Carrega base de dados em arquivos texto (CSV, etc.)
  "readxl",       # Carrega base de dados em arquivos excel (Xlsx, xls)
  "tibble",       # Pacote de tabelas mais esquematizadas
  "stringi",      # Pacotes de trabalho de Strings
  "stringr",      # Pacotes de trabalho de Strings
  "magrittr",     # Pipe %>% 
  "lubridate",    # gerenciamento de datas
  "tidyr",        # Analise de banco de dados (Must have)
  
  # Muito bom
  "plm",          # Pacote de regressoes em painel
  "AER",          # Applied Econometrics with R
  "urca",         # Analise de modelos VAR e VECM (muito bom!)
  "vars",         # Analise de modelos VAR e VECM (muito bom!)
  "cowplot",      # Pacore para ajuste de Gaficos
  "rvest",        # Web Scrapping
  "writexl",      # Permite exportar tabelas para arquivos em excel.
  
  # Desejavel
  "zoo",          # Pacote base para Time Series
  "glmnet",       # Utilizado para Lasso and Elastic-Net Regularized Generalized
  "tseries", 
  "timeSeries",   # Analise de Serie de tempo
  "TSA",          # Analise de Serie de tempo (Muda o ACF)
  "tsDyn",        # Analise de modelos VAR e VECM (muito bom!)
  "forcats",      # Tools for Working with Categorical Variables (Factors)
  "mvtnorm",      # Normal Multivariada
  "forecast",     # Forecasting Functions for Time Series and Linear Models
  "bizdays",      # Pacote para analise de dias uteis
  "data.table",   # Analise de banco de dados
  "xts", 
  
  # Utilizado em aplicacoes especificas
  "sandwich", 
  "rugarch",      # Modelagem da variancia. Pacotes Garch e afins
  "sidrar",       # Pacotes de acesso a dados do SIDRA
  "wooldridge",   # Banco de dados do wooldridge
  "xgboost",      # Pacote para analie de regressoes de XGBoost
  "e1071",        # Misc Functions of of Statistics (Support Vector Machines)
  "randomForest", # Regressoes de Floresta aleatoria
  "progress",     # barra de progresso
  "jsonlite",     # interpretação de arquivos JSON
  "astsa", 
  "broom", 
  "caret",        # Pacote para utilizacao de varios pacotes de Machine Learning
  "dlm",          # Dynamic Linear Models
  "RColorBrewer", # Pacote para escolha de cores
  "fmsb", 
  "lmtest",       # testes Econometricos
  "MASS", 
  "MTS", 
  "nlme", 
  "rstudioapi", 
  "tseriesChaos", 
  "fpc",          # Machine Learning K Means Clustering
  "plotly",       # 3d ploting
  "readxlsb"      # leitura de planilhas xlsb

)


x <- readline("Instalar pacotes? [Yes/No]")
if(x %in% c("Yes", "yes")){
  cat(sprintf("\nInstalando os pacotes.\n"))
  install.packages(pck_list)
}

