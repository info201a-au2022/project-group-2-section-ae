#library things
library(tidyverse)
library(ggplot2)
library(dplyr)
library(stringr)

#2: bar graph with percent of children by age

agedata <- read.csv("../data/childvictimsage.csv")

agedata2 <- agedata %>%
  filter(row_number() >= 21)

agedata2$Ages <- substr(agedata2$Ages, 1, 2)

chart2 <- ggplot(agedata2, aes(x = Ages, y = National)) +
  geom_col(fill = "cyan4", col = "black")+
  labs(y = "Rate per 1000 children")

chart2
