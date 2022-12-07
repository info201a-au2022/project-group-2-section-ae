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
      sidebarPanel(
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
    mainPanel(
        img("", 
      src = "PAL-Child-Abuse-Neglect-1.jpeg", height = "500px", width = "800px",
      style= "position:absolute; left:100px;")
      
),
)
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
    


  p("The chart that is displayed shows the frequency of victims of child abuse 
    sorted by their age. By choosing a state, users can see how the frequency 
    increases or decreases depending on the child's age. It can help users 
    figure out which age is more likely to experience child abuse."),
  )
)
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
          plotlyOutput("graph"),
                

  p("The chart showcases the number of deaths that resulted from cases of 
    child abuse. It compares two states in the U.S to show which state has more 
    or less deaths as the years go by. Users would be able to figure out the 
    state that have more cases of deaths than other states."),
)
)
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
        plotlyOutput("graph1"),

    p("The chart has shows the number of cases of child abuse and the different 
    forms of child abuse in each state. Using this information, one can see the 
    form that is the most common in the states."),
    )
    )
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
      than neglection."),
    h4("Conclusion"),
    p("After researching, looking, and working with data about child abuse, 
      we have learned quite a lot in regards of where cases of child abuse 
      happen the most, the different types of abuse, and age groups that 
      experience it the most. The information that we found would be useful for 
      policymakers and other officials to figure out which demographics are more 
      at risk to child abuse. Violence is never the answer, and we hope that 
      everyone is more aware and informed so that this issue gets resolved.")
  )
  report_page <- tabPanel(
    "Report",
    titlePanel("Report Page"),
    h4("Code Name"),
    p("Protect"),
    h4("Project Title"),
    p("For a Better World: Analysis of Child Abuse Cases and Reports from 
    2015-2019 in the United States"),
    h4("Authors"),
    p("Linh Chi Le, Varsha Venkatesan, Sheamin Kim"),
    p("linhchil@uw.edu, vvenk@uw.edu, sheakim2@uw.edu"),
    h4("Affiliation"),
    p("INFO- 201: Technical Foundations of Informatics- The Information School
      - University of Washington"),
    h4("Date"),
    p("Autumn 2022"),
    h4("Abstract"),
    p("Our main question is to ask what the trends regarding different facets 
    of child abuse across the United States are over time. This question is 
    important to understand how, where, and when child abuse happens, so that 
    we can decrease the instances of these cases. To address this question, we 
    will analyze child abuse statistics and data through statistcal analysis 
    and visualizations."),
    h4("Problem Domain"),
    p("PUT SOMETHING HERE"),
    h4("Research Questions"),
    p("INSERT QUESTIONS AND STUFF"),
    h4("The Dataset"),
    h4("Expected Implications"),
    h4("Limitations"),
    h4("Findings"),
    h4("Discussion"),
    h4("Conclusion"),
    h4("Acknowledgements"),
    p("Special thanks to our teaching assistant Annie Tu for her help and 
      guidance throughout the making of this project."),
    h4("References"),
    h4("Appendix A: Questions"),
    p("None"),
    
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
  
