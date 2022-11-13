#library things
library(tidyverse)
library(ggplot2)
library(dplyr)
library(stringr)

#1: age vs donation, matrix histogram (2017, 2019)

#read.csv data in
data <- read.csv("2016data.csv")

# subset data to what i need
subset1 <- data %>%
  filter(row_number() <= 11, row_number() >= 5)
  
subset1$months <- str_replace(subset1$months, " [(].*[)]", "")

# this doesn't work
##subset1$X <- factor(c("18-24", "25-29", "30-39", "40-49", "50-59", "60-69", ">70"))

chart1 <- ggplot(subset1, aes(x = X, y = months)) +
  geom_col(color = "blue", fill = "cyan4")+
  labs(x = "Age Ranges", y = "Percent From Given Blood")

chart1
