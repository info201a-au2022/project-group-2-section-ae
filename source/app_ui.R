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
  
  titlePanel("Title"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      # Select Box for user to choose a color for the bins
      selectInput(
        inputId = "state",
        label = "Choose a state:",
        choices = c("Alabama", "Alaska", "Arizona")
      )
      
    ),
    # Show a plot of the generated distribution
    
    mainPanel(
      
      textOutput("testvar"),
      
      plotOutput("plot")
    )
  )
)
