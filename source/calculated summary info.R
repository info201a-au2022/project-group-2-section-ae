
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
    summarize(cases = sum(new_cases))
  
  mostcases <- abusetable %>%
    filter(cases = max(cases)) %>%
    pull(state)
  
  return(mostcases)
  
}

most_year <- function() {
  abusetable %>%
    filter(cases == max(cases)) %>%
    return(state)
}

most_state <- function() {
  abuse %>%
    filter(cases == max(cases))
}
