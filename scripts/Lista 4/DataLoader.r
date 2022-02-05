# Script da lista 4
# Ultima atualizacao dia 2021-03-06
# 
# Autor: Bruno Tebaldi
# FGV-EESP
# Nivelamento de R

# bibliotecas utilizadas
library(readxl)
library(dplyr)

# Carrega a base de dados -------------------------------------------------
# Abrir o banco de dados de nome \owid-covid-data.xlsx" que esta no diretorio
# "Database"
covid_data <- readxl::read_excel("./databases/owid-covid-data.xlsx", 
                                 col_types = c("text",            # iso_code
                                               "text",            # continent
                                               "text",            # location
                                               "text",            # date
                                               "numeric",         # total_cases
                                               "numeric",         # new_cases
                                               "numeric",         # new_cases_smoothed
                                               "numeric",         # total_deaths
                                               "numeric",         # new_deaths
                                               "numeric",         # new_deaths_smoothed
                                               "numeric",         # total_cases_per_million
                                               "numeric",         # new_cases_per_million
                                               "numeric",         # new_cases_smoothed_per_million
                                               "numeric",         # total_deaths_per_million
                                               "numeric",         # new_deaths_per_million
                                               "numeric",         # new_deaths_smoothed_per_million
                                               "numeric",         # reproduction_rate
                                               "numeric",         # icu_patients
                                               "numeric",         # icu_patients_per_million
                                               "numeric",         # hosp_patients
                                               "numeric",         # hosp_patients_per_million
                                               "numeric",         # weekly_icu_admissions
                                               "numeric",         # weekly_icu_admissions_per_million
                                               "numeric",         # weekly_hosp_admissions
                                               "numeric",         # weekly_hosp_admissions_per_million
                                               "numeric",         # new_tests
                                               "numeric",         # total_tests
                                               "numeric",         # total_tests_per_thousand
                                               "numeric",         # new_tests_per_thousand
                                               "numeric",         # new_tests_smoothed
                                               "numeric",         # new_tests_smoothed_per_thousand
                                               "numeric",         # positive_rate
                                               "numeric",         # tests_per_case
                                               "text",            # tests_units
                                               "numeric",         # total_vaccinations
                                               "numeric",         # people_vaccinated
                                               "numeric",         # people_fully_vaccinated
                                               "numeric",         # total_boosters
                                               "numeric",         # new_vaccinations
                                               "numeric",         # new_vaccinations_smoothed
                                               "numeric",         # total_vaccinations_per_hundred
                                               "numeric",         # people_vaccinated_per_hundred
                                               "numeric",         # people_fully_vaccinated_per_hundred
                                               "numeric",         # total_boosters_per_hundred
                                               "numeric",         # new_vaccinations_smoothed_per_million
                                               "numeric",         # new_people_vaccinated_smoothed
                                               "numeric",         # new_people_vaccinated_smoothed_per_hundred
                                               "numeric",         # stringency_index
                                               "numeric",         # population
                                               "numeric",         # population_density
                                               "numeric",         # median_age
                                               "numeric",         # aged_65_older
                                               "numeric",         # aged_70_older
                                               "numeric",         # gdp_per_capita
                                               "numeric",         # extreme_poverty
                                               "numeric",         # cardiovasc_death_rate
                                               "numeric",         # diabetes_prevalence
                                               "numeric",         # female_smokers
                                               "numeric",         # male_smokers
                                               "numeric",         # handwashing_facilities
                                               "numeric",         # hospital_beds_per_thousand
                                               "numeric",         # life_expectancy
                                               "numeric",         # human_development_index
                                               "numeric",         # excess_mortality_cumulative_absolute
                                               "numeric",         # excess_mortality_cumulative
                                               "numeric",         # excess_mortality
                                               "numeric"          # excess_mortality_cumulative_per_million
                                               
                                 ))


# Converte a coluna -------------------------------------------------------
# Converte a coluna date para uma variavel do tipo data.
covid_data$date = as.Date(covid_data$date)


# Filtra os paises --------------------------------------------------------
# O script deve filtrar a base e mostrar apenas ose seguintes paises: "Brazil",
# "United States", "Mexico", "Germany", "France", "United Kingdom"
PaisesSelecionados <-  c("Brazil", "United States", "Mexico","Germany",
                         "France","United Kingdom")

# Filtra a base para conter apenas os paises selecionados.
covid_data.filter <- dplyr::filter(covid_data, location %in% PaisesSelecionados)


# Seleciona Colunas -------------------------------------------------------
# O script deve selecionar apenas as variaveis: location, date, total cases, new
# cases

covid_data.filter <- dplyr::select(covid_data.filter, location, date,
                                   total_cases,new_cases)


# Remove variaveis que nao serao mais utilizadas.
rm(list = c("covid_data", "PaisesSelecionados"))

