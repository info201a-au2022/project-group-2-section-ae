library(tidyverse)

abuse <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-2-section-ae/main/data/totaldata.csv")
                  
abuse <- abuse %>%
  mutate(cases = nrow(abuse$cause_of_death))



most_year <- function() {
   abuse %>%
    filter(cases == max(cases)) %>%
    return(year)
}


most_state <- function() {
  abuse %>%
    filter(cases == max(cases))
}

