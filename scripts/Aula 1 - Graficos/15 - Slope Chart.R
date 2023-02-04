#' Author: Bruno Tebaldi de Queiroz Barbosa
#'
#' Data: 2023-02-04
#'
#' Cria um grafico de correlação


# Setup -------------------------------------------------------------------

rm(list=ls())
library(ggplot2)

# Load database -----------------------------------------------------------
df <- readRDS(file = "./databases/Aula 1/SlopePlot.rds")


# Grafico -----------------------------------------------------------------
ggplot(df) +
  geom_vline(xintercept=1, linetype="dashed", size=.1) + 
  geom_vline(xintercept=2, linetype="dashed", size=.1)


ggplot(df) +
  geom_segment(aes(x=1, xend=2, y=Y1952, yend=Y1957, col=class), size=.75, show.legend=F) + 
  geom_vline(xintercept=1, linetype="dashed", size=.1) + 
  geom_vline(xintercept=2, linetype="dashed", size=.1)


ggplot(df) +
  geom_segment(aes(x=1, xend=2, y=Y1952, yend=Y1957, col=class), size=.75, show.legend=F) + 
  geom_vline(xintercept=1, linetype="dashed", size=.1) + 
  geom_vline(xintercept=2, linetype="dashed", size=.1) +
  scale_color_manual(labels = c("Subiu", "Desceu"), 
                     values = c("Up"="#00ba38", "Down"="#f8766d"))  # color of lines


ggplot(df) +
  geom_segment(aes(x=1, xend=2, y=Y1952, yend=Y1957, col=class), size=.75, show.legend=F) + 
  geom_vline(xintercept=1, linetype="dashed", size=.1) + 
  geom_vline(xintercept=2, linetype="dashed", size=.1) +
  scale_color_manual(labels = c("Subiu", "Desceu"), 
                     values = c("Up"="#00ba38", "Down"="#f8766d")) +  # color of lines
  labs(x="", y="Mean GdpPerCap") +  # Axis labels
  xlim(.5, 2.5) + ylim(0,(13000))  # X and Y axis limits


# Add texts
ggplot(df) +
  geom_segment(aes(x=1, xend=2, y=Y1952, yend=Y1957, col=class), size=.75, show.legend=F) + 
  geom_vline(xintercept=1, linetype="dashed", size=.1) + 
  geom_vline(xintercept=2, linetype="dashed", size=.1) +
  scale_color_manual(labels = c("Subiu", "Desceu"), 
                     values = c("Up"="#00ba38", "Down"="#f8766d")) +  # color of lines
  labs(x="", y="Mean GdpPerCap") +  # Axis labels
  xlim(.5, 2.5) + ylim(0,(13000)) +  # X and Y axis limits
  geom_text(mapping = aes(label=continent, y=Y1952, x=rep(1, nrow(df))), hjust=1.1, size=3.5)

ggplot(df) +
  geom_segment(aes(x=1, xend=2, y=Y1952, yend=Y1957, col=class), size=.75, show.legend=F) + 
  geom_vline(xintercept=1, linetype="dashed", size=.1) + 
  geom_vline(xintercept=2, linetype="dashed", size=.1) +
  scale_color_manual(labels = c("Subiu", "Desceu"), 
                     values = c("Up"="#00ba38", "Down"="#f8766d")) +  # color of lines
  labs(x="", y="Mean GdpPerCap") +  # Axis labels
  xlim(.5, 2.5) + ylim(0,(13000)) +  # X and Y axis limits
  geom_text(mapping = aes(label=continent, y=Y1952, x=rep(1, nrow(df))), hjust=1.1, size=3.5) +
  geom_text(mapping = aes(label=continent, y=Y1957, x=rep(2, nrow(df))), hjust=-0.1, size=3.5)




ggplot(df) +
  geom_segment(aes(x=1, xend=2, y=Y1952, yend=Y1957, col=class), size=.75, show.legend=F) + 
  geom_vline(xintercept=1, linetype="dashed", size=.1) + 
  geom_vline(xintercept=2, linetype="dashed", size=.1) +
  scale_color_manual(labels = c("Subiu", "Desceu"), 
                     values = c("Up"="#00ba38", "Down"="#f8766d")) +  # color of lines
  labs(x="", y="Mean GdpPerCap") +  # Axis labels
  xlim(.5, 2.5) + ylim(0,(13000)) +  # X and Y axis limits
  geom_text(mapping = aes(label=continent, y=Y1952, x=rep(1, nrow(df))), hjust=1.1, size=3.5) +
  geom_text(mapping = aes(label=continent, y=Y1957, x=rep(2, nrow(df))), hjust=-0.1, size=3.5) +
  geom_text(mapping = aes(label="Time 1", x=1, y=13000), hjust=1.2, size=5) + # title
  geom_text(mapping = aes(label="Time 2", x=2, y=13000), hjust=-0.1, size=5)


ggplot(df) +
  geom_segment(aes(x=1, xend=2, y=Y1952, yend=Y1957, col=class), size=.75, show.legend=F) + 
  geom_vline(xintercept=1, linetype="dashed", size=.1) + 
  geom_vline(xintercept=2, linetype="dashed", size=.1) +
  scale_color_manual(labels = c("Subiu", "Desceu"), 
                     values = c("Up"="#00ba38", "Down"="#f8766d")) +  # color of lines
  labs(x="", y="Mean GdpPerCap") +  # Axis labels
  xlim(.5, 2.5) + ylim(0,(13000)) +  # X and Y axis limits
  geom_text(mapping = aes(label=continent, y=Y1952, x=rep(1, nrow(df))), hjust=1.1, size=3.5) +
  geom_text(mapping = aes(label=continent, y=Y1957, x=rep(2, nrow(df))), hjust=-0.1, size=3.5) +
  geom_text(mapping = aes(label="Time 1", x=1, y=13000), hjust=1.2, size=5) + # title
  geom_text(mapping = aes(label="Time 2", x=2, y=13000), hjust=-0.1, size=5) +
  theme(axis.ticks = element_blank(),
        axis.text.x = element_blank(),
        plot.margin = unit(c(1,2,1,2), "cm"))


ggsave(filename = "./Graficos/Aula 1/16_Slope.png",units = "in",
       width = 8, height = 6,dpi = 100)
