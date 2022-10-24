library(dplyr)
library(tidyr)
library(ggplot2)

n <- 40

# Create dataset
data <- data.frame(
  id=seq(1,n),
  individual=paste( "Mister ", seq(1,n), sep=""),
   value=sample( seq(10,100), n, replace=T),
  value2=sample( seq(10,100), n, replace=T),
  value3=sample( seq(10,100), n, replace=T)
)


data2 <- data %>%
   pivot_longer(cols = starts_with("value"), names_to = "names", values_to = "value")

data2 <- mpg %>% 
  count(manufacturer, drv) %>% 
  rename(names = drv,
         value = n) %>% 
  arrange(manufacturer) %>% mutate(id=row_number())

   

# ----- This section prepare a dataframe for labels ---- #
# Get the name and the y position of each label
label_data <-  mpg %>% 
  count(manufacturer, drv) %>% pivot_wider(names_from = "drv", names_prefix = "D", values_from = "n", values_fill = 0) %>% 
 mutate(id=row_number(), Total = D4+Df+Dr)


# calculate the ANGLE of the labels
number_of_bar <- nrow(label_data)
angle <-  90 - 360 * (label_data$id-0.5) /number_of_bar     # I substract 0.5 because the letter must have the angle of the center of the bars. Not extreme right(1) or extreme left (0)

# calculate the alignment of labels: right or left
# If I am on the left part of the plot, my labels have currently an angle < -90
label_data$hjust<-ifelse( angle < -90, 1, 0)

# flip angle BY to make them readable
label_data$angle<-ifelse(angle < -90, angle+180, angle)
# ----- ------------------------------------------- ---- #


# Start the plot
p <- data2 %>% 
  ggplot( aes(x=manufacturer, y=value)) +       # Note that id is a factor. If x is numeric, there is some space between the first bar
  
  # This add the bars with a blue color
  geom_bar(mapping = aes(fill = names),  stat="identity", position="stack", colour="black", alpha =0.5) +
  
  # Limits of the plot = very important. The negative value controls the size of the inner circle, the positive one is useful to add size over each bar
  ylim(-5,040) +
  
  # Custom the theme: no axis title and no cartesian grid
  theme_minimal() +
  theme(
    axis.text = element_blank(),
    axis.title = element_blank(),
    panel.grid = element_blank(),
    plot.margin = unit(rep(-1,4), "cm")      # Adjust the margin to make in sort labels are not truncated!
  ) +
  
  # This makes the coordinate polar instead of cartesian.
  coord_polar(start = 0) +
  
  # Add the labels, using the label_data dataframe that we have created before
  geom_text(data=label_data,
            aes(x=manufacturer,
                y=Total+1,
                label=manufacturer,
                hjust=hjust),
            color = "black",
            # fontface="bold",
            alpha=0.6,
            # size=2.5,
            angle = label_data$angle,
            inherit.aes = FALSE ) 

p
