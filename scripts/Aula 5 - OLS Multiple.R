
# Setup -------------------------------------------------------------------

rm(list=ls())
library(readxl)
library(dplyr)
library(ggplot2)


# Dataload ----------------------------------------------------------------
vote1 <- read_excel("databases/Wooldridge_vote1.xlsx")

head(vote1)




# Regressao ---------------------------------------------------------------
mdl = lm(voteA ~ 1 + log(expendA) + log(expendB) + prtystrA, data = vote1)
summary(mdl)


# Data manipulation -------------------------------------------------------

vote2 <- vote1 %>% select(voteA, expendA, expendB, prtystrA) %>% 
  mutate(ln_expendA = log(expendA), ln_expendB = log(expendB))

mdl2 = lm(voteA ~ 1 + ln_expendA + ln_expendB + prtystrA, data = vote2)
summary(mdl2)



# Grafico -----------------------------------------------------------------

ggplot(vote2) +
  geom_point(aes(x=ln_expendA, y = voteA)) + 
  geom_abline(intercept = mdl$coefficients["(Intercept)"],
              slope = mdl$coefficients["log(expendA)"], colour = "red")
