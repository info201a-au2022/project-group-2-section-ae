#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

# Load in libraries
library(shiny)
library(dplyr)
library(tidyverse)
library(ggplot2)
library(plotly)
library(shinythemes)
library(lintr)

# Load in datasets
ages <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-2-section-ae/main/data/childvictimsage.csv")
deaths <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-2-section-ae/main/data/deathsdata.csv")
maltreatment <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-2-section-ae/main/data/maltreatmenttypes.csv")


# subsets ages df to proper rows (no counts just rates)
agesdf1 <- ages[-c(1: 20), ]

# replaces "rate per 1000 children) in each remaining row (for easier readability)
agesdf1$Ages <- str_replace(agesdf1$Ages, " Rate per 1,000 Children", "")

# makes values in the column a factor
agesdf1$Ages <- factor(agesdf1$Ages)

# reformats ages dataframe
agesdf1 <- agesdf1 %>%
  pivot_longer(cols = c("Alabama",	"Alaska",	"Arizona", "Arkansas",
                        "California",	"Colorado",	"Connecticut",
                        "Delaware",	"District.of.Columbia",	"Florida",
                        "Georgia",	"Hawaii",	"Idaho",	"Illinois",
                        "Indiana",	"Iowa",	"Kansas",	"Kentucky",
                        "Louisiana",	"Maine",	"Maryland",	"Massachusetts",
                        "Michigan",	"Minnesota",	"Mississippi",
                        "Missouri",	"Montana",	"Nebraska",	"Nevada",
                        "New.Hampshire",	"New.Jersey",	"New.Mexico",
                        "New.York",	"North.Carolina",	"North.Dakota",
                        "Ohio",	"Oklahoma",	"Oregon",	"Pennsylvania",
                        "Puerto.Rico",	"Rhode.Island",	"South.Carolina",
                        "South.Dakota",	"Tennessee",	"Texas", "Utah",
                        "Vermont",	"Virginia",	"Washington",
                        "West.Virginia",	"Wisconsin",	"Wyoming", "National"),
               names_to = "state", values_to = "rate")

# reformats deaths dataframe
deathsdf1 <- deaths %>%
  pivot_longer(cols = c("Alabama",	"Alaska",	"Arizona", "Arkansas",
                        "California",	"Colorado",	"Connecticut",
                        "Delaware",	"District.of.Columbia",	"Florida",
                        "Georgia",	"Hawaii",	"Idaho",	"Illinois",
                        "Indiana",	"Iowa",	"Kansas",	"Kentucky",
                        "Louisiana",	"Maine",	"Maryland",	"Massachusetts",
                        "Michigan",	"Minnesota",	"Mississippi",
                        "Missouri",	"Montana",	"Nebraska",	"Nevada",
                        "New.Hampshire",	"New.Jersey",	"New.Mexico",
                        "New.York",	"North.Carolina",	"North.Dakota",
                        "Ohio",	"Oklahoma",	"Oregon",	"Pennsylvania",
                        "Rhode.Island",	"South.Carolina",
                        "South.Dakota",	"Tennessee",	"Texas", "Utah",
                        "Vermont",	"Virginia",	"Washington",
                        "West.Virginia",	"Wisconsin",	"Wyoming",	"National"), 
               names_to = "state", values_to = "num")

# deletes unused rows
maltreatmentdf1 <- maltreatment[-c(10: 20), ]

# replaces all onlys with nothing for better readability
maltreatmentdf1$Type <- str_replace(maltreatmentdf1$Type, " Only", "")

# reformats dataframe
maltreatmentdf1 <- maltreatmentdf1 %>%
  pivot_longer(cols = c("Alabama",	"Alaska",	"Arizona", "Arkansas",
                        "California",	"Colorado",	"Connecticut",
                        "Delaware",	"District.of.Columbia",	"Florida",
                        "Georgia",	"Hawaii",	"Idaho",	"Illinois",
                        "Indiana",	"Iowa",	"Kansas",	"Kentucky",
                        "Louisiana",	"Maine",	"Maryland",	"Massachusetts",
                        "Michigan",	"Minnesota",	"Mississippi",
                        "Missouri",	"Montana",	"Nebraska",	"Nevada",
                        "New.Hampshire",	"New.Jersey",	"New.Mexico",
                        "New.York",	"North.Carolina",	"North.Dakota",
                        "Ohio",	"Oklahoma",	"Oregon",	"Pennsylvania",
                        "Puerto.Rico",	"Rhode.Island",	"South.Carolina",
                        "South.Dakota",	"Tennessee",	"Texas", "Utah",
                        "Vermont",	"Virginia",	"Washington",
                        "West.Virginia",	"Wisconsin",	"Wyoming", "National"),
               names_to = "state", values_to = "number")


my_server <- function(input, output) {

  # function filters dataframe with state chosen by user in ui
  choose_state <- reactive({agesdf1 %>%
      filter(state == input$state)
  })

# used to make ages appear in order
  positions <- c("<1", "1", "2", "3", "4", "5",
                 "6", "7", "8", "9", "10",
                 "11", "12", "13", "14", "15",
                 "16", "17")

# outputs chart 1
  output$plot <- renderPlotly({

    ggplot(choose_state()) +
      geom_col(aes(x = Ages, y = rate, fill = state), position = "dodge")+
      scale_x_discrete(limits = positions) +
     # theme(axis.text.x = element_text(angle = 60, hjust = 1)) +
      labs(y = "Rate per 1,000 children")
  })

# filters dataframe with user choice of 2 states 
  chosen_states <- reactive({deathsdf1 %>%
      filter(state == input$state1 | state == input$state2)
  })

# outputs chart 2
  output$graph <- renderPlotly({

    ggplot(chosen_states()) +
      geom_col(aes(x = Year, y = num, fill = state), position = "dodge") +
      labs(y = "Number of Deaths Caused by Child Abuse")
  })

# filters dataframe with user choice of 1 state
  chosen_states1 <- reactive({maltreatmentdf1 %>%
      filter(state == input$state01)
  })

# outputs chart3
  output$graph1 <- renderPlotly({

    ggplot(chosen_states1()) +
      geom_col(aes(x = Type, y = number, fill = state), position = "dodge") +
      theme(axis.text.x = element_text(angle = 60, hjust = 1)) +
      labs(y = "Number of Abuse Cases")
     })

}
