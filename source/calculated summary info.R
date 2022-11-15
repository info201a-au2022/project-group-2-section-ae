library(tidyverse)
library(lintr)

abuse <- read.csv("../data/totaldata.csv")

most_state <- function() {
  abusetable <- abuse %>%
    mutate(new_cases = 1) %>%
    group_by(state) %>%
    summarize(cases = sum(new_cases))

  abusetable <- abusetable[-c(5), ]

  mostyear <- abusetable %>%
    filter(cases == max(cases)) %>%
    pull(state)

  return(mostyear)
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

return(leaststatecases)
}


most_year <- function() {
  abuseyeartable <- abuse %>%
    mutate(new_cases = 1) %>%
    group_by(year_) %>%
    summarize(cases = sum(new_cases))

  abuseyeartable <- abuseyeartable[-c(7), ]

mostyearcases <- abuseyeartable %>%
  filter(cases == max(cases)) %>%
  pull(year_)

return(mostyearcases)
}


least_year <- function() {
  abuseyeartable <- abuse %>%
    mutate(new_cases = 1) %>%
    group_by(year_) %>%
    summarize(cases = sum(new_cases))

abuseyeartable <- abuseyeartable[-c(7), ]

leastyearcases <- abuseyeartable %>%
    filter(cases == min(cases)) %>%
    pull(year_)

return(leastyearcases)
}


avg_year <- function() {
  abuseyeartable <- abuse %>%
    mutate(new_cases = 1) %>%
    group_by(year_) %>%
    summarize(cases = sum(new_cases))

abuseyeartable <- abuseyeartable[-c(7), ]

avgcases <- abuseyeartable %>%
    summarize(avgcases = mean(cases))
    pull(avgcases)

return(avgcases)
}

summary_info <- list()
summary_info <- append(summary_info, most_state())
summary_info <- append(summary_info, least_state())
summary_info <- append(summary_info, most_year())
summary_info <- append(summary_info, least_year())
summary_info <- append(summary_info, avg_year())
