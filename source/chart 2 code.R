#library things
library(tidyverse)
library(ggplot2)
library(dplyr)
library(stringr)

agedata <- read.csv("../data/childvictimsage.csv")

agedata2 <- agedata %>%
  filter(row_number() >= 21)

agedata2$Ages <- substr(agedata2$Ages, 1, 2)

positions <- c("<1", "1 ", "2 ", "3 ", "4 ", "5 ",
               "6 ", "7 ", "8 ", "9 ", "10",
               "11", "12", "13", "14", "15",
               "16", "17")

chart2 <- ggplot(agedata2, aes(x = Ages, y = National)) +
  geom_col(fill = "cyan4", col = "black") +
  scale_x_discrete(limits = positions) +
  labs(y = "Rate per 1000 children")
