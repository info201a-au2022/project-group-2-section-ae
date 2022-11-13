#library things
library(tidyverse)
library(ggplot2)
library(dplyr)
library(stringr)

#3: stacked bar chart ethnicity, blood type, percent, for 1 year

data <- read.csv("ethnicity data.csv")
data2 <- read.csv("2016data.csv")

data2sub <- data2 %>%
  filter(row_number() <= 20, row_number() >= 15)

chart3 <- ggplot(data, aes(fill = Blood.type, x = Ethnicity, y = percent)) + 
  geom_bar(position = "fill", stat = "identity") +
  labs(y = "Percent") +
  scale_fill_discrete(name = "Blood Type")

chart3
