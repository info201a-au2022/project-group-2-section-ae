#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(dplyr)
library(tidyverse)
library(ggplot2)
library(plotly)
library(shinythemes)

statenames <- c("Alabama",	"Alaska",	"Arizona", "Arkansas",
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
            "West.Virginia",	"Wisconsin",	"Wyoming",	"National")

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
      src = "https://pal.ua.edu/wp-content/uploads/2017/08/PAL-Child-Abuse-Neglect-1.jpg", 
      height = "500px", width = "800px",
      style= "position:absolute; left:100px;")
      
),
)
)

chart_1 <- tabPanel(
  "Frequency of Child Abuse", 
  titlePanel("Frequency of Child Victims Based on Age"),
  
  sidebarLayout(
    sidebarPanel(
      
      selectInput(
        inputId = "state",
        label = "state",
        choices = c("Alabama",	"Alaska",	"Arizona", "Arkansas",
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
        multiple = FALSE
      ),
      
      
    ),

    mainPanel(
      
      textOutput("testvar"),
      plotlyOutput("plot"),
    


  p("The chart that is displayed shows the frequency of victims of child abuse 
    sorted by their age. By choosing a state, users can see how the frequency 
    increases or decreases depending on the child's age. It can help users 
    figure out which age experiences child abuse the most or the least. This 
    is important because we can find out the age group that is struggling the 
    most, and we can focus on why they are experiencing it."),
  )
)
)


  chart_2 <- tabPanel(
    "Deaths from Abuse", 
    titlePanel("Comparing Deaths from Child Abuse"),
  
  
    sidebarLayout(
      sidebarPanel(
        
        selectInput(inputId = "state1", label = "State1",
                    choices = statenames, multiple = FALSE
                    ),
        selectInput(inputId = "state2", label = "State2",
                    choices = statenames, multiple = FALSE
                    ),
),
        mainPanel(
          plotlyOutput("graph"),
                

  p("The chart showcases the number of deaths that resulted from cases of 
    child abuse. It compares two states in the U.S to show which state has more 
    or less deaths as the years go by. Users would be able to figure out the 
    state that have more cases of deaths than other states. This is 
    important because we can figure out where cases are most severe in the 
    United States."),
)
)
  )   



  chart_3 <- tabPanel(
    "Forms of Abuse",
    titlePanel("Forms of Child Abuse"),
    
    
    sidebarLayout(
      sidebarPanel(
        
        selectInput(inputId = "state01", label = "State1",
                    choices = statenames, multiple = FALSE
        ),
    
      ),
      mainPanel(
        plotlyOutput("graph1"),

    p("The chart has shows the number of cases of child abuse and the different 
    forms of child abuse in each state. Using this information, one can see the 
    form that is the most common in the selected state. This is important 
      because it can help others recognize signs that are related to each form 
      of abuse, which could decrease the number of child abuse cases."),
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
    h3("Code Name"),
    p("Protect"),
    h3("Project Title"),
    p("For a Better World: Analysis of Child Abuse Cases and Reports from 
    2015-2019 in the United States"),
    h3("Authors"),
    p("Linh Chi Le, Varsha Venkatesan, Sheamin Kim"),
    p("linhchil@uw.edu, vvenk@uw.edu, sheakim2@uw.edu"),
    h3("Affiliation"),
    p("INFO- 201: Technical Foundations of Informatics- The Information School
      - University of Washington"),
    h3("Date"),
    p("Autumn 2022"),
    h3("Abstract"),
    p("Our main question is to ask what the trends regarding different facets 
    of child abuse across the United States are over time. This question is 
    important to understand how, where, and when child abuse happens, so that 
    we can decrease the instances of these cases. To address this question, we 
    will analyze child abuse statistics and data through statistcal analysis 
    and visualizations."),
    h3("Keywords"),
    p("Child abuse, child victims, child neglect, child welfare"),
    h3("Introduction"),
    p("For our project we will be looking at different aspects of child abuse,
      including cases, perpetrators, victim age, and perpetrator relationships
      to get a better understanding of the existence of child abuse in the 
      United States before COVID-19. We will be analyzing trends across time
      (5 years, 2015 to 2019) and across states to find correlations and
      meaningful statistics. We will also focus on the the location of these
      abuse cases. By using data visualizations for every facet (and combining
      facets), we plan to see if there are any serious trends to note. By
      researching and finding data, we want to understand the cases of child
      abuse in the United States in depth and we hope creating visualizations
      will help us understand more about this topic. This project also aims to
      help educate those who are unaware about the trends of child abuse in the
      United States."),
    h3("Problem Domain"),
    p("Our group’s topic is about child abuse, which includes information like
    who gets abused the most, where the cases occur, number of cases, and more.
    We chose to focus on child abuse cases in the United States. Although it is
    a heavy topic, we wanted to know more details about the issue by figuring
    out where, how, and who was involved in child abuse."),
    p("There are a few stakeholders related to this topic. The first
    stakeholder is direct, and it is the children that are experiencing or have
    experienced abuse. Child abuse happens more often that people may think.
    About 1 in 7 kids have been in a situation where he or she have experienced
    abuse, whether it be neglection or physical abuse (CDC, 2022). This
    statistic means that many kids have been abused, which should not be
    happening. Human lives are valueable, but abuse is ruining the lives of
    these kids. Another direct stakeholder is the person who is abusing the
    child. Surprisingly, many of the adults who have caused harm to a child
    were a parent or caretaker (Australian Institute of Family Studies, 2014).
    It is shocking to find out that someone who is supposed to love their
    children are the ones who are abusing them. Some indirect stakeholders are
    policymakers, cops, the government, and judges. Other family members and
    extended family could also be stakeholders."),
    p("There are no benefits for this topic, since child abuse is terrible and
    should not be happening. An obvious harm is that the child is being hurt,
    whether that is emotionally or physically. Another harm is that the child’s
    pain does not stop when the abuser stops harming them. The trauma can
    actually continue years into the child’s life. Research shows that some
    effects include thoughts of suicide, problems with their academic life,
    depression, alcohol issues, trust issues, anxiety, and health problems
    (Mayo Clinic, 2022). These effects can signifcantly impact a person’s
    quality of life. With the datasets that we have access to, we hope to use
    them to see and compare values to each other. Making charts and
    visualizations would help us understand the topic and answer our research
    questions."),
    h3("Research Questions"),
    strong("What type of child abuse is the most common?"),
    p("By understanding what form of child abuse is the most common, it can help 
    us be more aware of signs of abuse. It can also help us  understand whether
    or not a child needs help. Some cases of abuse may go unnoticed, however, 
    by analyzing the types of abuse and seeing which one is most common, we can
    use those signs and see the similarities to look for cases that also have 
    those signs to help the children."),
    strong("What is the age distribution of child abuse cases?"),
    p("In our analysis, we have decided that children are people from birth to 
      the age of 17. We hypothesize that abuse case trends will be different 
      across different ages. By understanding which age group is most at risk, 
      we can provide more specialized care for children who are victims of 
      abuse."),
    strong("What areas in the United States have the most deaths from child 
    abuse?"),
    p("We decided to look into this question because we thought that there may 
    be patterns in which states have more deaths from child abuse compared to 
    others. This could either be from the population or the values and beliefs 
    of some states. There may also not be a pattern. By figuring out what areas
    in the United States has more deaths from child abuse, we could focus on 
    them more to prevent more cases and save childen."),
    h3("The Dataset"),
    h3("Expected Implications"),
    p("A possible implication that technologists, designers, and policymakers
    have is that they could do further research on other factors of child
    abuse. Designers could inform the public and raise awareness to this topic
    by creating and designer infographics with information and statistics on
    child abuse. This could potentially help others be aware of the signs of
    child abuse. Adding on, policymakers could also promote the importance of
    being on the lookout for children who could be experiencing abuse. They
    could also create strict laws to prevent child abuse, or make the harsh
    punishments for people who hurt children. Places like daycares and people
    like babysitters are commonly known to have child abuse in some areas, so
    there could be more rules for those people and places. Technologists could
    figure out how to lessen the cases of child abuse by using technology to
    fix problems. With the power of designers, technologists, and policymakers,
    the issue of child abuse could significantly go away."),
    h3("Limitations"),
    p("A limitation that we thought of is that it may be difficult to get an
    accurate count of how many child abuse cases there are in the United States
    as of right now. This is because some children may currently be
    experiencing abuse right now, but nobody could ever know. Another
    limitation is the definition of abuse. People may have different thoughts
    about what abuse is, depending on their background, where they grew up,
    and how they grew up. Some may even not know that they are being abused.
    They could think that what they are experiencing is normal. This limitation
    also ties into not knowing the most accurate number of child abuse cases.
    Our findings could have a lower number of cases than the actual number in
    real life. Cases that are never found by others or reported by the victims
    would not appear in databases."),
    h3("Findings"),
    p("After completing our Shiny web app, we have been able to figure out the
    answers to our research questions. Our first question was “What type of
    child abuse is the most common?”. In our web app, we included a chart that
    has the number of cases of child abuse for each form of abuse. Users are
    able to select a state in the United States to see the data for each state.
    The types that we included were medical neglect, multiple maltreatment
    types, neglect, other, physical abuse, psychological maltreatment, sex
    trafficking, sexual abuse, and unknown. Out of the nine forms of abuse, we
    thought that physical abuse would be the most common. However, we found out
    that the most common form of abuse was neglect. Physical abuse seemed to be
    the second most common in some states. Our second research question was
    “What is the age distribution of child abuse cases?”. We made another chart
    that displayed the frequency of child victims sorted by their ages.
    Surprisingly, the ages that had the highest rate of abuse are newborns. 
    Children that were less than one year old, one year old, and two years old
    had a higher frequency than those who were around ten or eleven. As the age
    increased, the rate decreased, which was very interesting, and this trend 
    was seen in virtually every state. We hypothesized that this is from
    parents being unable to form a bond with their newborn. It also connects to
    our first research question, since neglection was the most common type of
    child abuse. The babies could have been neglected by their parents, because
    they unfortunately are easier to “forget”. Our final research question was
    “What areas in the United States have the most deaths from child abuse?”
    We thought California would have the most deaths because it has the highest
    population. However, after creating a chart that compares the deaths
    between two states that the user can put in, we find out that Texas has the
    most deaths, even though California has a higher population than Texas.
    This is actually not too surprising because Texas is also a large state
    with a large population. We think that population plays a role in how many
    deaths a state has because the states with a lower population had less
    deaths, while the states with higher populations had more deaths."),
    h3("Discussion"),
    h3("Conclusion"),
    h3("Acknowledgements"),
    p("Special thanks to our teaching assistant Annie Tu for her help and 
      guidance throughout the making of this project."),
    h3("References"),
    h3("Appendix A: Questions"),
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
  
