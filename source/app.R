#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
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

ages <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-2-section-ae/main/data/childvictimsage.csv")
victims <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-2-section-ae/main/data/childvictimstrend.csv")
deaths <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-2-section-ae/main/data/deathsdata.csv")
investigation <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-2-section-ae/main/data/childinvestigation.csv")
disposition <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-2-section-ae/main/data/Children_by_Disposition.csv")
response <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-2-section-ae/main/data/Children_Who_Received_an_Investigation_or_Alternative_Response.csv")
maltreatment <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-2-section-ae/main/data/maltreatmenttypes.csv")
perp_relation <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-2-section-ae/main/data/Perpetrators_by_Relationship_to_Their_Victims.csv")
perp_trend <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-2-section-ae/main/data/perps.csv")
referrals <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-2-section-ae/main/data/Screened-in_and_Screened-out_Referrals.csv")
other <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-2-section-ae/main/data/totaldata.csv")



source("app_ui.R")
source("app_server.R")

# Run the application 
shinyApp(ui = page_ui, server = my_server)
