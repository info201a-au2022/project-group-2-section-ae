#library things
library(tidyverse)
library(ggplot2)
library(dplyr)
library(stringr)

#2: percent of adults from 2001-2021 blood, line graph

data <- read.csv("All Data.csv")

chart2 <- ggplot(data, aes(x = Year, y = Yes)) +
  geom_line() +
  labs(y = "Percent of Adults Who Gave Blood")

chart2
