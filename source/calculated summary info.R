library(tidyverse)

abuse <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-2-section-ae/main/data/totaldata.csv")
library(tidyverse)

abuse <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-2-section-ae/main/data/totaldata.csv")

abusetable <- abuse %>%
  mutate(new_cases = 1) %>%
  group_by(state) %>%
  summarize(cases = sum(new_cases))

abusetable <- abusetable[-c(5), ]

most_year <- function() {
  abusetable <- abuse %>%
    mutate(new_cases = 1) %>%
    group_by(state) %>%
    summarize(cases = sum(new_cases)) %>%
    filter(cases == max(cases)) %>%
    pull(state)
}


least_state <- function() {
  abusetable <- abuse %>%
    mutate(new_cases = 1) %>%
    group_by(state) %>%
    summarize(cases = sum(new_cases))
  
abusetable <- abusetable[-c(5), ]
  
leaststatecases <- abusetable %>%
  filter(cases == min(cases)) %>%
  pull(state)
}

abusetable <- abuse %>%
  mutate(new_cases = 1) %>%
  group_by(year_fy) %>%
  summarize(cases = sum(new_cases))

most_year <- function() {
  abusetable <- abuse %>%
    mutate(new_cases = 1) %>%
    group_by(year_fy) %>%
    summarize(cases = sum(new_cases))
  
  abusetable <- abusetable[-c(5), ]
  
mostyearcases <- abusetable %>%
  filter(cases == max(cases)) %>%
  pull(year_fy)
  
}


least_year <- function() {
  abusetable <- abuse %>%
    mutate(new_cases = 1) %>%
    group_by(year_fy) %>%
    summarize(cases = sum(new_cases))
  
  abusetable <- abusetable[-c(5), ]
  
  mostyearcases <- abusetable %>%
    filter(cases == min(cases)) %>%
    pull(year_fy)
}

avg_year <- function() {
  abusetable <- abuse %>%
    mutate(new_cases = 1) %>%
    group_by(year_fy) %>%
    summarize(cases = sum(new_cases))
  
  abusetable <- abusetable[-c(5), ]
  
  avgcases <- abusetable %>%
    summarize(avgcases = mean(cases))
    pull(avgcases)
}


