#' Author: Bruno Tebaldi de Queiroz Barbosa
#'
#' Data: 2022-09-24
#'
#' Cria um grafico de barras circular
#'
#' A circular barplot is a barplot where bars are displayed along a circle
#' instead of a line.

# Setup -------------------------------------------------------------------

rm(list = ls())

library(ggplot2)
library(dplyr)

# Data load ---------------------------------------------------------------

# data("mtcars")  # load data
# 
# head(mtcars)

# number of individuals (at least n > 6)
n <- 60

na <- floor( (10/60)*n )
nb <- floor( (30/60)*n )
nc <- floor( (14/60)*n )
nd <- n-(na+nb+nc)


# Create dataset
data <- data.frame(individual = paste( "Mister ", seq(1,n), sep=""),
                   group = c( rep('A', na), rep('B', nb), rep('C', nc), rep('D', nd)) ,
                   value1 = sample( seq(10,100), n, replace=T),
                   value2 = sample( seq(10,100), n, replace=T),
                   value3 = sample( seq(10,100), n, replace=T)) %>% as_tibble()

data
# Data regularization -----------------------------------------------------


# Transform data in a tidy format (long format)
data <- data %>% 
  mutate(group = factor(group)) %>% 
  tidyr::pivot_longer(cols = c("value1", "value2", "value3"),
                      names_to = "observation",
                      values_to = "value")



# Calculation of inteval between groups -----------------------------------

# Set a number of 'empty bar' to add at the end of each group
empty_bar <- 1

nObsType <- nlevels(as.factor(data$observation))

to_add <- data.frame( matrix(NA, empty_bar*nlevels(data$group)*nObsType, ncol(data)) )

colnames(to_add) <- colnames(data)

to_add$group <- rep(levels(data$group), each=empty_bar*nObsType )

data <- data %>% bind_rows(to_add)

data <- data %>% arrange(group, individual)

data$id <- rep( seq(1, nrow(data)/nObsType) , each=nObsType)


# Rotation of individual name ---------------------------------------------

# Get the name and the y position of each label
label_data <- data %>% group_by(id, individual) %>% summarize(tot=sum(value))
number_of_bar <- nrow(label_data)

# I substract 0.5 because the letter must have the angle of the center of the bars. Not extreme right(1) or extreme left (0)
angle <- 90 - 360 * (label_data$id-0.5) /number_of_bar
label_data$hjust <- ifelse( angle < -90, 1, 0)
label_data$angle <- ifelse(angle < -90, angle+180, angle)

# prepare a data frame for base lines
base_data <- data %>% 
  group_by(group) %>% 
  summarize(start=min(id), end=max(id) - empty_bar) %>% 
  rowwise() %>% 
  mutate(title=mean(c(start, end)))

# prepare a data frame for grid (scales)
grid_data <- base_data
grid_data$end <- grid_data$end[ c( nrow(grid_data), 1:nrow(grid_data)-1)] + 1
grid_data$start <- grid_data$start - 1
grid_data <- grid_data[-1,]

# Make the plot
p <- ggplot(data) +      
  
  # Add the stacked bar
  geom_bar(aes(x=as.factor(id), y=value, fill=observation), stat="identity") +
  # scale_fill_viridis(discrete=TRUE) +
  
  # Add a val=100/75/50/25 lines. I do it at the beginning to make sur barplots are OVER it.
  geom_segment(data=grid_data, aes(x = end, y = 0, xend = start, yend = 0), colour = "grey", alpha=1, size=0.3 , inherit.aes = FALSE ) +
  geom_segment(data=grid_data, aes(x = end, y = 50, xend = start, yend = 50), colour = "grey", alpha=1, size=0.3 , inherit.aes = FALSE ) +
  geom_segment(data=grid_data, aes(x = end, y = 100, xend = start, yend = 100), colour = "grey", alpha=1, size=0.3 , inherit.aes = FALSE ) +
  geom_segment(data=grid_data, aes(x = end, y = 150, xend = start, yend = 150), colour = "grey", alpha=1, size=0.3 , inherit.aes = FALSE ) +
  geom_segment(data=grid_data, aes(x = end, y = 200, xend = start, yend = 200), colour = "grey", alpha=1, size=0.3 , inherit.aes = FALSE ) +
  
  # Add text showing the value of each 100/75/50/25 lines
  # ggplot2::annotate("text", x = rep(max(data$id),5), y = c(0, 50, 100, 150, 200), label = c("0", "50", "100", "150", "200") , color="grey", size=6 , angle=0, fontface="bold", hjust=1) +
  
  ylim(-150,max(label_data$tot, na.rm=T)) +
  scale_fill_manual(breaks = c("value1", "value2", "value3"), 
                    values=c("#FF3333", "#00CC33", "#6666FF")) + 
  theme_minimal() +
  theme(legend.position = "none",
        axis.text = element_blank(),
        axis.title = element_blank(),
        panel.grid = element_blank(),
        plot.margin = unit(rep(-1,4), "cm") 
  ) +
  coord_polar() +
  
  # Add labels on top of each bar
  geom_text(data=label_data, aes(x=id, y=tot+10, label=individual, hjust=hjust), color="black", fontface="bold",alpha=0.6, size=3, angle= label_data$angle, inherit.aes = FALSE ) 

# Add base line information
# geom_segment(data=base_data, aes(x = start, y = -5, xend = end, yend = -5), colour = "black", alpha=0.8, size=0.6 , inherit.aes = FALSE )  +
# geom_text(data=base_data, aes(x = title, y = -18, label=group), hjust=c(1,1,0,0), colour = "black", alpha=0.8, size=4, fontface="bold", inherit.aes = FALSE)


# Save at png
# ggsave(p, file="output.png", width=10, height=10)
p

