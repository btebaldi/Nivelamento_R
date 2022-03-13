
# Questao 1 ---------------------------------------------------------------
library(readxl)
GER_PI <- read_excel("./databases/Lista 3/DEUPROINDMISMEI.xls",
                     range = "A11:B741",
                     col_types = c("date","numeric"))
colnames(GER_PI) <- c("data", "prodInd")
head(GER_PI)

library(readr)
GER_Price <- read_csv("./databases/Lista 3/FPCPITOTLZGDEU.csv",
                      col_types = cols(DATE = col_date(format = "%Y-%m-%d"),
                                       FPCPITOTLZGDEU = col_double()))

colnames(GER_Price) <- c("data", "price")
head(GER_Price)


# Questao 2 ---------------------------------------------------------------

library(dplyr)
GER_PI$Ano <- lubridate::year(GER_PI$data)
GER_PI.grouped <- dplyr::group_by(GER_PI, Ano)
GER_PI.Anual <- dplyr::summarise(GER_PI.grouped, ProdIndAnual=mean(prodInd))


# Questao 3 ---------------------------------------------------------------

#Item 1
GER_PI.Anual <- dplyr::mutate(GER_PI.Anual, ln_prod = log(ProdIndAnual))
head(GER_PI.Anual)

# Item 2
GER_Price <- dplyr::mutate(GER_Price, ln_price = log(price))
head(GER_Price)

# Item 3
summary(GER_Price)

# Item 4
dplyr::filter(GER_Price, price <0)



# Questao 4 ---------------------------------------------------------------

GER_Price <- dplyr::mutate(GER_Price, ano = lubridate::year(data))
FullData <- dplyr::inner_join(GER_Price, GER_PI.Anual, by = c("ano" = "Ano"))

library(ggplot2)

ggplot(FullData) +
  geom_point(aes(x=ln_prod, y=price)) +
  geom_smooth(method=lm, linetype="dashed",fill="blue",mapping =  aes(x=ln_prod, y=price))



# Questao 5 ---------------------------------------------------------------

library(tidyr)

FullData <- dplyr::select(FullData, ano, price, ln_prod)

# FullDatalonger
FullDataLonger <- tidyr::pivot_longer(FullData, cols=c("price", "ln_prod"),
                                      names_to = "serie", 
                                      values_to="valor")

library(ggplot2)
ggplot(FullDataLonger) +
  geom_line(aes(x=ano, y=valor, colour=serie))

library(readr)
readr::write_excel_csv(x=FullDataLonger, file = "FullDataLonger.csv")
