#' Author: Bruno Tebaldi de Queiroz Barbosa
#'
#' Data: 2022-09-24
#'
#' Cria um grafico com Diverting bars

# Setup -------------------------------------------------------------------

rm(list = ls())

library(ggplot2)
library(dplyr)

# Data load ---------------------------------------------------------------

data("mtcars")  # load data

head(mtcars)

# Data regularization -----------------------------------------------------

# (1) create new column for car names
# (2) compute normalized mpg
# (3) above / below avg flag
mtcars <- mtcars %>%
  as_tibble() %>% 
  mutate(carName = rownames(mtcars),
         mpg_z = round((mpg - mean(mpg))/sd(mpg), 2),
         mpg_type = if_else(condition = (mpg_z < 0), true = "below", false = "above")) %>%
  arrange(mpg_z)

# convert to factor to retain sorted order in plot.
mtcars$carName <- factor(mtcars$carName, levels = mtcars$carName)


ggplot(mtcars, aes(x=carName, y=mpg_z, label=mpg_z)) + 
  geom_bar(stat='identity', aes(fill=mpg_type), width=.5)  +
  scale_fill_manual(name="Mileage", 
                    labels = c("Above Average", "Below Average"), 
                    values = c("above"="#00ba38", "below"="#f8766d")) + 
  labs(subtitle="Normalized mileage from 'mtcars'", 
       title= "Diverging Bars", x = "Car name", y = "Miles per gallon (normalized)") + 
  coord_flip() +
  theme_bw() + 
  theme(legend.position = "bottom")

