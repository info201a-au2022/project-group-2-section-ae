library(dplyr)
library(tidyverse)
library(ggplot2)
library(stringr)
library(knitr)

# Get data
data <- read.csv("../data/totaldata.csv")

# Get number of cases in each state
aggregate_data <- data %>%
  mutate(new_cases = 1) %>%
  group_by(state) %>%
  summarize(cases = sum(new_cases))

# Remove a row
total_table <- aggregate_data[-c(5), ]

install.packages("shiny")
load(shiny)