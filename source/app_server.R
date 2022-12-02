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

# Load in datasets
ages <- read.csv('../data/childvictimsage.csv')
victims <- read.csv('../data/childvictimstrend.csv')
investigation <- read.csv('../data/childinvestigation.csv')
disposition <- read.csv('../data/Children_by_Disposition.csv')
response <- read.csv('../data/Children_Who_Received_an_Investigation_or_Alternative_Response.csv')
maltreatment <- read.csv('../data/Maltreatment_Types_of_Victims.csv')
perp_relation <- read.csv('../data/Perpetrators_by_Relationship_to_Their_Victims.csv')
perp_trend <- read.csv('../data/perps.csv')
referrals <- read.csv('../data/Screened-in_and_Screened-out_Referrals.csv')
other <- read.csv('../data/totaldata.csv')


# PAGE 1 VALUES


# PAGE 2 CHARTS

# chart 1: shiny input: state, ages bar chart, childvistimsage

# WORK ON BAR ORDER

agesdf1 <- ages[-c(1: 20),]

# rownames(agesdf1) <- c("<1", "1", "2", "3", "4", "5", "6", "7",
#                        "8", "9", "10", "11", "12", "13", "14", "15", "16",
#                        "17")

agesdf1$Ages <- str_replace(agesdf1$Ages, " Rate per 1,000 Children", "")
agesdf1$Ages <- factor(agesdf1$Ages) 


# agesdf1 <- agesdf1 %>%
#   mutate(Ages = fct_relevel(Ages, 
#                             "<1", "1", "2", "3", "4", "5", "6", "7",
#                             "8", "9", "10", "11", "12", "13", "14", "15", "16",
#                             "17"))


# chart1fn <- function(data) {
#   
# chart1 <- ggplot(data, aes(x = reorder(Ages, sort(as.numeric(Ages))), y = input$state)) +
#     geom_col()
# 
# return(chart1)
# } 


my_server <- function(input, output){ 
  
  output$plot <- renderPlot({
    
    ggplot(agesdf1, aes(x = Ages, y = input$state)) +
      geom_col(stat = "identity")+
      theme(axis.text.x = element_text(angle = 60, hjust = 1))
    
  })


}
  




# Define server logic required to draw a histogram
# shinyServer(function(input, output) {
# 
#     output$distPlot <- renderPlot({
# 
#         # generate bins based on input$bins from ui.R
#         x    <- faithful[, 2]
#         bins <- seq(min(x), max(x), length.out = input$bins + 1)
# 
#         # draw the histogram with the specified number of bins
#         hist(x, breaks = bins, col = 'darkgray', border = 'white',
#              xlab = 'Waiting time to next eruption (in mins)',
#              main = 'Histogram of waiting times')
# 
#     })
# 
# })



# data <- switch(input$ages, 
#                "Alabama" = ages$Alabama,
#                "Alaska" = ages$Alaska,
#                "Arizona" = ages$Arizona)