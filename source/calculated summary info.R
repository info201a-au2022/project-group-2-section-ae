library(tidyverse)

abuse <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-2-section-ae/main/data/totaldata.csv")
library(tidyverse)

abuse <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-2-section-ae/main/data/totaldata.csv")

abusetable <- abuse %>%
  mutate(new_cases = 1) %>%
  group_by(state) %>%
  summarize(cases = sum(new_cases))

abusetable <- abusetable[-c(5), ]

most_state <- function() {
  abusetable <- abuse %>%
    mutate(new_cases = 1) %>%
    group_by(state) %>%
    summarize(cases = sum(new_cases)) %>%
    filter(cases == max(cases)) %>%
    pull(state)
  
}

c <- most_state()


most_year <- function() {
  abusetable <- abuse %>%
    mutate(new_cases = 1) %>%
    group_by(state) %>%
    summarize(cases = sum(new_cases))
  
  
}

