
#' ---
#' title: "R Data Types"
#' author: "Bruno Tebaldi de Queiroz Barbosa"
#' date: "2023-02-04"
#' output: html_document
#' ---

# Setup -------------------------------------------------------------------
rm(list=ls())


# if/else -----------------------------------------------------------------

ano = 2019
if (ano == 2020) {
  print("2020 e o 1o ano da pandemia")
} else if (ano > 2020) {
  print("Ainda nao sabemos se havera pandemia do COVID-19")
} else {
  print("Ano sem COVID-19")
}

