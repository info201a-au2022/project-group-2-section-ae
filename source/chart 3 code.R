#library things
library(tidyverse)
library(ggplot2)
library(dplyr)
library(stringr)

investdata <- read.csv("../data/childinvestigation.csv")
perpsdata <- read.csv("../data/perps.csv")

chart3data <- merge(investdata, perpsdata, by = "State")

colors <- c("National.x" = "blue", "National.y" = "red")

chart3 <- ggplot(chart3data, aes(x= State, group = 1)) +
  geom_line(aes(x = State, y = National.x), col = "blue") +
  geom_line(aes(x = State, y = National.y * 7, col = "red"), col = "red") +
  scale_y_continuous(sec.axis=sec_axis(~./7,name= "Perpetrators"), labs(y = "Children Investigated"))+
  labs(col = "legend", x = "Year") 



  labs(color = "Legend") +
  scale_color_manual(values = colors)

chart3
