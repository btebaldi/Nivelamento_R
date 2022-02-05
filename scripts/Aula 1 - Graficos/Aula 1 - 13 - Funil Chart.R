library(ggplot2)
# library(ggthemes)
# options(scipen = 999)  # turns of scientific notations like 1e+40

# Read data
# saveRDS(x=tbl, file = "./databases/email_campaign_funnel.rds")
tbl <- readRDS("./databases/email_campaign_funnel.rds")
tbl$Users2 <- tbl$Users
tbl$Users <- abs(tbl$Users)


ggplot(tbl, aes(x = Stage, y = Users, fill = Gender)) +   # Fill column
  geom_bar(width = .6)    # draw the bars
  
ggplot(tbl, aes(x = Stage, y = Users, fill = Gender)) +   # Fill column
  geom_bar(stat = "identity", width = .6)    # draw the bars


ggplot(tbl, aes(x = Stage, y = Users2, fill = Gender)) +   # Fill column
  geom_bar(stat = "identity", width = .6)    # draw the bars


# X Axis Breaks and Labels 
brks <- seq(-15000000, 15000000, 5000000)
lbls = paste0(as.character(c(seq(15, 0, -5), seq(5, 15, 5))), "m")

ggplot(tbl, aes(x = Stage, y = Users2, fill = Gender)) +   # Fill column
  geom_bar(stat = "identity", width = .6) +   # draw the bars
  scale_y_continuous(breaks = brks,   # Breaks
                     labels = lbls)

ggplot(tbl, aes(x = Stage, y = Users2, fill = Gender)) +   # Fill column
  geom_bar(stat = "identity", width = .6) +   # draw the bars
  scale_y_continuous(breaks = brks,   # Breaks
                     labels = lbls) + # Labels
  coord_flip() 


ggplot(tbl, aes(x = Stage, y = Users2, fill = Gender)) +   # Fill column
  geom_bar(stat = "identity", width = .6) +   # draw the bars
  scale_y_continuous(breaks = brks,   # Breaks
                     labels = lbls) + # Labels
  coord_flip() +  # Flip axes
  labs(title="Email Campaign Funnel",
       y=NULL, x = NULL) +
  # theme_tufte() +  # Tufte theme from ggfortify
  theme(plot.title = element_text(hjust = .5), 
        axis.ticks = element_blank()) +   # Centre plot title
  scale_fill_brewer(palette = "Dark2")
  

ggsave(filename = "./Graficos/Aula 1/13_Funil.png",units = "in",
       width = 8, height = 6,dpi = 100)

