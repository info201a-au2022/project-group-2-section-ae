#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
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

#sourcing files
source("app_ui.R")
source("app_server.R")

# Run the application 
shinyApp(ui = page_ui, server = my_server)
