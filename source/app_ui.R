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
    p("Through our project, we intend to analyze data surrounding the issue of 
      child abuse in order to better understand what policies and regulations 
      should be implemented in order to support youth in the United States. 
      With statistics regarding which states have the highest and lowest 
      reported cases of abuse, we will be better enabled to examine the 
      differences that create a safer environment in certain areas in 
      comparison to others. Youth of all ages deserve a safe, nurturing 
      environment to grow up in, something we hope to make more accessible by 
      raising awareness and educating the public on the issue.")
),
)

chart_1 <- tabPanel(
  "Chart 1", 
  titlePanel("Frequency of Child Victims"),
  
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
      plotlyOutput("plot"),
    )
  ),
  p("The chart that is displayed shows the frequency of victims of child abuse 
    sorted by their age. By choosing a state, users can see how the frequency 
    increases or decreases depending on the child's age.")
)


  chart_2 <- tabPanel(
    "Chart 2", 
    titlePanel("Deaths from Child Abuse"),
  
  
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
          plotlyOutput("graph")
        ) 
                
      ),
  p("The bar graph showcases the number of deaths that resulted from cases of 
    child abuse. It compares two states in the U.S to show which state has more 
    or less deaths as the years go by.")
)
      



  chart_3 <- tabPanel(
    "Chart 3",
    titlePanel("Forms of Child Abuse"),
    
    
    sidebarLayout(
      sidebarPanel(
        
        selectInput(inputId = "state01", label = "State1",
                    choices = maltreatmentdf1$state, multiple = FALSE
        ),
    
      ),
      mainPanel(
        plotlyOutput("graph1")
      ) 
      
    ),
    p("The chart has shows the number of cases and the different forms of child 
      abuse in each state. Using this information, one can see the form that is 
      the most common in the states.")
    
    
  )
  summary_page <- tabPanel(
    "Summary",
    titlePanel("Summary Takeaways"),
    h4("Takeaway One"),
    p("The first takeaway that we saw is that the frequency of victims of child
      abuse tends to be higher with younger children. With our first chart,
      the general pattern that appeared was that the bars for ages younger than 
      one year old, one year old, and two years old were higher than the 
      victims who were fourteen or fifteen years old. This pattern was seen in 
      every state in the United States. In other words, the frequency of child 
      abuse would decrease as the age increases."),
    h4("Takeaway Two"),
    p("In our analysis, we also learned that the state that had the most cases
      of deaths caused from child abuse was Texas. This shocked us because we 
      expected California to have the most deaths since the population there is 
      higher than Texas. This shows that a place with the highest population 
      does not always correspond to the highest amount of cases in a 
      situation."),
    h4("Takeaway Three"),
    p("Finally, we learned that the most common form of child abuse is 
    neglection. In most cases, when we put a state in the widget shown in chart
      three, the bar that is the highest tends to be under the neglected 
      category. Adding on, we found out that child abuse in the form of sex 
      trafficking seems to be a lot lower compared to the other forms, which 
      was surprising. These findings are significant because people may think 
      of physical and sexual violence when the topic of child abuse, rather 
      than neglection.")
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
  
