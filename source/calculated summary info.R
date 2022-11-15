library(tidyverse)

abuse <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-2-section-ae/main/data/totaldata.csv")
                  
abusetable <- abuse %>%
  mutate(new_cases = 1) %>%
  group_by(state) %>%
  summarize(cases = sum(new_cases))
  
  
  


most_year <- function() {
   abuse %>%
    filter(cases == max(cases)) %>%
    return(year)
}


most_state <- function() {
  abuse %>%
    filter(cases == max(cases))
}

