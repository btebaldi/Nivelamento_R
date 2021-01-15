# Script DataLoader.r


# Carrega a base de dados
covid_data <- read_excel("Database/owid-covid-data.xlsx",
                         col_types = c("text",         # iso_code
                                       "text",         # continent
                                       "text",         # location
                                       "text",         # date
                                       "numeric",      # total_cases
                                       "numeric",      # new_cases
                                       "numeric",      # new_cases_smoothed
                                       "numeric",      # total_deaths
                                       "numeric",      # new_deaths
                                       "numeric",      # new_deaths_smoothed
                                       "numeric",      # total_cases_per_million
                                       "numeric",      # new_cases_per_million
                                       "numeric",      # new_cases_smoothed_per_million
                                       "numeric",      # total_deaths_per_million
                                       "numeric",      # new_deaths_per_million
                                       "numeric",      # new_deaths_smoothed_per_million
                                       "numeric",      # reproduction_rate
                                       "numeric",      # icu_patients
                                       "numeric",      # icu_patients_per_million
                                       "numeric",      # hosp_patients
                                       "numeric",      # hosp_patients_per_million
                                       "numeric",      # weekly_icu_admissions
                                       "numeric",      # weekly_icu_admissions_per_million
                                       "numeric",      # weekly_hosp_admissions
                                       "numeric",      # weekly_hosp_admissions_per_million
                                       "numeric",      # new_tests
                                       "numeric",      # total_tests
                                       "numeric",      # total_tests_per_thousand
                                       "numeric",      # new_tests_per_thousand
                                       "numeric",      # new_tests_smoothed
                                       "numeric",      # new_tests_smoothed_per_thousand
                                       "numeric",      # positive_rate
                                       "numeric",      # tests_per_case
                                       "text",         # tests_units
                                       "numeric",      # total_vaccinations
                                       "numeric",      # new_vaccinations
                                       "numeric",      # new_vaccinations_smoothed
                                       "numeric",      # total_vaccinations_per_hundred
                                       "numeric",      # new_vaccinations_smoothed_per_million
                                       "numeric",      # stringency_index
                                       "numeric",      # population
                                       "numeric",      # population_density
                                       "numeric",      # median_age
                                       "numeric",      # aged_65_older
                                       "numeric",      # aged_70_older
                                       "numeric",      # gdp_per_capita
                                       "numeric",      # extreme_poverty
                                       "numeric",      # cardiovasc_death_rate
                                       "numeric",      # diabetes_prevalence
                                       "numeric",      # female_smokers
                                       "numeric",      # male_smokers
                                       "numeric",      # handwashing_facilities
                                       "numeric",      # hospital_beds_per_thousand
                                       "numeric",      # life_expectancy
                                       "numeric"       # human_development_index
                         )
                         )

# Converte a coluna date para uma variavel do tipo data.
covid_data$date = as.Date(covid_data$date)

# filtre os paises selecionados
PaisesSelecionados <-  c("Brazil",
                         "United States",
                         "Mexico",
                         "Germany",
                         "France",
                         "United Kingdom"
)

# Filtra a base para conter apenas os paises selecionados.
covid_data <- covid_data %>% dplyr::filter(location %in% PaisesSelecionados) 


# Seleciona apenas as variaveis utilizadas.
covid_data <- covid_data %>% dplyr::select(location, date, total_cases, new_cases)

