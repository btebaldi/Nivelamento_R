library(dplyr)
library(ggplot2)

head(ChickWeight)


tbl_1 <- dplyr::mutate(ChickWeight, ln_weight = log(weight))


tbl_2 <- group_by(tbl_1, Diet)


tbl3 <- summarise(tbl_2,
                  mu.weight = mean(ln_weight),
                  sd.weight = sd(ln_weight),
                  qtd = n() )

ggplot(tbl3, mapping = aes(x=Diet, y=mu.weight)) + 
  geom_col()

rm(list = c("tbl_1", "tbl_2",  "tbl3" ))



ChickWeight %>%
  mutate(ln_weight = log(weight)) %>%
  group_by(Diet) %>%
  summarise(mu.weight = mean(ln_weight),
             sd.weight = sd(ln_weight),
             qtd = n()) %>%
  ggplot() + 
  geom_col(mapping = aes(x=Diet, y=mu.weight))




lm(weight ~ Time + Diet, data = ChickWeight)






ChickWeight %>% 
  lm(weight ~ Time + Diet, data = .)

# CTRL-SHIFT-M
# %>%
  






