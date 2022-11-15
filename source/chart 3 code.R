#library things
library(tidyverse)
library(ggplot2)
library(dplyr)
library(stringr)

investdata <- read.csv("../data/childinvestigation.csv")
perpsdata <- read.csv("../data/perps.csv")

chart3data <- merge(investdata, perpsdata, by = "State")

chart3 <- ggplot(chart3data, aes(x = State, group = 1)) +
  geom_line(aes(x = State, y = National.x, colour = "National.x"),
            col = "blue", size = 1.5) +
  geom_line(aes(x = State, y = National.y * 7, colour = "National.y"),
            size = 1.5) +
  scale_y_continuous(sec.axis = sec_axis(~. / 7, name = "Perpetrators"),
                     labs(y = "Children Investigated")) +
  scale_color_manual(name = "Legend", values =
                       c("Children Investigated" = "blue", "Number of Perpetrators" = "darkgrey")) +
  labs(x = "Year")
