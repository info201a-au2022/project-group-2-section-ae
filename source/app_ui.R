#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

# libraries
library(shiny)
library(dplyr)
library(tidyverse)
library(ggplot2)
library(plotly)
library(shinythemes)

# vector used for choices in later charts
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
            "South.Dakota",	"Tennessee",	"Texas", "Utah",
            "Vermont",	"Virginia",	"Washington",
            "West.Virginia",	"Wisconsin",	"Wyoming", "National")

# Define UI for application that draws a histogram
page_ui <- fluidPage(

  intro_page <- tabPanel(
    "Introduction", 
    titlePanel("Introduction"),

# Creates image on introduction page
   mainPanel(
        img("",
      src = "https://pal.ua.edu/wp-content/uploads/2017/08/PAL-Child-Abuse-Neglect-1.jpg", 
      height = "350px", width = "600px",
      style= "position:absolute; left:100px; margin-top: 450px;"),

# introduction text
      p("Child abuse, while an uncomfortable topic,
    is something that needs to be
    addressed within the United States. Many children are impacted by societal 
    barriers such as racism and sexism, which may be deemed inevitable due to 
    their identity. However, coming home to a safe, loving family is something
    every child should be able to do. Through our project, we intend to analyze
    data surrounding the issue of child abuse in order to better understand
    what policies and regulations should be implemented in order to support
    youth in the United States."),
      p("By asking the research questions:"),
      p("What type of child abuse is the most common?"),
      p("What areas in the United States have the most 
        deaths from child abuse?"),
      p("What is the age distribution of child abuse cases?"),
      p("We seek to find where research into preventative measures should
      begin."),
      p("The data set we analyzed contained 
      various cases of child abuse over the
    span of 5 years. Each case disclosed the year, state, type of child abuse, 
    and whether or not the victim survived. Through our research, we were able
    to find that the most common type of child abuse was neglect. Given that
    knowledge, we are more prepared to tackle issues of inaccessibility and
    allocate appropriate resources to areas that are disproportionately
    impacted. With statistics regarding which states have the highest and
      lowest reported cases of abuse, we will be better able to examine the
      differences that create a safer environment in certain areas compared
      to others. Youth of all ages deserve a safe, nurturing environment to
      grow up in, something we hope to make more accessible by raising
      awareness and educating the public on the issue.")

),
)
)

# displays first chart
 chart_1 <- tabPanel(
  "Frequency of Child Abuse",
  titlePanel("Frequency of Child Victims Based on Age"),

  sidebarLayout(
    sidebarPanel(

# drop down menu to select state
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

      plotlyOutput("plot"),

# chart 1 description
  p("The chart that is displayed shows the frequency of victims of child abuse 
    sorted by their age. By choosing a state, users can see how the frequency 
    increases or decreases depending on the child's age. It can help users 
    figure out which age experiences child abuse the most or the least. This 
    is important because we can find out the age group that is struggling the 
    most, and we can focus on why they are experiencing it."),
  )
)
)

# chart 2 display
  chart_2 <- tabPanel(
    "Deaths from Abuse",
    titlePanel("Comparing Deaths from Child Abuse"),

    sidebarLayout(
      sidebarPanel(

# 2 dropdown menus to select 2 states
        selectInput(inputId = "state1", label = "State1",
                    choices = statenames, multiple = FALSE
                    ),
        selectInput(inputId = "state2", label = "State2",
                    choices = statenames, multiple = FALSE
                    ),
),
        mainPanel(
          plotlyOutput("graph"),

# chart 2 description
  p("The chart showcases the number of deaths that resulted from cases of 
    child abuse. It compares two states in the U.S to show which state has more 
    or less deaths as the years go by. Users would be able to figure out the 
    state that have more cases of deaths than other states. This is 
    important because we can figure out where cases are most severe in the 
    United States."),
)
)
  )

# chart 3
  chart_3 <- tabPanel(
    "Forms of Abuse",
    titlePanel("Forms of Child Abuse"),

    sidebarLayout(
      sidebarPanel(

# dropdown menu for 1 state
        selectInput(inputId = "state01", label = "State1",
                    choices = statenames, multiple = FALSE
        ),
    
      ),
      mainPanel(
        plotlyOutput("graph1"),

# chart 2 description
    p("The chart has shows the number of cases of child abuse and the different 
    forms of child abuse in each state. Using this information, one can see the 
    form that is the most common in the selected state. This is important 
      because it can help others recognize signs that are related to each form 
      of abuse, which could decrease the number of child abuse cases."),
    )
    )
  )

# summary page (takeaways- all text)
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
    p("Our group's topic is about child abuse, which includes information like
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
    whether that is emotionally or physically. Another harm is that the child's
    pain does not stop when the abuser stops harming them. The trauma can
    actually continue years into the child's life. Research shows that some
    effects include thoughts of suicide, problems with their academic life,
    depression, alcohol issues, trust issues, anxiety, and health problems
    (Mayo Clinic, 2022). These effects can signifcantly impact a person's
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
    p("For our datasets, we found 3 data files online. They were all from U.S. 
	Department of Health & Human Services, who got it from the National Child 
	Abuse and Neglect Data Systems (NCANDS). NCANDS is a voluntary data collection
	system that collects data and information about child abuse across the United 
	States. States submit this data annually and voluntarily. This data was all 
	updated in 2021, though it is either from 2019 or from 2015 to 2019. 
	It is used for ongoing research by the Children's Bureau, which is 
	funded by the Department of Health and Human Services. However, 
	it is also accessible to the public so outside researchers can 
	analyze the data as well. Researchers, policy makers, and others who
	are involved with child welfare are the ones to most likely benefit 
	from this research. It is unclear how this data is verified, or if it
	is even verified at all, but we hypothesize that because this data is
	collected by states who input the data voluntarily, that verification
	methods vary by state. Each dataset also has the tag 'Quality Data', 
	so we know it has been verified in some way. It is also not able to be edited
	by anyone outside the aforementioned organizations, so this data is very 
	secure. We obtained this data by searching for datasets related to child 
	welfare, and these were the most conclusive sets we found."),
p("To go more in depth on each individual dataset, we will start by explaining 
each one. The first one is titled 'Child Victims by Age' 
(Child Victims by Age | HealthData.gov, n.d.). It has 54 rows and 39 columns. 
This data is from the last 
fiscal year with data, 2019. It collects the number of child victims as well
as the rate per 1000 children for each state (including Puerto Rico and the 
District of Columbia). These victims include those who died of abuse. The 
ages available in this dataset are age <0 to 17. There is also a column for
unborn children, unknown age, or for ages 18-21, as well as a column for 
total victims in 2019."),
p("Our second dataset is titled 'Child Fatalities Trend' 
(Child Fatalities Trend | HealthData.gov, n.d.). It has 53 rows and 6 columns. 
This dataset has the number 
of fatalities due to child abuse by state from the years 2015-2019. These are 
individual counts, not rates. According to the dataset, 'A child fatality is 
defined as the death of a child as a result of abuse and neglect, because 
either an injury resulting from the abuse and neglect was the cause of death,
or abuse and neglect were contributing factors to the cause of death' 
(Child Fatalities Trend | HealthData.gov, n.d.)."),
p("Our last dataset is titled 'Maltreatment Types of Victims' 
(Maltreatment Types of Victims | HealthData.gov, n.d.). It has 54 rows and 21 columns. 
This dataset looks at 
the different types of maltreatment victims faced by state in the year 2019. 
These are also counts rather than rates. Percents are also calculated for each
type of maltreatment. There are also total victims columns for both percentages
and counts. The types of maltreatment include psychological abuse, sexual abuse,
sex trafficking, unknown abuse, multiple types of abuse, physical abuse, 
medical neglect, neglect, and other."),
    h3("Expected Implications"),
    p("A possible implication that technologists, designers, and policymakers
    have is that they could do further research on other factors of child
    abuse. Designers could inform the public and raise awareness to this topic
    by creating and designing infographics with information and statistics on
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
    answers to our research questions. Our first question was 'What type of
    child abuse is the most common?'. In our web app, we included a chart that
    has the number of cases of child abuse for each form of abuse. Users are
    able to select a state in the United States to see the data for each state.
    The types that we included were medical neglect, multiple maltreatment
    types, neglect, other, physical abuse, psychological maltreatment, sex
    trafficking, sexual abuse, and unknown. Out of the nine forms of abuse, we
    thought that physical abuse would be the most common. However, we found out
    that the most common form of abuse was neglect. Physical abuse seemed to be
    the second most common in some states. Our second research question was
    'What is the age distribution of child abuse cases?'. We made another chart
    that displayed the frequency of child victims sorted by their ages.
    Surprisingly, the ages that had the highest rate of abuse are newborns. 
    Children that were less than one year old, one year old, and two years old
    had a higher frequency than those who were around ten or eleven. As the age
    increased, the rate decreased, which was very interesting, and this trend 
    was seen in virtually every state. We hypothesized that this is from
    parents being unable to form a bond with their newborn. It also connects to
    our first research question, since neglection was the most common type of
    child abuse. The babies could have been neglected by their parents, because
    they unfortunately are easier to 'forget'. Our final research question was
    'What areas in the United States have the most deaths from child abuse?'
    We thought California would have the most deaths because it has the highest
    population. However, after creating a chart that compares the deaths
    between two states that the user can put in, we find out that Texas has the
    most deaths, even though California has a higher population than Texas.
    This is actually not too surprising because Texas is also a large state
    with a large population. We think that population plays a role in how many
    deaths a state has because the states with a lower population had less
    deaths, while the states with higher populations had more deaths."),
    h3("Discussion"),
    p("While our datasets had some limitations, there were still many important 
    and notable findings in our figures and analysis. From our first chart we 
    had a finding that by far most child victims were younger than one year old, 
    and that the number of victims per age (all the way to age 17) steadily 
    decreased. This trend was seen in virtually all states, and we first 
    hypothesized that this is due to newborns being 'easier' to abuse. 
    However, in one of our other figures, we looked at the distribution 
    of maltreatment types in 2019 across states, and found out that for 
    virtually every state, the largest percentage of maltreatment type 
    was neglect. Going hand in hand with newborns being the largest group
    of children who are abused, this indicates that abused newborns are 
    generally neglected rather than physically abused. There is no one 
    theory that demonstrates why children may be neglected, and it is 
    also oftentimes difficult to characterize neglect (Avdibegovic, 2020).
    Is a mother leaving her child alone in an apartment for a short period
    of time because she needs to run errands neglect? Is a parent forgetting
    to get their child's medication one time neglect? However, Child Protective 
    Services (CPS) generally do not become involved until they deem that 
    'parental inaction is deemed a major contributor to a child's needs 
    not being met' (Dubowitz, 2013)."),
 	p("However, there are some common reasons why parents or caretakers neglect 
 	children. One significant reason is the parents- if parents are not raising
 	their children properly or are dealing with feelings of stress, isolation, 
 	or frustration of their own, this can create a situation of child neglect 
 	(Healthy Children, 2019). Our findings imply that it can be difficult for 
 	some parents to simply raise their children or give them the proper attention.
 	To better address child abuse cases, states could provide better parenting and
 	childcare resources, especially to parents of newborns. Not only would this 
 	lower rates of child neglect, but it would also lower the overall rate of 
 	abuse. This finding helps inform better decisions and actions for stakeholders
 	regarding child abuse.
	In our last chart, we looked at the number of deaths per year (2015 to 2019) 
	by each state, with the ability to compare two states. Because the dataset 
	used in this figure did not have death rates (only counts), there is one 
	major caveat to this graph. States with larger populations would show up 
	with higher death rates than states with lower populations, even if the 
	smaller state proportionally had higher deaths. We expected the higher 
	population states (if comparing) to always have more deaths. However, when 
	comparing Texas and California, Texas (a lower population state) had a higher
	death count than California for every year. This finding has multiple 
	implications. One is that Texas has more abusers than most states, which 
	means that investigative action needs to be taken right away. Another 
	implication goes hand in hand with the other two charts, in that Texas 
	parents do not have enough parenting or childcare resources compared to other
	states. Both of these implications require actions taken by policymakers
	on a local to a national scale."),
    h3("Conclusion"),
    h3("Acknowledgements"),
    p("Special thanks to our teaching assistant Annie Tu for her help and 
      guidance throughout the making of this project."),
    h3("References"),
    p("Avdibegovic, E., & Brkic, M. (2020). Child Neglect - Causes and 
      Consequences. Psychiatria Danubina, 32(Suppl 3), 337-342."),
p("CDC. (2021). Preventing Child Abuse & Neglect. Centers for Disease Control 
  and Prevention. 
  https://www.cdc.gov/violenceprevention/childabuseandneglect/fastfact.html"),

p("Child Fatalities Trend | HealthData.gov. (n.d.). Healthdata.gov. 
  https://healthdata.gov/dataset/Child-Fatalities-Trend/u7xm-yva2"),
p("Child Victims by Age | HealthData.gov. (n.d.). Healthdata.gov. 
  https://healthdata.gov/dataset/Child-Victims-by-Age/xn3e-yyaj"),
p("Dubowitz, H. (2013). Neglect in Children. Pediatric Annals, 42(4),
  73-77. https://doi.org/10.3928/00904481-20130326-11"),
p("Healthy Children. (2019). Child Abuse and Neglect. HealthyChildren.org. 
  https://www.healthychildren.org/English/safety-prevention/at-home/Pages/
  What-to-Know-about-Child-Abuse.aspx???"),
p("Maltreatment Types of Victims | HealthData.gov. (n.d.). Healthdata.gov. 
  Retrieved December 8, 2022, from 
  https://healthdata.gov/dataset/Maltreatment-Types-of-Victims/8bce-qw8w"),
p("Mayo Clinic. (2022, May 19). Child abuse - Symptoms and causes. Mayo Clinic. 
  https://www.mayoclinic.org/diseases-conditions/child-abuse/
  symptoms-causes/syc-20370864"),
p("Who abuses children? | Australian Institute of Family Studies. (n.d.). 
  Aifs.gov.au. https://aifs.gov.au/resources/policy-and-practice-papers/
  |who-abuses-children"),
    h3("Appendix A: Questions"),
    p("None"),
)

# creates a navigation bar at the top of entire app
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