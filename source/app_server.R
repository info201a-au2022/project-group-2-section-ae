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
library(usmap)

# Load in datasets
ages <- read.csv('../data/childvictimsage.csv')
victims <- read.csv('../data/childvictimstrend.csv')
deaths <- read.csv('../data/deathsdata.csv')
investigation <- read.csv('../data/childinvestigation.csv')
disposition <- read.csv('../data/Children_by_Disposition.csv')
response <- read.csv('../data/Children_Who_Received_an_Investigation_or_Alternative_Response.csv')
maltreatment <- read.csv('../data/maltreatmenttypes.csv')
perp_relation <- read.csv('../data/Perpetrators_by_Relationship_to_Their_Victims.csv')
perp_trend <- read.csv('../data/perps.csv')
referrals <- read.csv('../data/Screened-in_and_Screened-out_Referrals.csv')
other <- read.csv('../data/totaldata.csv')


# PAGE 1 VALUES


# PAGE 2 CHARTS

# chart 1: shiny input: state, ages bar chart, childvistimsage

agesdf1 <- ages[-c(1: 20),]

agesdf1$Ages <- str_replace(agesdf1$Ages, " Rate per 1,000 Children", "")

agesdf1$Ages <- factor(agesdf1$Ages) 

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
                        "South.Dakota",	"Tennessee",	"Texas",	"Utah",	
                        "Vermont",	"Virginia",	"Washington",	
                        "West.Virginia",	"Wisconsin",	"Wyoming",	"National"), 
               names_to = "state", values_to = "rate")


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
                        "South.Dakota",	"Tennessee",	"Texas",	"Utah",	
                        "Vermont",	"Virginia",	"Washington",	
                        "West.Virginia",	"Wisconsin",	"Wyoming",	"National"), 
               names_to = "state", values_to = "num")

  
maltreatmentdf1 <- maltreatment[-c(10: 20),]

maltreatmentdf1$Type <- str_replace(maltreatmentdf1$Type, " Only", "")

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
                        "South.Dakota",	"Tennessee",	"Texas",	"Utah",	
                        "Vermont",	"Virginia",	"Washington",	
                        "West.Virginia",	"Wisconsin",	"Wyoming",	"National"), 
               names_to = "state", values_to = "number")


my_server <- function(input, output){ 
  
  choose_state <- reactive({agesdf1 %>% 
      filter(state == input$state)
  })
  
  positions <- c("<1", "1", "2", "3", "4", "5",
                 "6", "7", "8", "9", "10",
                 "11", "12", "13", "14", "15",
                 "16", "17")
  
  output$plot <- renderPlotly({

    ggplot(choose_state()) +
      geom_col(aes(x = Ages, y = rate, fill = state), position = "dodge")+
      scale_x_discrete(limits = positions) +
      theme(axis.text.x = element_text(angle = 60, hjust = 1))
    
    
  })


  chosen_states <- reactive({deathsdf1 %>% 
      filter(state == input$state1 | state == input$state2)
  })
  
  output$graph <- renderPlotly({
    
    ggplot(chosen_states()) +
      geom_col(aes(x = Year, y = num, fill = state), position = "dodge")
  })
  
  
  chosen_states1 <- reactive({maltreatmentdf1 %>% 
      filter(state == input$state01)
  })
  
  output$graph1 <- renderPlotly({
    
    ggplot(chosen_states1()) +
      geom_col(aes(x = Type, y = number, fill = state), position = "dodge")+
      theme(axis.text.x = element_text(angle = 60, hjust = 1))
    
 
     })

  
}
  

# shiny input: select states (changes number of bins?)
# bar chart by type
# maltreatement types of victims



  mapdf <- other %>%
    filter(year_ == "2015", keep.all = TRUE) %>%
    group_by(state) %>%
    summarize(values = length(which(gender == "F")), na.rm = TRUE)


# This is a plotting function that returns a map that demonstrates how high
# the black jail population is through a gradient of beige to dark blue.

  map1 <- plot_usmap(
    regions = c("state"),
    data = data.frame(mapdf)) +
    include = c("AK", "AL", "AR", "AZ", "CA", "CO", "CT", "DE",
                "FL", "GA", "HI", "IA", "ID", "IL", "IN", "KY",
                "LA", "MA", "MD", "ME", "MI", "MN", "MS", "NC",
                "NE", "NH", "NJ", "OH", "OR", "PA", "RI", "SC",
                "SD", "TN", "TX", "UT", "VA", "VT", "WA", "WI", "WV")+
    scale_fill_continuous(
      low = "beige",
      high = "darkslateblue",
      name = "Female",
      label = scales::comma,
      ) +
    labs(subtitle = "Here is a subtitle",
         caption = "Here is a caption")

map1




