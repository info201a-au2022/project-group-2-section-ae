#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinythemes)

# Define UI for application that draws a histogram
page_ui <- fluidPage(
  
  intro_page <- tabPanel(
    "Introduction", 
    titlePanel("Introduction"),
),
)

chart_1 <- tabPanel(
  "Chart 1", 
  titlePanel("Insert Name"),
  
  sidebarLayout(
    sidebarPanel(
      
      selectInput(
        inputId = "state",
        label = "state",
        choices = agesdf1$state,
        multiple = FALSE
      ),
      
      
    ),

    mainPanel(
      
      textOutput("testvar"),
      plotOutput("plot"),
    )
  )
)


  chart_2 <- tabPanel(
    "Chart 2", 
    titlePanel("Chart 2"),
  
  
    sidebarLayout(
      sidebarPanel(
        
        selectInput(inputId = "state1", label = "State1",
                    choices = deathsdf1$state, multiple = FALSE
                    ),
        selectInput(inputId = "state2", label = "State2",
                    choices = deathsdf1$state, multiple = FALSE
                    ),
),
        mainPanel(
          plotOutput("graph")
        ) 
                
      )
)
      



  chart_3 <- tabPanel(
    "Chart 3",
    titlePanel("Chart 3"),
    
    
    sidebarLayout(
      sidebarPanel(
        
        selectInput(inputId = "state01", label = "State1",
                    choices = maltreatmentdf1$state, multiple = FALSE
        ),
    
      ),
      mainPanel(
        plotOutput("graph1")
      ) 
      
    )
    
    
  )
  summary_page <- tabPanel(
    "Summary",
    titlePanel("Summary Takeaways")
  )
  report_page <- tabPanel(
    "Report",
    titlePanel("Report Page")
  )

page_ui <- navbarPage(
  theme = shinytheme("yeti"),
  "Analysis of Child Abuse",
  intro_page,
  chart_1,
  chart_2,
  chart_3,
  summary_page,
  report_page
)
  
