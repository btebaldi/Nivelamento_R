N=1000
r = rnorm(n = N, mean = 1, sd = 0.1)
theta = runif(n=N, min = 0, max = 2*pi)

library(dplyr)
library(ggplot2)


tbl <- tibble(X=as.numeric(NA),
              Y=as.numeric(NA),
              R=r,
              Theta = theta)

tbl <- tbl %>% mutate(X = R*cos(Theta), 
               Y= R*sin(Theta))

tbl %>% 
  filter(X>0.5, Y<0) %>% 
  ggplot() + 
  geom_point(aes(x=X, y=Y)) + 
  xlim(-1.5,1.5)+
  ylim(-1.5,1.5)


ggplot(tbl) + 
  geom_point(aes(x=X, y=Y)) + 
  xlim(-1.5,1.5)+
  ylim(-1.5,1.5)



tbl %>% 
  filter(X>0.5, Y<0) %>% 
  lm(Y~X, data=.) %>% summary()

mdl <- lm(Y~X, data=tbl)
summary(mdl)




