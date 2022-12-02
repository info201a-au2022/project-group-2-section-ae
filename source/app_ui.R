#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
page_ui <- fluidPage(
  
  # Application title
  
  tabPanel(title = "Title",
           titlePanel("Title2"),
  
  sidebarLayout(
    sidebarPanel(

      
      selectInput(
        inputId = "state",
        label = "state",
        choices = agesdf1$state,
        multiple = FALSE
      )

      
    ),
    # Show a plot of the generated distribution
    
    mainPanel(
      
      textOutput("testvar"),
      plotOutput("plot")
    )
  )
  ))

